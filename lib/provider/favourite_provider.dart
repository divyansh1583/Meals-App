import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/models/meal_model.dart';

class FavouriteProvider extends StateNotifier<List<Meal>> {
  FavouriteProvider() : super([]);

  bool toggleFavStatus(Meal meal) {
    var isExisting = state.contains(meal);
    if (isExisting) {
      state = state.where((meals) => meals.id != meal.id).toList();
      return false;
    } else {
      state = [
        ...state,
        meal
      ]; //making a list with all state meals and selected meal
      return true;
    }
  }
}

final favouriteProvider = StateNotifierProvider<FavouriteProvider, List<Meal>>(
  (ref) => FavouriteProvider(),
);
