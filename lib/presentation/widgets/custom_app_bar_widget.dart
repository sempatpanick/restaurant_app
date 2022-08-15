import 'package:flutter/material.dart';

class CustomAppBarWidget extends StatelessWidget {
  final Widget trailingWidget;
  final Widget actionWidget;

  const CustomAppBarWidget({
    Key? key,
    required this.trailingWidget,
    required this.actionWidget,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 26.0, right: 26.0, top: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          trailingWidget,
          actionWidget,
        ],
      ),
    );
  }
}
