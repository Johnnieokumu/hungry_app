import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:hungry_app/models/recipe_model.dart';
import 'package:hungry_app/models/restaurant_model.dart';

class APIService {
  APIService._instantiate();

  static final APIService instance = APIService._instantiate();

  final String _baseUrl = 'api.spoonacular.com';
  static const String API_KEY = 'bb19e20b7ebf46cd9f545ebd6a01cb36';

  // Recipe info
  Future<Recipe> fetchRecipe({required int id}) async {
    Map<String, String> parameters = {
      'apiKey': API_KEY,
    };

    Uri uri = Uri.https(
      _baseUrl,
      '/recipes/$id/information',
      // '/recipes/complexSearch'
      parameters,
    );

    Map<String, String> headers = {
      HttpHeaders.contentTypeHeader: 'application/json',
    };

    try {
      var response = await http.get(uri, headers: headers);
      if (response.statusCode == 200) {
        Map<String, dynamic> data = json.decode(response.body);
        Recipe recipe = Recipe.fromJson(data);
        return recipe;
      } else {
        throw Exception('Failed to load recipe');
      }
    } catch (err) {
      throw Exception(err.toString());
    }
  }
  //Search Restaurants
  Future<List<Restaurant>> searchRestaurant({required int lat, required int lng}) async{
    Map<String, String> parameters = {
      'apiKey': API_KEY,
      'lat': lat.toString(),
      'lng': lng.toString(),
    };

    Uri uri = Uri.https(
      _baseUrl, '/food/restaurants/search',
      parameters,
    );

    Map<String, String> headers = {
      HttpHeaders.contentTypeHeader: 'application/json',
    };

    try {
      var response = await http.get(uri, headers: headers);
      if (response.statusCode == 200) {
        List<dynamic> data = json.decode(response.body)['restaurants'];
        List<Restaurant> restaurants = data.map((restaurantJson)=> Restaurant.fromJson(restaurantJson)).toList();
        return restaurants;
      } else {
        throw Exception('Failed to load restaurant');
      }
    } catch (err) {
      throw Exception(err.toString());
    }
  }
}