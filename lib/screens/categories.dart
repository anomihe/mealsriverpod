import 'package:flutter/material.dart';
import 'package:mealsprovider/screens/meals.dart';

import '../data/dummy_data.dart';
import '../models/category.dart';
import '../models/meals.dart';
import '../widgets/category_grid_item.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({
    super.key,
    //  required this.onToggleFavorite,
    required this.availableMeals,
  });
  // final void Function(Meal meal) onToggleFavorite;
  final List<Meal> availableMeals;

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen>
    with SingleTickerProviderStateMixin {
  void _selectCategory(BuildContext context, Category category) {
    final filteredMeals = widget.availableMeals
        .where((meal) => meal.categories.contains(category.id))
        .toList();
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return MealsScreen(
        meals: filteredMeals,
        title: category.title,
        //   onToggleFavorite: onToggleFavorite,
      );
    }));
  }

  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 6),
      lowerBound: 0,
      upperBound: 1,
    );

    _animationController.forward();
  }

  @override
  void dispose() {
    super.dispose();
    _animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: _animationController,
        builder: (context, child) {
          return SlideTransition(
            position: Tween(
              begin: const Offset(0, 0.3),
              end: const Offset(0, 0),
            ).animate(CurvedAnimation(
              parent: _animationController,
              curve: Curves.easeInOut,
            )),
            child: child,
          );

          // Padding(
          //   padding: EdgeInsets.only(
          //     top:100 - _animationController.value * 100,
          //   ),
          //   child: child,
          // );
        },
        child: GridView(
          padding: const EdgeInsets.all(24),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 3 / 2,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20,
          ),
          children: [
            for (final category in availableCategories)
              CategoryGridItem(
                category: category,
                onSelectCategory: () => _selectCategory(context, category),
              )
          ],
        ));
  }
}

extension Mine on double {
  SizedBox get height => SizedBox(
        height: this,
      );
  SizedBox get width => SizedBox(
        width: this,
      );
}
