import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  static const String baseUrl = 'http://127.0.0.1:8000/api'; // Replace with your backend's base URL.

  // Login API
  static Future<Map<String, dynamic>> login(String email, String password) async {
    final response = await http.post(
      Uri.parse('$baseUrl/login'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'email': email, 'password': password}),
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body); // Success response
    } else {
      throw Exception('Login failed: ${response.body}');
    }
  }
  // Fetch all products
  static Future<List<dynamic>> fetchProducts() async {
    final response = await http.get(
      Uri.parse('$baseUrl/products'), // Replace with your endpoint for fetching products
      headers: {
        'Content-Type': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body)['data']; // Assuming the response is in { "data": [...] }
    } else {
      throw Exception('Failed to load products');
    }
  }
}
