import 'package:flutter/material.dart';

class RecipeCard extends StatelessWidget {
  final String name;
  final String category;
  final String image;
  final String description;
  final Map<String, dynamic> ingredients;
  final double rating;

  const RecipeCard({
    Key? key,
    required this.name,
    required this.category,
    required this.description,
    required this.ingredients,
    required this.image,
    required this.rating,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 10),
      color: Colors.transparent,
      elevation: 0,
      child: InkWell(
        onTap: () {},
        child: Container(
          width: 300,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.network(
                  image,
                  height: 170,
                  width: 300,
                  fit: BoxFit.cover,
                ),
              ),
              Text(
                name,
                maxLines: 1,
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Text(
                category,
                style: TextStyle(
                  fontSize: 14,
                  height: 1.5,
                  color: Colors.black54,
                  fontWeight: FontWeight.w400,
                ),
              ),
              Row(
                children: [
                  Text(
                    "$rating",
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.black54,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Icon(
                    Icons.star,
                    size: 14,
                    color: Colors.black54,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
