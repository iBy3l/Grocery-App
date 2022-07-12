import 'package:flutter/material.dart';
import 'package:ui_grocery_app/model/category_models.dart';
import 'package:ui_grocery_app/model/product_models.dart';
import 'package:ui_grocery_app/ui/shared/product_carousel.dart';

import '../../shared/custom_button_widget.dart';
import '../../shared/custom_floating_widget.dart';
import 'componets/carousel.dart';
import 'componets/category_widget.dart';
import 'componets/customAppBar/custom_appbar.dart';
import 'componets/sesion_of_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(size.height * .165),
        child: const CustomAppbar(),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CarouselBanner(),
            SesionOfCard('Categories 😋'),
            CategoryWidgt(
              category:
                  Category.categories.map((category) => category).toList(),
            ),
            SesionOfCard('Best selling 🔥'),
            ProductCarousel(
              product: Product.products.map((product) => product).toList(),
            ),
          ],
        ),
      ),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterDocked,
      bottomNavigationBar: const CustomButtonWidget(),
      floatingActionButton: const CustomFloatingWidget(),
    );
  }
}
