import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/screens/meals_screen.dart';
import '../models/category_model.dart';
import '../provider/filtered_list_provider.dart';

class CategoryItems extends ConsumerWidget {
  const CategoryItems({super.key, required this.category});
  final Category category;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) {
            return MealsScreen(
              title: category.title,
              mealsList: ref.watch(filteredListProvider).where((list) {
                return list.categories.contains(category.id);
              }).toList(),
              isFavScreen: false,
            );
          }),
        );
      },
      borderRadius: BorderRadius.circular(12),
      splashColor: category.color,
      child: Stack(
        children: [
          Container(
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
          ),
          Positioned(
            top: 10,
            left: 6,
            child: Text(
              category.title,
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
            ),
          ),
          Positioned(
            right: 6,
            top: 0,
            child: Container(
              padding: const EdgeInsets.all(10),
              decoration: const BoxDecoration(
                color: Colors.black26,
                shape: BoxShape.circle,
              ),
              child: Text(
                ref
                    .watch(filteredListProvider)
                    .where((list) {
                      return list.categories.contains(category.id);
                    })
                    .toList()
                    .length
                    .toString(),
                style: const TextStyle(color: Colors.white, fontSize: 18),
              ),
            ),
          )
        ],
      ),
    );
  }
}
