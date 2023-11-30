// import 'package:flutter/material.dart';

// class FilterSwitchListTile extends StatefulWidget {
//   FilterSwitchListTile(
//       {super.key,
//       required this.switchTaped,
//       required this.title,
//       required this.subtitle});
//   bool switchTaped;
//   final String title;
//   final String subtitle;
//   @override
//   State<FilterSwitchListTile> createState() => _FilterSwitchListTileState();
// }

// class _FilterSwitchListTileState extends State<FilterSwitchListTile> {
//   @override
//   Widget build(BuildContext context) {
//     return SwitchListTile(
//       value: widget.switchTaped,
//       onChanged: (isChecked) {
//         setState(() {
//           widget.switchTaped = isChecked;
//         });
//       },
//       title: Text(
//         widget.title,
//         style: Theme.of(context).textTheme.titleLarge!.copyWith(
//               color: Theme.of(context).colorScheme.onBackground,
//             ),
//       ),
//       subtitle: Text(
//         widget.subtitle,
//         style: Theme.of(context).textTheme.labelMedium!.copyWith(
//               color: Theme.of(context).colorScheme.onBackground,
//             ),
//       ),
//       activeColor: Theme.of(context).colorScheme.tertiary,
//       contentPadding: const EdgeInsets.only(
//         left: 34,
//         right: 22,
//       ),
//     );
//   }
// }
