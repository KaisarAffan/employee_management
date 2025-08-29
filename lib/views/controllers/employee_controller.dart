import 'package:employee_management/models/user.dart';
import 'package:employee_management/utils/services/employee_service.dart';
import 'package:get/get.dart';

class EmployeeController extends GetxController {
  var employees = <UserModel>[].obs;
  var isLoading = false.obs;
  var currentPage = 1.obs;
  var totalPages = 1.obs;
  var searchQuery = "".obs;

  Future<void> fetchEmployees({int page = 1}) async {
    try {
      isLoading.value = true;

      final result = await EmployeeService.fetchEmployees(page: page);

      currentPage.value = result["page"];
      totalPages.value = result["total_pages"];
      employees.value = result["employees"];
    } catch (e) {
      Get.snackbar("Error", e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  List<UserModel> get filteredEmployees {
    if (searchQuery.isEmpty) return employees;
    return employees
        .where(
          (e) =>
              e.fullName.toLowerCase().contains(
                searchQuery.value.toLowerCase(),
              ) ||
              e.email.toLowerCase().contains(searchQuery.value.toLowerCase()),
        )
        .toList();
  }
}
