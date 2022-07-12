import 'package:equatable/equatable.dart';

class Product extends Equatable {
  final String name;
  final String imgP;
  final String coment;
  final double price;
  final int quanty;
  final double kg;
  final String category;
  final bool isBest;
  const Product(
      {required this.isBest,
      required this.name,
      required this.imgP,
      required this.coment,
      required this.price,
      required this.quanty,
      required this.kg,
      required this.category});

  @override
  List<Object?> get props => [name, imgP, coment, price, quanty, isBest];

  static List<Product> products = [
    const Product(
      name: 'Bell Pepper Red',
      category: 'Vegetables 🌽',
      coment:
          'Bell is a flowering plant whose rhizome, ginger root or ginger, is widely used as a spice and a folk medicine.',
      price: 6,
      kg: 1,
      imgP: 'assets/img/element/product/pimentao.png',
      quanty: 6,
      isBest: true,
    ),
    const Product(
      name: 'Arabic Ginger',
      category: 'Vegetables 🌽',
      coment:
          'Bell is a flowering plant whose rhizome, ginger root or ginger, is widely used as a spice and a folk medicine.',
      price: 4,
      kg: 1,
      imgP: 'assets/img/element/product/gegi.png',
      quanty: 6,
      isBest: false,
    ),
    const Product(
      name: 'Fresh Lettuce',
      category: 'Vegetables 🌽',
      coment:
          'Bell is a flowering plant whose rhizome, ginger root or ginger, is widely used as a spice and a folk medicine.',
      price: 2,
      kg: 1,
      imgP: 'assets/img/element/product/alface.png',
      quanty: 6,
      isBest: false,
    ),
    const Product(
      name: 'Butternut Squash',
      category: 'Fruits 🍎',
      coment:
          'Bell is a flowering plant whose rhizome, ginger root or ginger, is widely used as a spice and a folk medicine.',
      price: 8,
      kg: 1,
      imgP: 'assets/img/element/product/mamao.png',
      quanty: 6,
      isBest: false,
    ),
    const Product(
      name: 'Organic Carrots',
      category: 'Vegetables 🌽',
      coment:
          'Bell is a flowering plant whose rhizome, ginger root or ginger, is widely used as a spice and a folk medicine.',
      price: 8,
      kg: 1,
      imgP: 'assets/img/element/product/cenoura.png',
      quanty: 6,
      isBest: false,
    ),
    const Product(
      name: 'Fresh Broccoli',
      category: 'Vegetables 🌽',
      coment:
          'Bell is a flowering plant whose rhizome, ginger root or ginger, is widely used as a spice and a folk medicine.',
      price: 2,
      kg: 1,
      imgP: 'assets/img/element/product/broco.png',
      quanty: 6,
      isBest: false,
    ),
    const Product(
      name: 'Cherry Tomato',
      category: 'Vegetables 🌽',
      coment:
          'Bell is a flowering plant whose rhizome, ginger root or ginger, is widely used as a spice and a folk medicine.',
      price: 4,
      kg: 1,
      imgP: 'assets/img/element/product/tomate.png',
      quanty: 6,
      isBest: false,
    ),
    const Product(
      name: 'Cherry Tomato',
      category: 'Vegetables 🌽',
      coment:
          'Bell is a flowering plant whose rhizome, ginger root or ginger, is widely used as a spice and a folk medicine.',
      price: 4,
      kg: 1,
      imgP: 'assets/img/element/product/spinach.png',
      quanty: 6,
      isBest: false,
    ),
    const Product(
      name: 'Lamb Meat',
      category: 'Meat 🥩',
      coment:
          'Bell is a flowering plant whose rhizome, ginger root or ginger, is widely used as a spice and a folk medicine.',
      price: 45,
      kg: 1,
      imgP: 'assets/img/element/product/carne.png',
      quanty: 6,
      isBest: true,
    ),
  ];
}
