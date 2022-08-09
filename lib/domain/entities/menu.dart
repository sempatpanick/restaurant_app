import 'package:equatable/equatable.dart';

class Menu extends Equatable {
  final int id;
  final String name;
  final int status;
  final int price;
  final String image;

  const Menu({
    required this.id,
    required this.name,
    required this.status,
    required this.price,
    required this.image,
  });

  @override
  List<Object?> get props => [
        id,
        name,
        status,
        price,
        image,
      ];
}
