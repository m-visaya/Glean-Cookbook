import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'Recipe.dart';
import 'favorite_card.dart';

class Favorites extends StatelessWidget {
  const Favorites({Key? key}) : super(key: key);

  Stream<List<Recipe>> fetchRecipes() => FirebaseFirestore.instance
      .collection('recipes')
      .snapshots()
      .map((snapshot) =>
          snapshot.docs.map((doc) => Recipe.fromJson(doc.data())).toList());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: StreamBuilder<List<Recipe>>(
        stream: fetchRecipes(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final recipes = snapshot.data!;
            return ListView(
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
              children: recipes
                  .getRange(5, 9)
                  .map((recipe) => FavoriteCard(
                        name: recipe.name,
                        category: recipe.category,
                        image: recipe.image,
                        rating: recipe.rating,
                        description: recipe.description,
                        ingredients: recipe.ingredients,
                      ))
                  .toList(),
            );
          }
          return Container(
              height: 240,
              padding: EdgeInsets.only(left: 10),
              child: Image.asset(
                "images/logo_loading-fast.gif",
              ));
          ;
        },
      ),
    );
  }
}
