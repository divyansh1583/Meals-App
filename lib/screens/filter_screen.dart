import 'package:flutter/material.dart';
import 'package:meals_app/models/meal_model.dart';
import '../data/meal_list.dart';

bool isGlutenChanged = false;
bool isLactoseChanged = false;
bool isVeganChanged = false;
bool isVegetarianChanged = false;
List<Meal> filteredList = filteredList = mealsList;

class FilterScreen extends StatefulWidget {
  const FilterScreen({
    super.key,
  });

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  void filter(FilterType filterType) {
    if (filterType == FilterType.glutenFree) {
      filteredList = filteredList.where((meals) => meals.isGlutenFree).toList();
    } else if (filterType == FilterType.lactoseFree) {
      filteredList =
          filteredList.where((meals) => meals.isLactoseFree).toList();
    } else if (filterType == FilterType.vegan) {
      filteredList = filteredList.where((meals) => meals.isVegan).toList();
    } else if (filterType == FilterType.vegetarian) {
      filteredList = filteredList.where((meals) => meals.isVegetarian).toList();
    }
  }

  void unfilter(FilterType filterType) {
    setState(() {
      if (filterType == FilterType.glutenFree) {
        filteredList = mealsList.where((meal) => !meal.isGlutenFree).toList();
      } else if (filterType == FilterType.lactoseFree) {
        filteredList = mealsList.where((meal) => !meal.isLactoseFree).toList();
      } else if (filterType == FilterType.vegan) {
        filteredList = mealsList.where((meal) => !meal.isVegan).toList();
      } else if (filterType == FilterType.vegetarian) {
        filteredList = mealsList.where((meal) => !meal.isVegetarian).toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Filter"),
      ),
      body: ListView(
        children: [
          //gluten
          ListTile(
            contentPadding: const EdgeInsets.all(10),
            leading: const SizedBox(width: 5),
            title: Text(
              "Gluten free",
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(color: Theme.of(context).colorScheme.primary),
            ),
            trailing: Switch(
              value: isGlutenChanged,
              onChanged: (value) {
                setState(() {
                  isGlutenChanged = value;
                });
                if (isGlutenChanged) {
                  filter(FilterType.glutenFree);
                } else {
                  unfilter(FilterType.glutenFree);
                }
              },
            ),
          ),
          //lactose
          ListTile(
            contentPadding: const EdgeInsets.all(10),
            leading: const SizedBox(width: 5),
            title: Text(
              "Lactose free",
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(color: Theme.of(context).colorScheme.primary),
            ),
            trailing: Switch(
              value: isLactoseChanged,
              onChanged: (value) {
                setState(() {
                  isLactoseChanged = value;
                });
                if (isLactoseChanged) {
                  filter(FilterType.lactoseFree);
                } else {
                  unfilter(FilterType.lactoseFree);
                }
              },
            ),
          ),
          //vegan
          ListTile(
            contentPadding: const EdgeInsets.all(10),
            leading: const SizedBox(width: 5),
            title: Text(
              "Vegan",
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(color: Theme.of(context).colorScheme.primary),
            ),
            trailing: Switch(
              value: isVeganChanged,
              onChanged: (value) {
                setState(() {
                  isVeganChanged = value;
                });
                if (isVeganChanged) {
                  filter(FilterType.vegan);
                } else {
                  unfilter(FilterType.vegan);
                }
              },
            ),
          ),
          // vegetarian
          ListTile(
            contentPadding: const EdgeInsets.all(10),
            leading: const SizedBox(width: 5),
            title: Text(
              "Vegetarian",
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(color: Theme.of(context).colorScheme.primary),
            ),
            trailing: Switch(
              value: isVegetarianChanged,
              onChanged: (value) {
                setState(() {
                  isVegetarianChanged = value;
                });
                if (isVegetarianChanged) {
                  filter(FilterType.vegetarian);
                } else {
                  unfilter(FilterType.vegetarian);
                }
              },
            ),
          ),
          const SizedBox(height: 5),
        ],
      ),
    );
  }
}
