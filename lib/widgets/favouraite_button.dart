import 'package:flutter/material.dart';

import '../models/meal_model.dart';

class FavButton extends StatefulWidget {
  const FavButton({super.key, required this.meal, this.size = 30});
  final double size;
  final Meal meal;
  @override
  State<FavButton> createState() => _FavButtonState();
}

class _FavButtonState extends State<FavButton> {
  void _changeFav() {
    setState(() {
      widget.meal.isFavouraite = !widget.meal.isFavouraite;
    });
  }

  @override
  Widget build(BuildContext context) {
    bool isFav = widget.meal.isFavouraite;
    return IconButton(
      iconSize: widget.size,
      onPressed: _changeFav,
      icon: isFav ? const Icon(Icons.star) : const Icon(Icons.star_border),
    );
  }
}
