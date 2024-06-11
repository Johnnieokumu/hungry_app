class Recipe {
  final String title;
  final String image;
  final int readyInMinutes;
  final int servings;

  Recipe({
    required this.title,
    required this.image,
    required this.readyInMinutes,
    required this.servings,
  });

  factory Recipe.fromJson(Map<String, dynamic> json) {
    // Extract the image URL from the JSON, handling different structures
    String imageUrl = '';
    if (json['image'] != null) {
      if (json['image'] is String) {
        imageUrl = json['image'] as String;
      } else if (json['image'] is List && json['image'].isNotEmpty) {
        imageUrl = json['image'][0]['hostedLargeUrl'] ?? '';
      }
    }

    // Provide a default image URL if none is found
    imageUrl = imageUrl.isNotEmpty ? imageUrl : 'https://example.com/default-image.png';

    return Recipe(
      title: json['title'] as String,
      image: imageUrl,
      readyInMinutes: json['readyInMinutes'] as int,
      servings: json['servings'] as int,
    );
  }
}
