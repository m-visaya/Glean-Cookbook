import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'profile.dart';
import 'recipes.dart';
import 'favorites.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

int currentIndex = 0;

class _MainPageState extends State<HomeScreen> {
  final screens = [Recipes(), Favorites(), Profile()];
  final labelColors = [Colors.lightGreen, Colors.red, Colors.brown];
  final topLabels = ['Recipes', 'Favorites', 'Account'];
  Icon customIcon = const Icon(Icons.search, color: Colors.grey);
  Icon customIcon2 = const Icon(Icons.refresh, color: Colors.grey);
  Widget customSearchBar = Row(
    children: [
      Text(
        "Glean",
        style: TextStyle(color: Colors.lightGreen.shade700),
      ),
      Text(
        "Cookbook",
        style: TextStyle(color: Colors.brown.shade800),
      ),
    ],
  );
  List<Widget> actionList = [];
  var inactive = true;
  @override
  Widget build(BuildContext context) {
    if (inactive) {
      customIcon = const Icon(Icons.search, color: Colors.grey);
      customSearchBar = Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 8),
            child: SvgPicture.asset(
              "images/icon.svg",
              width: 25,
            ),
          ),
          Text(
            "Glean",
            style: TextStyle(color: Colors.lightGreen.shade700),
          ),
          Text(
            "Cookbook",
            style: TextStyle(color: Colors.brown.shade800),
          ),
        ],
      );
    }
    if (currentIndex != 2) {
      actionList = [
        IconButton(
          icon: customIcon,
          onPressed: () {
            setState(() {
              if (customIcon.icon == Icons.search) {
                inactive = false;
                customIcon = const Icon(Icons.sort, color: Colors.grey);
                customSearchBar = ListTile(
                  leading: Builder(
                    builder: (BuildContext context) {
                      return IconButton(
                          icon: const Icon(Icons.arrow_back),
                          onPressed: () {
                            setState(() {
                              inactive = true;
                              customIcon =
                                  const Icon(Icons.search, color: Colors.grey);
                              customSearchBar = Text(topLabels[currentIndex],
                                  style: TextStyle(color: Colors.black));
                            });
                          });
                    },
                  ),
                  title: const TextField(
                    decoration: InputDecoration(
                      hintText: 'Search',
                      hintStyle: TextStyle(
                        color: Colors.grey,
                        fontSize: 18,
                        fontStyle: FontStyle.italic,
                      ),
                      border: InputBorder.none,
                    ),
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                );
              } else {
                //sort
              }
            });
          },
        ),
        IconButton(icon: customIcon2, onPressed: () {})
      ];
    } else {
      setState(() {
        customIcon = const Icon(Icons.search, color: Colors.grey);
        customSearchBar = Text(topLabels[currentIndex],
            style: TextStyle(color: Colors.black));
      });
      actionList = [];
      inactive = true;
    }
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Colors.lightGreen,
        ).copyWith(
          secondary: Colors.brown,
        ),
        textTheme: const TextTheme(bodyText2: TextStyle(color: Colors.black)),
      ),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
            backgroundColor: Colors.grey.shade50,
            elevation: 0,
            title: customSearchBar,
            actions: actionList),
        body: screens[currentIndex],
        bottomNavigationBar: BottomNavigationBar(
            elevation: 0,
            backgroundColor: Colors.grey.shade100,
            selectedFontSize: 12,
            currentIndex: currentIndex,
            onTap: (index) => setState(() => currentIndex = index),
            selectedItemColor: labelColors[currentIndex],
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.local_dining),
                activeIcon: Icon(Icons.local_dining),
                label: 'Recipes',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.favorite),
                activeIcon: Icon(Icons.favorite, color: Colors.red),
                label: 'Favorites',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.account_circle),
                activeIcon: Icon(Icons.account_circle, color: Colors.brown),
                label: ('Account'),
              )
            ]),
      ),
    );
  }
}
