import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:mealsprovider/providers/filters_provider.dart';

class FiltersScreen extends ConsumerWidget {
  const FiltersScreen({
    super.key,
    // required this.currentFilters,
  });
  //final Map<Filter, bool> currentFilters;

  // void initState() {
  //   super.initState();
  //   final activeFilter = ref.read(filterProvider);
  //   _glutenFreeFilterSet = activeFilter[Filter.glutenFree]!;
  //   _lactoseFreeFilterSet = activeFilter[Filter.lactoseFree]!;
  //   _vegatarianFilterSet = activeFilter[Filter.vegetarian]!;
  //   _veganFreeFilterSet = activeFilter[Filter.vegan]!;
  // }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final activeFilters = ref.watch(filterProvider);
    return Scaffold(
      appBar: AppBar(title: const Text('Your FIlters')),
      // drawer: MainDrawer(onSelectScreen: (identifier) {
      //   Navigator.of(context).pop();
      //   if (identifier == 'meals') {
      //     Navigator.of(context).push(
      //       MaterialPageRoute(builder: (context) {
      //         return const TabsScreen();
      //       }),
      //     );
      //   }
      // }),
      body: Column(
        children: [
          SwitchListTile(
            value: activeFilters[Filter.glutenFree]!,
            onChanged: (isChecked) {
              ref
                  .read(filterProvider.notifier)
                  .setFilter(Filter.glutenFree, isChecked);
            },
            contentPadding: const EdgeInsets.only(left: 34, right: 22),
            activeColor: Theme.of(context).colorScheme.tertiary,
            subtitle: Text(
              'Only Include gluten-free meals',
              style: Theme.of(context).textTheme.labelMedium!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
            ),
            title: Text(
              'Gluten-free',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
            ),
          ),
          SwitchListTile(
            value: activeFilters[Filter.lactoseFree]!,
            onChanged: (isChecked) {
              ref
                  .read(filterProvider.notifier)
                  .setFilter(Filter.lactoseFree, isChecked);
            },
            contentPadding: const EdgeInsets.only(left: 34, right: 22),
            activeColor: Theme.of(context).colorScheme.tertiary,
            subtitle: Text(
              'Only Include Lactose-free meals',
              style: Theme.of(context).textTheme.labelMedium!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
            ),
            title: Text(
              'Lactose-free',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
            ),
          ),
          SwitchListTile(
            value: activeFilters[Filter.vegetarian]!,
            onChanged: (isChecked) {
              ref
                  .read(filterProvider.notifier)
                  .setFilter(Filter.vegetarian, isChecked);
            },
            contentPadding: const EdgeInsets.only(left: 34, right: 22),
            activeColor: Theme.of(context).colorScheme.tertiary,
            subtitle: Text(
              'Only Include Vegatarian-free meals',
              style: Theme.of(context).textTheme.labelMedium!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
            ),
            title: Text(
              'Vegatarian-free',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
            ),
          ),
          SwitchListTile(
            value: activeFilters[Filter.vegan]!,
            onChanged: (isChecked) {
              ref
                  .read(filterProvider.notifier)
                  .setFilter(Filter.glutenFree, isChecked);
            },
            contentPadding: const EdgeInsets.only(left: 34, right: 22),
            activeColor: Theme.of(context).colorScheme.tertiary,
            subtitle: Text(
              'Only Include Vegan meals',
              style: Theme.of(context).textTheme.labelMedium!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
            ),
            title: Text(
              'Vegan',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
            ),
          ),
        ],
      ),
    );
  }
}




// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';

// import 'package:mealsprovider/providers/filters_provider.dart';

// class FiltersScreen extends ConsumerStatefulWidget {
//   const FiltersScreen({
//     super.key,
//     // required this.currentFilters,
//   });
//   //final Map<Filter, bool> currentFilters;
//   @override
//   ConsumerState<FiltersScreen> createState() => _FiltersScreenState();
// }

