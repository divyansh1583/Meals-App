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
    //benifit: i can style very drawer item in 
    //cmd otherwise i had to do it again and again(only possible because same style)
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
