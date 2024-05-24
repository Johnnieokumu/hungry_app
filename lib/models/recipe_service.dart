import 'dart:convert';
import 'package:http/http.dart' as http;

class SpoonacularService {
  final String apiKey = 'bb19e20b7ebf46cd9f545ebd6a01cb36';
  final String baseUrl = 'https://api.spoonacular.com';

  Future<Map<String, dynamic>> fetchRecipe(String query) async {
    final response = await http.get(Uri.parse('$baseUrl/recipes/complexSearch?query=$query&apiKey=$apiKey'));

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to load recipe');
    }
  }
}
