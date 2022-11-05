import 'package:flutter/material.dart';

class RecipesChips extends StatefulWidget {
  const RecipesChips({Key? key}) : super(key: key);

  @override
  State<RecipesChips> createState() => _RecipesChipsState();
}

class _RecipesChipsState extends State<RecipesChips> {
  String? _selected = null;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      child: ListView(
        padding: const EdgeInsets.only(left: 10),
        scrollDirection: Axis.horizontal,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ChoiceChip(
              label: Text(
                "Top Recipes",
                style: TextStyle(color: Colors.black87),
              ),
              selected: _selected == "Top Recipes",
              padding: EdgeInsets.all(10),
              disabledColor: Colors.grey.shade300,
              selectedColor: Colors.lightGreen.shade300,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ChoiceChip(
              label: Text(
                "Categories",
                style: TextStyle(color: Colors.black87),
              ),
              selected: _selected == "Categories",
              padding: EdgeInsets.all(10),
              disabledColor: Colors.grey.shade300,
              selectedColor: Colors.lightGreen.shade300,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ChoiceChip(
              label: Text(
                "New Recipes",
                style: TextStyle(color: Colors.black87),
              ),
              selected: _selected == "New Recipes",
              padding: EdgeInsets.all(10),
              disabledColor: Colors.grey.shade300,
              selectedColor: Colors.lightGreen.shade300,
            ),
          ),
        ],
      ),
    );
  }
}
