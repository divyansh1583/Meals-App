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
    //changes List<Meal> into List<Widget> with
    //And store in meals
    List<Widget> categoryMeals = mealsList.map((meal) {
      return MealItems(meal: meal);
    }).toList();

    return Scaffold(
      appBar: AppBar(title: Text(title)),
      // drawer: const MainDrawer(),
      body: mealsList.isEmpty
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Uh.. So Sorry!',
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        color: Theme.of(context).colorScheme.primary,
                        fontSize: 45),
                  ),
                  Text(
                    'No meals available',
                    style: Theme.of(context)
                        .textTheme
                        .titleLarge!
                        .copyWith(color: Theme.of(context).colorScheme.primary),
                  ),
                ],
              ),
            )
          : ListView(
              children: categoryMeals,
            ),
    );
  }
}
