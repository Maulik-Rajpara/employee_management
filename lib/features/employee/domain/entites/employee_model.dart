
import 'package:hive/hive.dart';

part 'employee_model.g.dart';

@HiveType(typeId: 0)
class EmployeeModel {
  @HiveField(0)
  final String id;

  @HiveField(1)
  final String name;

  @HiveField(2)
  final String role;

  @HiveField(3)
  final String startDate;

  @HiveField(4)
  final String endDate;

  @HiveField(5)
  final bool isPreviousEmployee;

  EmployeeModel({
    required this.id,
    required this.name,
    required this.role,
    required this.startDate,
    required this.endDate,
    required this.isPreviousEmployee,
  });
}
