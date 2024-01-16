import 'package:flutter/material.dart';
import 'package:meals_app/models/meal_model.dart';
import 'package:meals_app/screens/filter_screen.dart';

import '../data/meal_list.dart';

class FilterTile extends StatefulWidget {
  const FilterTile({
    super.key,
    required this.title,
    required this.filterType,
  });
  final String title;
  final FilterType filterType;

  @override
  State<FilterTile> createState() => _FilterTileState();
}

void filter() {
  filteredList = mealsList.where(
    (meals) {
      if (selectedValues[FilterType.glutenFree]! && !meals.isGlutenFree) {
        return false;
      }
      if (selectedValues[FilterType.lactoseFree]! && !meals.isLactoseFree) {
        return false;
      }
      if (selectedValues[FilterType.vegan]! && !meals.isVegan) {
        return false;
      }
      if (selectedValues[FilterType.vegetarian]! && !meals.isVegetarian) {
        return false;
      }
      return true;
    },
  ).toList();
}

class _FilterTileState extends State<FilterTile> {
  @override
  Widget build(BuildContext context) {
    return SwitchListTile(
      title: Text(
        widget.title,
        style: Theme.of(context)
            .textTheme
            .titleLarge!
            .copyWith(color: Theme.of(context).colorScheme.primary),
      ),
      value: selectedValues[widget.filterType]!,
      onChanged: (value) {
        setState(() {
          selectedValues[widget.filterType] = value;
          filter();
        });
      },
    );
  }
}
