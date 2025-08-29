import 'package:employee_management/utils/services/auth_service.dart';
import 'package:employee_management/utils/services/token_storage.dart';
import 'package:employee_management/utils/routes/my_app_route.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  var userName = ''.obs;
  var userEmail = ''.obs;
  var isAuthenticated = false.obs;
  var isLoading = false.obs;
  final usernameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  Future<void> checkAuth() async {
    await Future.delayed(const Duration(seconds: 2));
    final token = await JwtStorage.getToken();

    if (token != null && token.isNotEmpty) {
      isAuthenticated.value = true;
      loadUserData();
      Get.offAllNamed(MyAppRoutes.homePage);
    } else {
      isAuthenticated.value = false;
      Get.offAllNamed(MyAppRoutes.loginPage);
    }
  }

  void loadUserData() {
    userEmail.value = emailController.text.trim();
    userName.value = userEmail.value.split("@").first;
  }

  Future<void> login() async {
    if (emailController.text.isEmpty || passwordController.text.isEmpty) {
      Get.snackbar("Error", "Email & Password harus diisi");
      return;
    }

    try {
      isLoading.value = true;
      final data = await AuthService.login(
        emailController.text.trim(),
        passwordController.text.trim(),
      );

      final token = data['token'];
      if (token != null) {
        await JwtStorage.saveToken(token);
        loadUserData();
        isAuthenticated.value = true;
        Get.offAllNamed(MyAppRoutes.homePage);
      }
    } catch (e) {
      Get.snackbar("Login Gagal", e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> register(String email, String password) async {
    if (email.isEmpty || password.isEmpty) {
      Get.snackbar("Error", "Email & Password harus diisi");
      return;
    }

    try {
      isLoading.value = true;
      final data = await AuthService.register(email, password);

      final token = data['token'];
      if (token != null) {
        await JwtStorage.saveToken(token);
        emailController.text = email;
        passwordController.text = password;
        loadUserData();
        isAuthenticated.value = true;
        Get.offAllNamed(MyAppRoutes.dashboard);
      }
    } catch (e) {
      Get.snackbar("Register Gagal", e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> logout() async {
    await AuthService.logout();
    await JwtStorage.clearToken();
    emailController.clear();
    passwordController.clear();
    isAuthenticated.value = false;
    userName.value = '';
    userEmail.value = '';
    Get.offAllNamed(MyAppRoutes.loginPage);
  }
}
