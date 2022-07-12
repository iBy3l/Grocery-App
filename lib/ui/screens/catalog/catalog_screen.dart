import 'package:flutter/material.dart';
import 'package:ui_grocery_app/model/category_models.dart';
import 'package:ui_grocery_app/model/product_models.dart';

import '../../shared/card_product_widget.dart';
import '../../shared/custom_appbar_pages.dart';
import '../../shared/custom_button_widget.dart';
import '../../shared/custom_floating_widget.dart';

class CatalogScreen extends StatelessWidget {
  const CatalogScreen({Key? key, required this.category}) : super(key: key);

  final Category category;
  @override
  Widget build(BuildContext context) {
    final List<Product> categoryProduct = Product.products
        .where((product) => product.category == category.name)
        .toList();
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(80),
        child: CustomAppPagesWidget(
          title: category.name,
        ),
      ),
      body: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 0.8,
          ),
          itemCount: categoryProduct.length,
          itemBuilder: (context, index) {
            return Center(
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: CardProdutcWidget(
                  sizeCard: .400,
                  product: categoryProduct[index],
                ),
              ),
            );
          }),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterDocked,
      floatingActionButton: const CustomFloatingWidget(),
      bottomNavigationBar: const CustomButtonWidget(),
    );
  }
}
