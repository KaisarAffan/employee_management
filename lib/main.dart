import 'package:employee_management/utils/routes/my_app_page.dart';
import 'package:employee_management/utils/routes/my_app_route.dart';
import 'package:employee_management/utils/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'api/services/superbase_server.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SupabaseServer.init();
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: AppTheme.light,
      debugShowCheckedModeBanner: false,
      getPages: MyAppPage.pages,
      initialRoute: MyAppRoutes.splashScreen,
    );
  }
}
