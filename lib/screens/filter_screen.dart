import 'package:flutter/material.dart';
import 'package:meals_app/models/meal_model.dart';
import 'package:meals_app/widgets/filter_tile.dart';




class FilterScreen extends StatefulWidget {
  const FilterScreen({
    super.key,
  });

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Filter"),
      ),
      body: ListView(
        children: const [
          FilterTile(
            filterType: FilterType.glutenFree,
            title: "Gluten Free",
          ),
          FilterTile(
            filterType: FilterType.lactoseFree,
            title: "Lactose Free",
          ),
          FilterTile(
            filterType: FilterType.vegan,
            title: "Vegan",
          ),
          FilterTile(
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
    );
  }
}
