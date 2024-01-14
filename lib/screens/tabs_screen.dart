import 'package:flutter/material.dart';
import 'package:meals_app/data/meal_list.dart';
import 'package:meals_app/screens/category_screen.dart';
import 'package:meals_app/screens/meals_screen.dart';

import '../models/meal_model.dart';

class TabScreen extends StatefulWidget {
  const TabScreen({super.key});

  @override
  State<TabScreen> createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  int currentindex = 0;

  @override
  Widget build(BuildContext context) {
    List<Meal> temp = mealsList.where((meal) {
      return meal.isFavouraite;
    }).toList();
    return Scaffold(
      body: <Widget>[
        const CategoryScreen(),
        MealsScreen(title: 'Favouraite', mealsList: temp, isFavScreen: true)
      ][currentindex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentindex,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.category_outlined),
            activeIcon: Icon(Icons.category_rounded),
            label: "Category",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star_border_rounded),
            activeIcon: Icon(Icons.star_rate_rounded),
            label: "Favoraites",
          ),
        ],
        onTap: (index) {
          setState(() {
            currentindex = index;
          });
        },
      ),
    );
  }
}
