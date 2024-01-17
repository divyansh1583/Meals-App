import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/meal_model.dart';
import '../provider/favourite_provider.dart';

class FavButton extends ConsumerWidget {
  const FavButton({super.key, required this.meal, this.size = 30});
  final double size;
  final Meal meal;
  // bool isFav = false;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    bool isFav = ref.watch(favouriteProvider).contains(meal);
    return IconButton(
      iconSize: size,
      onPressed: () {
        var result = ref.read(favouriteProvider.notifier).toggleFavStatus(meal);
        ScaffoldMessenger.of(context).removeCurrentSnackBar();
        ScaffoldMessenger.of(context).showSnackBar(
          result
              ? const SnackBar(content: Text("Meal Added"))
              : const SnackBar(content: Text('Meal Removed')),
        );
      },
      icon: isFav ? const Icon(Icons.star) : const Icon(Icons.star_border),
      // icon: const Icon(Icons.star),
    );
  }
}
