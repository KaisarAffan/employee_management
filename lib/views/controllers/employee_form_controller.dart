import 'package:employee_management/models/user.dart';
import 'package:employee_management/utils/services/employee_local_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EmployeeFormController extends GetxController {
  final formKey = GlobalKey<FormState>();

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final jobController = TextEditingController();
  final salaryController = TextEditingController();

  final localService = EmployeeLocalService();

  UserModel? editingEmployee;

  void setEditingEmployee(UserModel? employee) {
    editingEmployee = employee;
    if (employee != null) {
      nameController.text = employee.fullName;
      emailController.text = employee.email;
      jobController.text = employee.position ?? "";
      salaryController.text = employee.salary?.toString() ?? "";
    }
  }

  void saveEmployee() {
    if (formKey.currentState!.validate()) {
      final updated = UserModel.fromForm(
        id:
            editingEmployee?.id ??
            DateTime.now().millisecondsSinceEpoch.toString(),
        email: emailController.text,
        firstName: nameController.text.split(" ").first,
        lastName: nameController.text.split(" ").skip(1).join(" "),
        position: jobController.text,
        salary: int.tryParse(salaryController.text),
        avatar: editingEmployee?.avatar ?? '',
      );

      if (editingEmployee == null) {
        // tambah baru
        final employees = localService.getEmployees();
        employees.add(updated);
        localService.saveEmployees(employees);
      } else {
        // update
        localService.updateEmployee(updated);
      }

      Get.back(result: updated);
      Get.snackbar("Success", "Employee saved successfully");
    }
  }
}
