import 'package:employee_management/api/services/token_storage.dart';
import 'package:employee_management/utils/routes/my_app_route.dart';
import 'package:get/get.dart';

class SplashscreenController extends GetxController {
  @override
  void onReady() {
    super.onReady();
    _checkAuth();
  }

  void _checkAuth() async {
    await Future.delayed(const Duration(seconds: 2));

    final token = JwtStorage.getToken();

    if (token != null && token.isNotEmpty) {
      // TODO: nanti validasi token ke server
      Get.offAllNamed(MyAppRoutes.dashboard);
    } else {
      Get.offAllNamed(MyAppRoutes.loginPage);
    }
  }
}
