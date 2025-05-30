import 'package:flutter/material.dart';

import '../../common/constants.dart';

class TextWithIcon extends StatelessWidget {
  final Icon icon;
  final String text;
  const TextWithIcon({
    Key? key,
    required this.icon,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        icon,
        const SizedBox(
          width: 4.0,
        ),
        Text(
          text,
          style: theme.textTheme.labelLarge!.copyWith(color: colorBlack),
        ),
      ],
    );
  }
}
