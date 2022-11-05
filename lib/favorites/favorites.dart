import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:glean_cookbook/utils/firestore.dart';

import 'package:glean_cookbook/favorites/favorite_card.dart';
import 'package:glean_cookbook/utils/models.dart';

class Favorites extends StatelessWidget {
  const Favorites({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: FutureBuilder(
        future: FetchRecipes().getAllRecipes(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return SizedBox(
                height: 230, child: Center(child: CircularProgressIndicator()));
          } else if (snapshot.hasData) {
            var recipes = snapshot.data! as List<Recipe>;
            if (recipes.isNotEmpty) {
              return ListView(
                padding: EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                children: recipes
                    .map((recipe) => FavoriteCard(
                          name: recipe.name,
                          description: recipe.description,
                          image: recipe.image,
                          category: recipe.category,
                          rating: recipe.rating,
                          ingredients: recipe.ingredients,
                        ))
                    .toList(),
              );
            } else {
              return SizedBox(
                height: 230,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      'assets/images/icon.svg',
                      height: 50,
                    ),
                    Text("There seems to be nothing here"),
                  ],
                ),
              );
            }
          }
          return SizedBox(
              height: 230, child: Center(child: Text("Something went wrong")));
        },
      ),
    );
  }
}
