import 'package:equatable/equatable.dart';

class Descri extends Equatable {
  final String name;
  final double valor;
  final String imgD;
  final String tipy;

  Descri({
    required this.tipy,
    required this.name,
    required this.valor,
    required this.imgD,
  });
  @override
  List<Object?> get props => [name, valor, imgD];

  static List<Descri> descris = [
    Descri(
      name: 'Organic',
      valor: 100,
      imgD: 'assets/img/element/descri/lotus.png',
      tipy: '%',
    ),
    Descri(
      name: 'Expiration',
      valor: 1,
      imgD: 'assets/img/element/descri/calendar.png',
      tipy: 'Year',
    ),
    Descri(
        name: 'Reviews',
        valor: 4.8,
        imgD: 'assets/img/element/descri/star.png',
        tipy: '(256)'),
    Descri(
      name: '100 Gram',
      valor: 80,
      imgD: 'assets/img/element/descri/fire.png',
      tipy: 'Kcal',
    )
  ];
}
