import 'package:employee_management/utils/routes/my_app_route.dart';
import 'package:employee_management/views/pages/dashboard_page.dart';
import 'package:employee_management/views/pages/employee_detile_page.dart';
import 'package:employee_management/views/pages/employee_form_page.dart';
import 'package:employee_management/views/pages/home_page.dart';
import 'package:employee_management/views/pages/login_page.dart';
import 'package:employee_management/views/pages/profile_page.dart';
import 'package:employee_management/views/pages/register_page.dart';
import 'package:employee_management/views/pages/splashscreen_page.dart';
import 'package:get/get.dart';

class MyAppPage {
  static final List<GetPage> pages = [
    GetPage(
      name: MyAppRoutes.splashScreen,
      page: () => const SplashscreenPage(),
    ),
    GetPage(name: MyAppRoutes.dashboard, page: () => const DashboardPage()),
    GetPage(
      name: MyAppRoutes.addEmployeePage,
      page: () => const EmployeeFormPage(),
    ),
    GetPage(name: MyAppRoutes.homePage, page: () => const HomePage()),
    GetPage(name: MyAppRoutes.loginPage, page: () => const LoginPage()),
    GetPage(name: MyAppRoutes.profilePage, page: () => const ProfilePage()),
    GetPage(
      name: MyAppRoutes.employeDetilePage,
      page: () => const EmployeeDetilePage(),
    ),
    GetPage(name: MyAppRoutes.registerPage, page: () => const RegisterPage()),
  ];
}
