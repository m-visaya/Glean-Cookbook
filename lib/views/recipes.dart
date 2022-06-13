import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:glean_cookbook/views/recipe_card.dart';
import 'package:glean_cookbook/views/recipe_card_grid.dart';

import 'Recipe.dart';

class Recipes extends StatelessWidget {
  Recipes({Key? key}) : super(key: key);

  Future<DocumentSnapshot<Map<String, dynamic>>> user = FirebaseFirestore
      .instance
      .collection('users')
      .doc('88Yf5wM0axQB6LjnTTlg')
      .get();

  Stream<List<Recipe>> fetchRecipes() => FirebaseFirestore.instance
      .collection('recipes')
      .snapshots()
      .map((snapshot) =>
          snapshot.docs.map((doc) => Recipe.fromJson(doc.data())).toList());

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
              child: Text(
                "Community Picks",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w400,
                  height: 1,
                ),
              ),
            ),
            FutureBuilder<DocumentSnapshot>(
              future: user,
              builder: (BuildContext context,
                  AsyncSnapshot<DocumentSnapshot> snapshot) {
                // Future<Iterable<MapEntry<String, dynamic>>> values =
                //     FirebaseFirestore.instance
                //         .collection('users')
                //         .doc('88Yf5wM0axQB6LjnTTlg')
                //         .get()
                //         .then((value) => value.data()!.entries);

                // values.then((value) => print(value));
                if (snapshot.hasError) {
                  return Text("Something went wrong");
                }
                // print(snapshot);
                if (snapshot.hasData && snapshot.data == null) {
                  return Text("Document does not exist");
                }

                if (snapshot.connectionState == ConnectionState.done) {
                  Map<String, dynamic>? data =
                      snapshot.data!.data() as Map<String, dynamic>?;

                  return Text("Welcome ${data!['email']}");

                  // final data = snapshot.data!;
                  // final favorites = data['favorites'].map((data) =>
                  //     data.get().then((DocumentSnapshot documentSnapshot) {
                  //       if (documentSnapshot.exists) {
                  //         return documentSnapshot.get('name');
                  //       }
                  //     }));
                  // print(favorites);
                  // return Text(
                  //     "Full Name: ${data['username']} ${data['email']}");
                }

                return Text("loading");
              },
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                "Suggested For You",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w400,
                  height: 2.8,
                ),
              ),
            ),
            Container(
              height: 300,
              child: StreamBuilder<List<Recipe>>(
                stream: fetchRecipes(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    final recipes = snapshot.data!;
                    return ListView(
                      padding: EdgeInsets.only(left: 10),
                      scrollDirection: Axis.horizontal,
                      children: recipes
                          .map((recipe) => RecipeCard(
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
                    padding: EdgeInsets.only(left: 10),
                    child: CircularProgressIndicator(),
                  );
                  ;
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                "Our Recipes",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w400,
                  height: 2.8,
                ),
              ),
            ),
            Container(
              child: StreamBuilder<List<Recipe>>(
                stream: fetchRecipes(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    final recipes = snapshot.data!;
                    return GridView.count(
                      childAspectRatio: 0.90,
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      crossAxisCount: 2,
                      children: recipes
                          .map((recipe) => RecipeCardGrid(
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
                    padding: EdgeInsets.only(left: 10),
                    child: CircularProgressIndicator(),
                  );
                  ;
                },
              ),
            ),
          ],
        ),
      ],
    );
  }
}
