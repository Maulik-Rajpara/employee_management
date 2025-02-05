import 'package:hive/hive.dart';
import '../features/employee/domain/entites/employee_model.dart';

class HiveService {
  static const String _boxName = "employeeBox";

  static Future<void> init() async {
    if (!Hive.isAdapterRegistered(EmployeeModelAdapter().typeId)) {
      Hive.registerAdapter(EmployeeModelAdapter()); // Register adapter only once
    }

    if (!Hive.isBoxOpen(_boxName)) {
      await Hive.openBox<EmployeeModel>(_boxName);
    }
  }

  static Box<EmployeeModel> get box {
    if (!Hive.isBoxOpen(_boxName)) {
      throw Exception("Hive box is not open. Call HiveService.init() first.");
    }
    return Hive.box<EmployeeModel>(_boxName);
  }

  static void addEmployee(EmployeeModel employee) {
    box.put(employee.id, employee);
  }

  static EmployeeModel? getEmployeeById(String id) {
    return  box.get(id);
  }

  static void editEmployee(EmployeeModel employee) {
    box.put(employee.id, employee);
  }

  static void deleteEmployee(String id) {
    box.delete(id);
  }

  static List<EmployeeModel> getEmployees() {
    return box.values.toList();
  }
}
