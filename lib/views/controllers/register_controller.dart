import 'package:employee_management/api/services/token_storage.dart';
import 'package:employee_management/utils/routes/my_app_route.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class RegisterController extends GetxController {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  var isLoading = false.obs;
  final supabase = Supabase.instance.client;

  Future<void> signup() async {
    if (emailController.text.isEmpty || passwordController.text.isEmpty) {
      Get.snackbar("Error", "Email & Password harus diisi");
      return;
    }

    try {
      isLoading.value = true;

      final response = await supabase.auth.signUp(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );

      if (response.session != null) {
        final token = response.session!.accessToken;

        await JwtStorage.saveToken(token);

        Get.offAllNamed(MyAppRoutes.dashboard);
      } else {
        Get.snackbar(
          "Pendaftaran Berhasil",
          "Silakan cek email untuk verifikasi akun",
        );
        Get.offAllNamed(MyAppRoutes.loginPage);
      }
    } catch (e) {
      Get.snackbar("Error", e.toString());
    } finally {
      isLoading.value = false;
    }
  }
}
