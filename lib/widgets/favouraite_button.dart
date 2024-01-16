import 'package:flutter/material.dart';

import '../models/meal_model.dart';

class FavButton extends StatefulWidget {
  const FavButton({super.key, required this.meal, this.size = 30});
  final double size;
  final Meal meal;
  @override
  State<FavButton> createState() => _FavButtonState();
}

List<Meal> favList = [];

class _FavButtonState extends State<FavButton> {
  void _changeFav() {
    setState(() {
      var isExisting = favList.contains(widget.meal);
      if (isExisting) {
        favList.remove(widget.meal);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("${widget.meal.title} Removed from favourites"),
          ),
        );
      } else {
        favList.add(widget.meal);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("${widget.meal.title} added in favourites"),
          ),
        );
      }
      // isFav = !isFav;
    });
  }

  // bool isFav = false;
  @override
  Widget build(BuildContext context) {
    return IconButton(
      iconSize: widget.size,
      onPressed: _changeFav,
      // icon: isFav ? const Icon(Icons.star) : const Icon(Icons.star_border),
      icon: const Icon(Icons.star),
    );
  }
}
