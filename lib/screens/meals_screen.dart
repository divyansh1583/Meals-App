import 'package:flutter/material.dart';
import 'package:meals_app/widgets/meals_items.dart';

import '../models/meal_model.dart';

class MealsScreen extends StatelessWidget {
  const MealsScreen({
    super.key,
    required this.title,
    required this.mealsList,
    required this.isFavScreen,
  });
  final bool isFavScreen;
  final String title;
  final List<Meal> mealsList;

  @override
  Widget build(BuildContext context) {
    
    
    List<Widget> filteredMeals = mealsList.map((meal) {
      return MealItems(meal: meal);
    }).toList();
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: mealsList.isEmpty
          ? const Center(
              child: Text(
                'No meal available!',
                style: TextStyle(color: Colors.white),
              ),
            )
          : ListView(
              children: filteredMeals,
            ),
    );
  }
}
