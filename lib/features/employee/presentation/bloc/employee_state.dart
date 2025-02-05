import 'package:equatable/equatable.dart';
import '../../domain/entites/employee_model.dart';


class EmployeeState extends Equatable {
  final List<EmployeeModel> employees;
  final bool isFormValid;
  final EmployeeModel? lastDeletedEmployee;

  const EmployeeState({required this.employees, required this.isFormValid,this.lastDeletedEmployee,});

  EmployeeState copyWith({
    List<EmployeeModel>? employees,
    bool? isFormValid,
    EmployeeModel? lastDeletedEmployee,
  }) {
    return EmployeeState(
      employees: employees ?? this.employees,
      isFormValid: isFormValid ?? this.isFormValid,
      lastDeletedEmployee: lastDeletedEmployee ?? this.lastDeletedEmployee,
    );
  }

  @override
  List<Object?> get props => [employees, isFormValid, lastDeletedEmployee];
}
