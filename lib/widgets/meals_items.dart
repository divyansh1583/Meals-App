import 'package:flutter/material.dart';
import 'package:meals_app/screens/meals_info_screen.dart';
import 'package:meals_app/widgets/favouraite_button.dart';
import 'package:meals_app/widgets/meals_items_details.dart';
import 'package:transparent_image/transparent_image.dart';
import '../models/meal_model.dart';

class MealItems extends StatelessWidget {
  const MealItems({super.key, required this.meal});
  final Meal meal;

  String fCapital(String str) {
    String firstLetter = str.substring(0, 1).toUpperCase();
    String restOfLetter = str.substring(1);

    return firstLetter + restOfLetter;
  }

  void toMealsInfo(BuildContext context, Meal meal) {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => MealsInfo(meal: meal),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.hardEdge,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
      child: InkWell(
        onTap: () {
          toMealsInfo(context, meal);
        },
        child: Stack(
          children: [
            FadeInImage(
              placeholder: MemoryImage(kTransparentImage),
              image: NetworkImage(meal.imageUrl),
              height: 200,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            Positioned(
              bottom: 0,
              right: 0,
              left: 0,
              child: Container(
                color: Colors.black45,
                padding: const EdgeInsets.symmetric(vertical: 7),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      meal.title,
                      style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          color: Theme.of(context).colorScheme.onBackground),
                    ),
                    const SizedBox(height: 5),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        MealsDetails(
                          icon: const Icon(Icons.timer_outlined),
                          text: meal.duration.toString(),
                        ),
                        const SizedBox(width: 20),
                        MealsDetails(
                          icon: const Icon(Icons.work_outlined),
                          text: fCapital(meal.complexity.name),
                        ),
                        const SizedBox(width: 10),
                        MealsDetails(
                          icon: const Icon(
                            Icons.attach_money,
                          ),
                          text: fCapital(meal.affordability.name),
                          wid: 0,
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
            //favButton
            Positioned(
              right: 0,
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.black38,
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(10),
                    // bottomRight: Radius.circular(10),
                  ),
                ),
                child: FavButton(meal: meal),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
