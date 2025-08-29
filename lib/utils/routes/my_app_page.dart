import 'package:employee_management/utils/routes/my_app_route.dart';
import 'package:employee_management/views/pages/employee_detile_page.dart';
import 'package:employee_management/views/pages/employee_form_page.dart';
import 'package:employee_management/views/pages/home_page.dart';
import 'package:employee_management/views/pages/login_page.dart';
import 'package:employee_management/views/pages/splashscreen_page.dart';
import 'package:get/get.dart';

class MyAppPage {
  static final List<GetPage> pages = [
    GetPage(name: MyAppRoutes.splashScreen, page: () => SplashscreenPage()),
    GetPage(name: MyAppRoutes.addEmployeePage, page: () => EmployeeFormPage()),
    GetPage(name: MyAppRoutes.homePage, page: () => HomePage()),
    GetPage(name: MyAppRoutes.loginPage, page: () => LoginPage()),
    GetPage(
      name: MyAppRoutes.employeDetilePage,
      page: () => EmployeeDetailPage(),
    ),
  ];
}
