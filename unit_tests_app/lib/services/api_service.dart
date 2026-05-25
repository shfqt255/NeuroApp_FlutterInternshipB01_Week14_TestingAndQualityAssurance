import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:unit_tests_app/models/user_model.dart';

class ApiService {
  final String baseUrl;

  ApiService({this.baseUrl = 'https://jsonplaceholder.typicode.com/users'});

  Future<List<UserModel>> fetchUsers() async {
    try {
      final response = await http.get(Uri.parse(baseUrl));

      if (response.statusCode == 200) {
        final List<dynamic> users = jsonDecode(response.body);

        return users.map((user) => UserModel.fromJson(user)).toList();
      } else {
        throw Exception('Failed to fetch users: status ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Failed to fetch users: $e');
    }
  }
}
