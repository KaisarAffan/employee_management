import 'dart:convert';

import 'package:http/http.dart' as http;

class AuthService {
  static const baseUrl = "https://reqres.in/api";
  static const headers = {"x-api-key": "reqres-free-v1"};

  static Future<Map<String, dynamic>> login(
    String email,
    String password,
  ) async {
    final response = await http.post(
      Uri.parse("$baseUrl/login"),
      headers: headers,
      body: {"email": email, "password": password},
    );

    return _handleResponse(response);
  }

  static Future<Map<String, dynamic>> register(
    String email,
    String password,
  ) async {
    final response = await http.post(
      Uri.parse("$baseUrl/register"),
      headers: headers,
      body: {"email": email, "password": password},
    );

    return _handleResponse(response);
  }

  static Future<bool> logout() async {
    final response = await http.post(
      Uri.parse("$baseUrl/logout"),
      headers: headers,
    );
    return response.statusCode == 200;
  }

  static Map<String, dynamic> _handleResponse(http.Response response) {
    final data = jsonDecode(response.body);
    if (response.statusCode == 200) {
      return data;
    } else {
      throw Exception(data['error'] ?? "Terjadi kesalahan");
    }
  }
}
