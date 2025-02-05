
import 'package:equatable/equatable.dart';

import '../../domain/entites/employee_model.dart';

abstract class EmployeeEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class AddEmployee extends EmployeeEvent {
  final EmployeeModel employee;

  AddEmployee(this.employee);

  @override
  List<Object?> get props => [employee];
}

class EditEmployee extends EmployeeEvent {
  final EmployeeModel employee;

  EditEmployee(this.employee);

  @override
  List<Object?> get props => [employee];
}

class DeleteEmployee extends EmployeeEvent {
  final String id;

  DeleteEmployee(this.id);

  @override
  List<Object?> get props => [id];
}
class RestoreEmployee extends EmployeeEvent {}
class ValidateForm extends EmployeeEvent {
  final String name;
  final String role;

  ValidateForm(this.name, this.role);

  @override
  List<Object?> get props => [name, role];
}
