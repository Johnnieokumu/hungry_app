import 'package:hungry_app/services/api_service.dart';

class Recipe {
  final String title;
  final String image;
  final int readyInMinutes;
  final int servings;

  Recipe(
      {required this.title,
      required this.image,
      required this.readyInMinutes,
      required this.servings});

  factory Recipe.fromJson(dynamic json) {
    return Recipe(
        title: json['title'] as String,
        image: json['image'][0]['hostedLargeUrl'] as String,
        readyInMinutes: json['readyInMinutes'] as int,
        servings: json['servings'] as int);
  }
}
