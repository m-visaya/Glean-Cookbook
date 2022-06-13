class Recipe {
  final String id;
  final String name;
  final String category;
  final String image;
  final String description;
  final Map<String, dynamic> ingredients;
  final double rating;

  Recipe(
      {required this.image,
      required this.description,
      required this.ingredients,
      required this.rating,
      required this.id,
      required this.name,
      required this.category});

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'category': category,
        'image': image,
        'rating': rating,
        'description': description,
        'ingredients': ingredients,
      };

  static Recipe fromJson(Map<String, dynamic> json) {
    return Recipe(
        name: json['name'],
        category: json['category'],
        image: json['image'],
        rating: json['rating'],
        description: json['description'],
        ingredients: json['ingredients'],
        id: json['id']);
  }
}
