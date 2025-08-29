import 'dart:convert';

import 'package:employee_management/models/user.dart';
import 'package:http/http.dart' as http;

class EmployeeService {
  static const String baseUrl = "https://reqres.in/api/users";

  static Future<Map<String, dynamic>> fetchEmployees({int page = 1}) async {
    final response = await http.get(
      Uri.parse("$baseUrl?page=$page"),
      headers: {"x-api-key": "reqres-free-v1"},
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return {
        "page": data['page'],
        "total_pages": data['total_pages'],
        "employees": (data['data'] as List)
            .map((e) => UserModel.fromJson(e))
            .toList(),
      };
    } else {
      throw Exception(
        "Failed to fetch employees. Status: ${response.statusCode}",
      );
    }
  }

  static Future<UserModel> createEmployee({
    required String name,
    required String email,
    required String position,
    required int salary,
  }) async {
    final response = await http.post(
      Uri.parse(baseUrl),
      headers: {
        "Content-Type": "application/json",
        "x-api-key": "reqres-free-v1",
      },
      body: jsonEncode({"name": name, "job": position}),
    );

    if (response.statusCode == 201) {
      final data = jsonDecode(response.body);
      final id = data["id"] ?? DateTime.now().millisecondsSinceEpoch.toString();

      return UserModel(
        id: id,
        name: name,
        email: email,
        position: position,
        salary: salary,
        firstName: '',
        lastName: '',
        avatar: '',
      );
    } else {
      throw Exception(
        "Failed to create employee. Status: ${response.statusCode}",
      );
    }
  }
}
