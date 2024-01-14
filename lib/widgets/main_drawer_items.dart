import 'package:flutter/material.dart';

class DrawerItems extends StatelessWidget {
  const DrawerItems({
    super.key,
    required this.title,
    required this.icon,
    required this.func,
  });
  final String title;
  final IconData icon;
  final void Function() func;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      leading: Icon(
        icon,
        size: 40,
      ),
      title: Text(
        title,
        style: TextStyle(
            color: Theme.of(context).colorScheme.onSecondaryContainer,
            fontSize: 22,
            fontWeight: FontWeight.bold),
      ),
      onTap: func,
    );
  }
}
