import 'package:employee_management/views/controllers/splashscreen_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashscreenPage extends StatefulWidget {
  const SplashscreenPage({super.key});

  @override
  State<SplashscreenPage> createState() => _SplashscreenPageState();
}

class _SplashscreenPageState extends State<SplashscreenPage> {
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SplashscreenController());

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const FlutterLogo(size: 120),
            const SizedBox(height: 20),
            const Text(
              "Employee Management",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            Obx(
              () => Text(
                controller.isClosed ? "Loading..." : "Starting app...",
                style: const TextStyle(color: Colors.grey),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
