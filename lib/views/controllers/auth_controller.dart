import 'package:employee_management/api/services/token_storage.dart';
import 'package:employee_management/utils/routes/my_app_route.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class LoginController extends GetxController {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  var isLoading = false.obs;

  final supabase = Supabase.instance.client;

  Future<void> login() async {
    if (emailController.text.isEmpty || passwordController.text.isEmpty) {
      Get.snackbar("Error", "Email & Password harus diisi");
      return;
    }

    try {
      isLoading.value = true;

      final response = await supabase.auth.signInWithPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );

      if (response.session != null) {
        final token = response.session!.accessToken;

        // simpan token ke GetStorage
        await JwtStorage.saveToken(token);

        Get.offAllNamed(MyAppRoutes.dashboard);
      } else {
        Get.snackbar("Login Gagal", "Email atau password salah");
      }
    } catch (e) {
      Get.snackbar("Error", e.toString());
    } finally {
      isLoading.value = false;
    }
  }
}
