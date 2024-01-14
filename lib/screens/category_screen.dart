import 'package:flutter/material.dart';
import 'package:meals_app/data/category_list.dart';
import 'package:meals_app/widgets/category_items.dart';
import 'package:meals_app/widgets/main_drawer.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Pick a category')),
      drawer: const MainDrawer(),
      body: GridView(
        padding: const EdgeInsets.all(10),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
        ),
        children: categoryList.map((category) {
          return CategoryItems(category: category);
        }).toList(),
      ),
    );
  }
}
