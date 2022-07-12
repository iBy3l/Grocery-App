import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ui_grocery_app/bloc/cart/bloc/cart_bloc.dart';
import 'package:ui_grocery_app/config/app_router.dart';

import '../../theme/colors.dart';
import 'componets/card_product_card_widget.dart';
import 'componets/checkout_cart_contrainer.dart';
import '../../shared/shared.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(80),
        child: CustomAppPagesWidget(title: 'Cart  🛒'),
      ),
      backgroundColor: Colors.white,
      body: BlocBuilder<CartBloc, CartState>(
        builder: (context, state) {
          if (state is CartLoading) {
            return CircularProgressIndWidget();
          }
          if (state is CartLoaded) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      state.cart.freeDeliveryString,
                      style: TextStyle(
                        color: lightFontDark,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    ElevatedButton(
                      style: ButtonStyle(
                        padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                          const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 4),
                        ),
                        backgroundColor: MaterialStateProperty.all<Color>(
                            lightColorsPrimary),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(48),
                          ),
                        ),
                      ),
                      onPressed: () {
                        Navigator.pushNamed(context, AppRouter.home);
                      },
                      child: Text(
                        'Add More Items',
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                  ],
                ),
                Flexible(
                  child: ListView.builder(
                      itemCount: state.cart
                          .productQuantity(state.cart.products)
                          .keys
                          .length,
                      itemBuilder: (context, index) {
                        return CardProductCardWidget(
                          product: state.cart
                              .productQuantity(state.cart.products)
                              .keys
                              .elementAt(index),
                          quantity: state.cart
                              .productQuantity(state.cart.products)
                              .values
                              .elementAt(index),
                        );
                      }),
                ),
              ],
            );
          } else {
            return Text('Deu ruim em!');
          }
        },
      ),
      bottomNavigationBar: CheckoutCartContainer(),
    );
  }
}
