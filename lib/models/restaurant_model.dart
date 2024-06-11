class Restaurant {
  final String name;
  final bool is_open;
  final double rating;
  final String address;
  final int phone_number;


Restaurant({
  required this.name,
  required this.is_open,
  required this.rating,
  required this.address,
  required this.phone_number
});

factory Restaurant.fromJson(Map<String, dynamic> json) {
     return Restaurant(
      name: json['name'] ,
      is_open: json['is_open'] ?? false,
      rating: (json['rating'] as num?)?.toDouble() ?? 0.0,
      address: json['address'] ,
      phone_number: json['phone_number'] ?? '',
    );
  }
}