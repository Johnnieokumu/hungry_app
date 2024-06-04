import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

class APIService{
  APIService._instantiate();


  static final APIService instance = APIService._instantiate();

  final String _baseUrl = 'api.spoonacular.com';
  static const String API_KEY = 'bb19e20b7ebf46cd9f545ebd6a01cb36';
}