import 'package:flutter/material.dart';
import 'package:meals_app/screens/category_screen.dart';
import 'package:meals_app/screens/filter_screen.dart';
import 'main_drawer_items.dart';

class MainDrawer extends StatefulWidget {
  const MainDrawer({super.key});

  @override
  State<MainDrawer> createState() => _MainDrawerState();
}

class _MainDrawerState extends State<MainDrawer> {
  @override
  Widget build(BuildContext context) {
    var color = Theme.of(context).colorScheme;
    return Drawer(
      child: ListView(
        shrinkWrap: true,
        padding: EdgeInsets.zero,
        children: [
          //Drawer Head
          DrawerHeader(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                end: Alignment.topLeft,
                begin: Alignment.bottomRight,
                colors: [
                  color.primaryContainer.withOpacity(0.8),
                  color.primaryContainer.withOpacity(0.6),
                ],
              ),
            ),
            child: Row(
              children: [
                Icon(
                  Icons.fastfood_outlined,
                  size: 50,
                  color: color.primary,
                ),
                const SizedBox(width: 18),
                Text(
                  "Cooking Up!",
                  style: TextStyle(
                    color: color.primary,
                    fontSize: 22,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          //Drawer Items
          DrawerItems(
            title: "Home",
            icon: Icons.dining_outlined,
            func: () {
              // Navigator.of(context).pop();
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const CategoryScreen(),
                ),
              );
            },
          ),
          DrawerItems(
            title: "Filter",
            icon: Icons.filter_alt_outlined,
            func: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const FilterScreen(),
              ));
            },
          ),
          //
        ],
      ),
    );
  }
}
