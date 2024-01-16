import 'package:flutter/material.dart';
import 'package:meals_app/data/meal_list.dart';
import 'package:meals_app/models/meal_model.dart';
import 'package:meals_app/screens/category_screen.dart';
import 'package:meals_app/widgets/filter_tile.dart';

// bool isGlutenChanged = false;
// bool isLactoseChanged = false;
// bool isVeganChanged = false;
// bool isVegetarianChanged = false;

var kInitialValues = {
  FilterType.glutenFree: false,
  FilterType.lactoseFree: false,
  FilterType.vegan: false,
  FilterType.vegetarian: false,
};
var selectedValues = kInitialValues;

List<Meal> filteredList = mealsList;

class FilterScreen extends StatefulWidget {
  const FilterScreen({
    super.key,
  });

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  bool isFilterOff = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Filter"),
      ),
      body: WillPopScope(
        onWillPop: () async {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => const CategoryScreen(),
            ),
          );
          return false;
        },
        child: ListView(
          children: const [
           
            const FilterTile(
              filterType: FilterType.glutenFree,
              title: "Gluten Free",
            ),
            const FilterTile(
              filterType: FilterType.lactoseFree,
              title: "Lactose Free",
            ),
            const FilterTile(
              filterType: FilterType.vegan,
              title: "Vegan",
            ),
            const FilterTile(
              filterType: FilterType.vegetarian,
              title: "Vegetarian",
            ),
            // TextButton(
            //   onPressed: () {
            //     setState(() {
            //       filteredList = filteredList;
            //     });
            //   },
            //   child: const Text('Refresh'),
            // ),
            // ListView(
            //   shrinkWrap: true,
            //   children: filteredList.map((meals) {
            //     return Text(
            //       meals.title,
            //       style: const TextStyle(color: Colors.white),
            //     );
            //   }).toList(),
            // ),
          ],
        ),
      ),
    );
  }
}
