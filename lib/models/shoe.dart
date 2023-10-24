class Shoe {
  final int id;
  final String name;
  final String price;
  final String imagePath;
  final String description;

  Shoe(
      {required this.id,
      required this.name,
      required this.price,
      required this.imagePath,
      required this.description});

  // factory Shoe.fromJson(Map<String, dynamic> json) {
  //   final imageUrl = json['image'] as String?;

  //   if (imageUrl != null && imageUrl.isNotEmpty) {
  //     print('Image URL: $imageUrl');
  //   } else {
  //     print('imageUrl is empty');
  //   }
  //   return Shoe(
  //       name: json['name'] ?? '',
  //       price: json['price'] ?? '',
  //       imagePath: imageUrl ?? 'Something went wrong',
  //       description: json['description'] ?? '');
  // }
}
