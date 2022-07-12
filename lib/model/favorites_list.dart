import 'package:equatable/equatable.dart';
import 'package:ui_grocery_app/model/models.dart';

class FavoritesList extends Equatable {
  final List<Product> product;

  const FavoritesList({this.product = const <Product>[]});
  @override
  List<Object?> get props => [product];
}
