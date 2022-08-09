import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class NavigationMenu extends Equatable {
  final IconData icon;
  final String name;
  final Widget page;

  const NavigationMenu({
    required this.icon,
    required this.name,
    required this.page,
  });

  @override
  List<Object?> get props => [icon, name, page];
}
