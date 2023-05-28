import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';

import 'package:mealsprovider/screens/categories.dart';
import 'package:mealsprovider/widgets/meal_item_trait.dart';

import '../models/meals.dart';

class MealItem extends StatelessWidget {
  const MealItem({
    required this.meal,
    required this.onSelectMeal,
    super.key,
  });
  final Meal meal;
  final void Function(Meal meal) onSelectMeal;
  String get complexityText {
    return meal.complexity.name[0].toUpperCase() +
        meal.complexity.name.substring(1);
  }

  String get affordabilityText {
    return meal.affordability.name[0].toUpperCase() +
        meal.affordability.name.substring(1);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      clipBehavior: Clip.hardEdge,
      elevation: 2,
      child: InkWell(
        onTap: () {
          onSelectMeal(meal);
        },
        child: Stack(children: [
          Hero(
            tag: meal.id,
            child: FadeInImage(
              fit: BoxFit.cover,
              height: 200,
              width: double.infinity,
              placeholder: MemoryImage(kTransparentImage),
              image: NetworkImage(
                meal.imageUrl,
              ),
            ),
          ),
          Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 6, horizontal: 44),
                color: Colors.black54,
                child: Column(
                  children: [
                    Text(
                      meal.title,
                      maxLines: 2,
                      textAlign: TextAlign.center,
                      softWrap: true,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    12.0.height,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        MealItemTrait(
                          icon: Icons.schedule,
                          label: '${meal.duration} min',
                        ),
                        MealItemTrait(
                          icon: Icons.work,
                          label: '$complexityText ',
                        ),
                        MealItemTrait(
                          icon: Icons.attach_money,
                          label: '$affordabilityText ',
                        ),
                      ],
                    )
                  ],
                ),
              ))
        ]),
      ),
    );
  }
}
