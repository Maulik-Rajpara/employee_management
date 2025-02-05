import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../services/hive_service.dart';
import 'employee_event.dart';
import 'employee_state.dart';

class EmployeeBloc extends Bloc<EmployeeEvent, EmployeeState> {
  EmployeeBloc() : super(EmployeeState(employees: [], isFormValid: false)) {
    _loadEmployees();

    on<AddEmployee>((event, emit) async {
      HiveService.addEmployee(event.employee);
      emit(state.copyWith(employees: HiveService.getEmployees()));
    });

    on<EditEmployee>((event, emit) async {
      HiveService.editEmployee(event.employee);
      emit(state.copyWith(employees: HiveService.getEmployees()));
    });

    on<DeleteEmployee>((event, emit) async {
      final deletedEmployee = HiveService.getEmployeeById(event.id);
      HiveService.deleteEmployee(event.id);

      emit(state.copyWith(
        employees: HiveService.getEmployees(),
        lastDeletedEmployee: deletedEmployee,
      ));
    });

    on<RestoreEmployee>((event, emit) async {
      if (state.lastDeletedEmployee != null) {
        HiveService.addEmployee(state.lastDeletedEmployee!);
        emit(state.copyWith(
          employees: HiveService.getEmployees(),
          lastDeletedEmployee: null,
        ));
      }
    });

    on<ValidateForm>((event, emit) {
      bool isValid = event.name.isNotEmpty && event.role.isNotEmpty;
      emit(state.copyWith(isFormValid: isValid));
    });
  }

  Future<void> _loadEmployees() async {
    final employees = await HiveService.getEmployees();
    emit(state.copyWith(employees: employees));
  }
}
