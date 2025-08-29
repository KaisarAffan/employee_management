import 'package:employee_management/views/controllers/auth_controller.dart';
import 'package:employee_management/views/controllers/dashboard_controller.dart';
import 'package:employee_management/views/controllers/employee_controller.dart';
import 'package:get/get.dart';

class AppBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AuthController>(() => AuthController(), fenix: true);
    Get.lazyPut<EmployeeController>(() => EmployeeController());
    Get.lazyPut<DashboardController>(() => DashboardController());
  }
}
