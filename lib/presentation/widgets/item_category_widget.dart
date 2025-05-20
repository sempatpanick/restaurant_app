import 'package:flutter/material.dart';

class ItemCategoryWidget extends StatelessWidget {
  final String name;
  final Color colorBackground;
  final Color colorText;
  final Function() onTap;

  const ItemCategoryWidget({
    Key? key,
    required this.name,
    required this.colorBackground,
    required this.colorText,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 14.0),
        decoration: BoxDecoration(
            color: colorBackground, borderRadius: BorderRadius.circular(25.0)),
        child: Center(
          child: Text(
            name,
            style: theme.textTheme.labelLarge!.copyWith(
              color: colorText,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}
