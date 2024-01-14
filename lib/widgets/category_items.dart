import 'package:flutter/material.dart';
import 'package:meals_app/data/meal_list.dart';
import 'package:meals_app/screens/meals_screen.dart';
import '../models/category_model.dart';

class CategoryItems extends StatelessWidget {
  const CategoryItems({super.key, required this.category});
  final Category category;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) {
            return MealsScreen(
              title: category.title,
              mealsList: mealsList.where((meal) {
                return meal.categories.contains(category.id);
              }).toList(),
              isFavScreen: false,
            );
          }),
        );
      },
      borderRadius: BorderRadius.circular(12),
      splashColor: category.color,
      child: Container(
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          gradient: LinearGradient(
            colors: [
              category.color.withOpacity(0.55),
              category.color.withOpacity(0.9),
            ],
          ),
        ),
        child: Text(
          category.title,
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
                color: Theme.of(context).colorScheme.onBackground,
              ),
        ),
      ),
    );
  }
}
