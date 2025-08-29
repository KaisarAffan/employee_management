import 'package:employee_management/models/user.dart';
import 'package:get_storage/get_storage.dart';

class EmployeeLocalService {
  final _box = GetStorage();
  final _key = "employees";

  /// ambil semua employee dari storage
  List<UserModel> getEmployees() {
    final data = _box.read<List>(_key) ?? [];
    return data.map((e) => UserModel.fromJson(e)).toList();
  }

  /// simpan seluruh list employee ke storage
  void saveEmployees(List<UserModel> employees) {
    final jsonList = employees
        .map(
          (e) => {
            "id": e.id,
            "email": e.email,
            "first_name": e.firstName,
            "last_name": e.lastName,
            "avatar": e.avatar,
            "position": e.position,
            "salary": e.salary,
          },
        )
        .toList();
    _box.write(_key, jsonList);
  }

  /// update employee tertentu
  void updateEmployee(UserModel updated) {
    final employees = getEmployees();
    final index = employees.indexWhere((e) => e.id == updated.id);
    if (index != -1) {
      employees[index] = updated;
      saveEmployees(employees);
    }
  }
}
