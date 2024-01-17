import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/data/meal_list.dart';
import 'package:meals_app/models/meal_model.dart';

class FilterProvider extends StateNotifier<Map<FilterType, bool>> {
  FilterProvider()
      : super({
          FilterType.glutenFree: false,
          FilterType.lactoseFree: false,
          FilterType.vegan: false,
          FilterType.vegetarian: false,
        });

  void updateFilter(FilterType filterType, bool value) {
    state = {...state, filterType: value};
  }
}

final filterProvider =
    StateNotifierProvider<FilterProvider, Map<FilterType, bool>>(
        (ref) => FilterProvider());

final filteredListProvider = Provider(
  (ref) {
    final selectedValues = ref.watch(filterProvider);
    return mealsList.where(
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
  },
);