// class _FiltersScreenState extends ConsumerState<FiltersScreen> {
//   var _glutenFreeFilterSet = false;
//   var _lactoseFreeFilterSet = false;
//   var _vegatarianFilterSet = false;
//   var _veganFreeFilterSet = false;
//   @override
//   void initState() {
//     super.initState();
//     final activeFilter = ref.read(filterProvider);
//     _glutenFreeFilterSet = activeFilter[Filter.glutenFree]!;
//     _lactoseFreeFilterSet = activeFilter[Filter.lactoseFree]!;
//     _vegatarianFilterSet = activeFilter[Filter.vegetarian]!;
//     _veganFreeFilterSet = activeFilter[Filter.vegan]!;
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text('Your FIlters')),
//       // drawer: MainDrawer(onSelectScreen: (identifier) {
//       //   Navigator.of(context).pop();
//       //   if (identifier == 'meals') {
//       //     Navigator.of(context).push(
//       //       MaterialPageRoute(builder: (context) {
//       //         return const TabsScreen();
//       //       }),
//       //     );
//       //   }
//       // }),
//       body: WillPopScope(
//         onWillPop: () async {
//           ref.read(filterProvider.notifier).setFilters({
//             Filter.glutenFree: _glutenFreeFilterSet,
//             Filter.lactoseFree: _lactoseFreeFilterSet,
//             Filter.vegetarian: _vegatarianFilterSet,
//             Filter.vegan: _veganFreeFilterSet,
//           });
//          // Navigator.of(context).pop({});
//           return true;
//         },
//         child: Column(
//           children: [
//             SwitchListTile(
//               value: _glutenFreeFilterSet,
//               onChanged: (isChecked) {
//                 setState(() {
//                   _glutenFreeFilterSet = isChecked;
//                 });
//               },
//               contentPadding: const EdgeInsets.only(left: 34, right: 22),
//               activeColor: Theme.of(context).colorScheme.tertiary,
//               subtitle: Text(
//                 'Only Include gluten-free meals',
//                 style: Theme.of(context).textTheme.labelMedium!.copyWith(
//                       color: Theme.of(context).colorScheme.onBackground,
//                     ),
//               ),
//               title: Text(
//                 'Gluten-free',
//                 style: Theme.of(context).textTheme.titleLarge!.copyWith(
//                       color: Theme.of(context).colorScheme.onBackground,
//                     ),
//               ),
//             ),
//             SwitchListTile(
//               value: _lactoseFreeFilterSet,
//               onChanged: (isChecked) {
//                 setState(() {
//                   _lactoseFreeFilterSet = isChecked;
//                 });
//               },
//               contentPadding: const EdgeInsets.only(left: 34, right: 22),
//               activeColor: Theme.of(context).colorScheme.tertiary,
//               subtitle: Text(
//                 'Only Include Lactose-free meals',
//                 style: Theme.of(context).textTheme.labelMedium!.copyWith(
//                       color: Theme.of(context).colorScheme.onBackground,
//                     ),
//               ),
//               title: Text(
//                 'Lactose-free',
//                 style: Theme.of(context).textTheme.titleLarge!.copyWith(
//                       color: Theme.of(context).colorScheme.onBackground,
//                     ),
//               ),
//             ),
//             SwitchListTile(
//               value: _vegatarianFilterSet,
//               onChanged: (isChecked) {
//                 setState(() {
//                   _vegatarianFilterSet = isChecked;
//                 });
//               },
//               contentPadding: const EdgeInsets.only(left: 34, right: 22),
//               activeColor: Theme.of(context).colorScheme.tertiary,
//               subtitle: Text(
//                 'Only Include Vegatarian-free meals',
//                 style: Theme.of(context).textTheme.labelMedium!.copyWith(
//                       color: Theme.of(context).colorScheme.onBackground,
//                     ),
//               ),
//               title: Text(
//                 'Vegatarian-free',
//                 style: Theme.of(context).textTheme.titleLarge!.copyWith(
//                       color: Theme.of(context).colorScheme.onBackground,
//                     ),
//               ),
//             ),
//             SwitchListTile(
//               value: _veganFreeFilterSet,
//               onChanged: (isChecked) {
//                 setState(() {
//                   _veganFreeFilterSet = isChecked;
//                 });
//               },
//               contentPadding: const EdgeInsets.only(left: 34, right: 22),
//               activeColor: Theme.of(context).colorScheme.tertiary,
//               subtitle: Text(
//                 'Only Include Vegan meals',
//                 style: Theme.of(context).textTheme.labelMedium!.copyWith(
//                       color: Theme.of(context).colorScheme.onBackground,
//                     ),
//               ),
//               title: Text(
//                 'Vegan',
//                 style: Theme.of(context).textTheme.titleLarge!.copyWith(
//                       color: Theme.of(context).colorScheme.onBackground,
//                     ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
