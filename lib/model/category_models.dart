import 'package:equatable/equatable.dart';

class Category extends Equatable {
  final String name;
  final String imgC;

  Category({required this.name, required this.imgC});

  @override
  List<Object?> get props => [name, imgC];

  static List<Category> categories = [
    Category(
      name: 'Fruits 🍎',
      imgC: 'assets/img/element/category/apple.png',
    ),
    Category(
      name: 'Vegetables 🌽',
      imgC: 'assets/img/element/category/broccoli.png',
    ),
    Category(
      name: 'Diary 🧀',
      imgC: 'assets/img/element/category/cheese.png',
    ),
    Category(
      name: 'Meat 🥩',
      imgC: 'assets/img/element/category/meat.png',
    ),
  ];
}
