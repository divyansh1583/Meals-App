import 'package:flutter/material.dart';

class MealsDetails extends StatelessWidget {
  const MealsDetails({
    super.key,
    required this.icon,
    required this.text,
    this.wid = 5,
  });

  final double wid;
  final Icon icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        icon,
        SizedBox(width: wid),
        Text(
          text,
          style: const TextStyle(
            color: Colors.white,
          ),
        )
      ],
    );
  }
}
