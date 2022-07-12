import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ui_grocery_app/model/product_models.dart';
import 'package:ui_grocery_app/ui/screens/product/product_page.dart';

import '../../bloc/cart/bloc/cart_bloc.dart';
import '../theme/colors.dart';

class CardProdutcWidget extends StatelessWidget {
  const CardProdutcWidget({
    Key? key,
    required this.product,
    required this.sizeCard,
  }) : super(key: key);
  final Product product;
  final double sizeCard;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Padding(
      padding: EdgeInsets.only(left: size.width * 0.04),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: lightFontGrey2,
            boxShadow: [
              BoxShadow(
                color: lightColorsPrimary.withOpacity(0.1),
                spreadRadius: 1,
                blurRadius: 5,
                offset: Offset(0, 2),
              ),
            ]),
        height: size.height * sizeCard,
        width: size.width * .393,
        padding: EdgeInsets.all(size.height * 0.0089),
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InkWell(
                  onTap: () {
                    Timer(
                      const Duration(milliseconds: 300),
                      () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => ProductScreen(
                              descri: const [],
                              product: product,
                            ),
                          ),
                        );
                      },
                    );
                  },
                  child: Image(
                    image: AssetImage(product.imgP),
                  ),
                ),
                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          product.name,
                          style: const TextStyle(
                            color: lightFontDark,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          '1Kg, ${product.price}',
                          style: const TextStyle(
                            color: lightColorsSecondary,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            BlocBuilder<CartBloc, CartState>(
              builder: (context, state) {
                if (state is CartLoading) {
                  return const Center(
                    child: CircularProgressIndicator(color: lightColorsPrimary),
                  );
                }
                if (state is CartLoaded) {
                  return Positioned(
                    bottom: size.width * 0.005,
                    right: size.width * 0.005,
                    child: InkWell(
                      onTap: () {
                        context.read<CartBloc>().add(
                              CartProductAdded(product),
                            );
                      },
                      child: const Icon(
                        Icons.add_circle_sharp,
                        size: 45,
                        color: lightColorsPrimary,
                      ),
                    ),
                  );
                } else {
                  return const Text('Deu Ruim!');
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
