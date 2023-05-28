import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mealsprovider/providers/favourites_provider.dart';
import 'package:mealsprovider/screens/categories.dart';

import '../models/meals.dart';

class MealDetailsScreen extends ConsumerWidget {
  const MealDetailsScreen({
    required this.meal,
    super.key,
    //  required this.onToggleFavorite,
  });
  final Meal meal;
  // final void Function(Meal meal) onToggleFavorite;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final favouriteMeals = ref.watch(favouriteMealsProvider);
    final isFavourite = favouriteMeals.contains(meal);
    return Scaffold(
      appBar: AppBar(
        title: Text(meal.title),
        actions: [
          IconButton(
            onPressed: () {
              //      onToggleFavorite(meal);

              final wasAdded = ref
                  .read(favouriteMealsProvider.notifier)
                  .toggleMealFavourite(meal);

              ScaffoldMessenger.of(context).clearSnackBars();
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text(wasAdded
                      ? 'Meal added as a favorite.'
                      : 'Meal removed as favourite')));
            },
            icon: AnimatedSwitcher(
                transitionBuilder: (child, animation) {
                  return RotationTransition(
                    turns: Tween<double>(begin: 0.5, end: 1).animate(animation),
                    child: child,
                  );
                },
                duration: const Duration(seconds: 2),
                child: Icon(
                  isFavourite ? Icons.star : Icons.star_border,
                  key: ValueKey(
                    isFavourite,
                  ),
                )),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Hero(
              tag: meal.id,
              child: Image.network(
                meal.imageUrl,
                height: 300,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            14.0.height,
            Text(
              'Ingredients',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.primary,
                    fontWeight: FontWeight.bold,
                  ),
            ),
            14.0.height,
            for (final ingredients in meal.ingredients)
              Text(ingredients,
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: Theme.of(context).colorScheme.onBackground,
                      )),
            24.0.height,
            Text(
              'Steps',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.primary,
                    fontWeight: FontWeight.bold,
                  ),
            ),
            24.0.height,
            for (final step in meal.steps)
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12.0,
                  vertical: 8,
                ),
                child: Text(step,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          color: Theme.of(context).colorScheme.onBackground,
                        )),
              ),
            24.0.height,
          ],
        ),
      ),
    );
  }
}
