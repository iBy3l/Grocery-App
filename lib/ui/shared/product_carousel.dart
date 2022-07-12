import 'package:flutter/widgets.dart';
import 'package:ui_grocery_app/model/product_models.dart';
import 'package:ui_grocery_app/ui/shared/card_product_widget.dart';

class ProductCarousel extends StatelessWidget {
  const ProductCarousel({Key? key, required this.product}) : super(key: key);
  final List<Product> product;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SizedBox(
      height: size.height * .254,
      child: ListView.builder(
          itemCount: product.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return CardProdutcWidget(
              sizeCard: 249,
              product: product[index],
            );
          }),
    );
  }
}
