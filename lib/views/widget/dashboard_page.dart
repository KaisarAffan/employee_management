import 'package:employee_management/utils/routes/my_app_route.dart';
import 'package:employee_management/views/controllers/auth_controller.dart';
import 'package:employee_management/views/controllers/dashboard_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DashboardDrawer extends StatelessWidget {
  DashboardDrawer({super.key});

  final dashboardController = Get.find<DashboardController>();
  final authController = Get.find<AuthController>();
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Colors.grey.shade50,
        child: Obx(() {
          return Column(
            children: [
              Container(
                padding: const EdgeInsets.fromLTRB(24, 60, 24, 32),
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.08),
                      spreadRadius: 0,
                      blurRadius: 20,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    Container(
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                        color: Colors.blue.shade50,
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(
                          color: Colors.blue.shade100,
                          width: 2,
                        ),
                      ),
                      child: Icon(
                        Icons.person,
                        size: 32,
                        color: Colors.blue.shade400,
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Employee App",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              color: Colors.grey.shade800,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            "management@company.com",
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: Colors.grey.shade600,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    children: [
                      _buildMenuItem(
                        icon: Icons.home_outlined,
                        selectedIcon: Icons.home,
                        title: "Home",
                        isSelected:
                            dashboardController.selectedIndex.value == 0,
                        onTap: () {
                          dashboardController.changeMenu(0);
                          Get.back();
                        },
                      ),
                      const SizedBox(height: 8),
                      _buildMenuItem(
                        icon: Icons.people_outline,
                        selectedIcon: Icons.people,
                        title: "Employees",
                        isSelected:
                            dashboardController.selectedIndex.value == 1,
                        onTap: () {
                          dashboardController.changeMenu(1);
                          Get.toNamed(MyAppRoutes.addEmployeePage);
                        },
                      ),

                      const Spacer(),

                      Container(
                        width: double.infinity,
                        height: 1,
                        color: Colors.grey.shade200,
                        margin: const EdgeInsets.symmetric(vertical: 16),
                      ),

                      _buildMenuItem(
                        icon: Icons.logout_outlined,
                        selectedIcon: Icons.logout,
                        title: "Logout",
                        isSelected: false,
                        onTap: () {
                          authController.logout();
                        },
                        isLogout: true,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        }),
      ),
    );
  }

  Widget _buildMenuItem({
    required IconData icon,
    required IconData selectedIcon,
    required String title,
    required bool isSelected,
    required VoidCallback onTap,
    bool isLogout = false,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: isSelected ? Colors.blue.shade50 : Colors.transparent,
        borderRadius: BorderRadius.circular(12),
        border: isSelected
            ? Border.all(color: Colors.blue.shade100, width: 1)
            : null,
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(12),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
            child: Row(
              children: [
                Icon(
                  isSelected ? selectedIcon : icon,
                  size: 22,
                  color: isLogout
                      ? Colors.red.shade400
                      : isSelected
                      ? Colors.blue.shade600
                      : Colors.grey.shade600,
                ),
                const SizedBox(width: 16),
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: isSelected ? FontWeight.w600 : FontWeight.w500,
                    color: isLogout
                        ? Colors.red.shade400
                        : isSelected
                        ? Colors.blue.shade700
                        : Colors.grey.shade700,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
