import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:test/model/category.dart';

class ApiService {
  final String baseUrl = 'https://tp-flutter-test.vercel.app/v1/category';

  Future<List<MainCategory>> fetchCategories() async {
    final response = await http.get(Uri.parse(baseUrl));

    if (response.statusCode == 200) {
      List<dynamic> jsonData = json.decode(response.body);
      return jsonData
          .map((json) => MainCategory.fromJson(json as Map<String, dynamic>))
          .toList();
    } else {
      throw Exception('Failed to load data');
    }
  }
}
