import 'package:equatable/equatable.dart';
import 'package:ui_grocery_app/model/product_models.dart';

class Cart extends Equatable {
  final List<Product> products;

  const Cart({this.products = const <Product>[]});

  Map productQuantity(products) {
    var quantity = {};

    products.forEach((product) {
      if (!quantity.containsKey(product)) {
        quantity[product] = 1;
      } else {
        quantity[product] += 1;
      }
    });

    return quantity;
  }

  //
  @override
  List<Object?> get props => [products];
  //

  // Define os getters de subtotal
  double get subtotal =>
      products.fold(0, (total, current) => total + current.price);

  //  Define os getters de calcula o subtotal
  double deliveryFree(subtotal) {
    if (subtotal >= 15.0) {
      return 0.0;
    } else {
      return 5.0;
    }
  }

  double total(subtotal, deliveryFree) {
    return subtotal + deliveryFree(subtotal);
  }

// Calculo : Avisa para o cliente quanto em valor falta para o delivery ficar free
  String freeDelivery(subtotal) {
    if (subtotal >= 15.0) {
      return 'You Have Free Delivery';
    } else {
      double missing = 15.0 - subtotal;
      return 'Add \$${missing.toStringAsFixed(2)} for Free Delivery';
    }
  }

  String get subtotalString => subtotal.toStringAsFixed(2);

  String get totalString => total(subtotal, deliveryFree).toStringAsFixed(2);

  String get deliveryFreeString => deliveryFree(subtotal).toStringAsFixed(2);

  String get freeDeliveryString => freeDelivery(subtotal);
}
