import 'package:flutter/material.dart';
import 'package:meals_app/widgets/favouraite_button.dart';

import '../models/meal_model.dart';

class MealsInfo extends StatelessWidget {
  const MealsInfo({super.key, required this.meal});
  final Meal meal;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(meal.title),
        actions: [FavButton(meal: meal)],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.network(
              meal.imageUrl,
              height: 300,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 20),
            //Ingredient
            Text(
              "Ingredients",
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.primary,
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const SizedBox(height: 5),
            //using for loop instead of list view
            // for (String item in meal.ingredients)
            //   Text(
            //     item,
            //     style: Theme.of(context).textTheme.bodyMedium!.copyWith(
            //           color: Theme.of(context).colorScheme.onBackground,
            //         ),
            //     textAlign: TextAlign.center,
            //   ),
            ListView.builder(
              shrinkWrap: true,
              itemCount: meal.ingredients.length,
              itemBuilder: (context, index) {
                return Text(
                  meal.ingredients[index],
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: Theme.of(context).colorScheme.onBackground,
                      ),
                  textAlign: TextAlign.center,
                );
              },
            ),
            const SizedBox(height: 20),
            //Steps
            Text(
              "Steps",
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.primary,
                    fontWeight: FontWeight.bold,
                  ),
            ),
            for (String item in meal.steps)
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: Text(
                  item,
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: Theme.of(context).colorScheme.onBackground,
                      ),
                  textAlign: TextAlign.center,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
