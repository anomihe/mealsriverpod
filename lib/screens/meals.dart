import 'package:flutter/material.dart';
import 'package:mealsprovider/screens/categories.dart';
import 'package:mealsprovider/screens/meal_detials.dart';

import '../models/meals.dart';
import '../widgets/meal_item.dart';

class MealsScreen extends StatelessWidget {
  const MealsScreen({
    super.key,
    required this.meals,
    this.title,
    //   required this.onToggleFavorite,
  });
  final String? title;
  final List<Meal> meals;
  // final void Function(Meal meal) onToggleFavorite;
  void selectMeal(BuildContext context, Meal meal) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (context) {
        return MealDetailsScreen(
          meal: meal,
          //   onToggleFavorite: onToggleFavorite,
        );
      }),
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget content = ListView.builder(
        itemCount: meals.length,
        itemBuilder: (context, index) {
          return MealItem(
            meal: meals[index],
            // onSelectMeal: selectMeal,
            onSelectMeal: (meals) {
              selectMeal(context, meals);
            },
          );
        });
    if (meals.isEmpty) {
      content = Center(
        child: Column(
          children: [
            Text(
              'Uh oh ... nothing here!',
              style: Theme.of(context)
                  .textTheme
                  .headlineLarge!
                  .copyWith(color: Theme.of(context).colorScheme.onBackground),
            ),
            16.0.height,
            Text(
              'Try selecting a different category!',
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
            )
          ],
        ),
      );
    }

    if (title == null) {
      return content;
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(title!),
      ),
      body: content,
    );
  }
}
