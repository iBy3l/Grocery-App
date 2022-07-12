import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ui_grocery_app/model/product_models.dart';
import 'package:ui_grocery_app/ui/theme/colors.dart';

import '../../../../bloc/cart/bloc/cart_bloc.dart';

class CardProductCardWidget extends StatelessWidget {
  const CardProductCardWidget(
      {Key? key, required this.quantity, required this.product})
      : super(key: key);
  final int quantity;
  final Product product;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
      child: Card(
        shadowColor: lightColorsPrimary,
        child: Flexible(
          child: SizedBox(
            height: size.height * 0.1,
            width: size.width * 0.24,
            // padding: EdgeInsets.symmetric(horizontal: 05),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Image(
                  height: size.height * 0.08,
                  width: size.height * 0.08,
                  fit: BoxFit.contain,
                  image: AssetImage(product.imgP),
                ),
                SizedBox(width: size.width * 0.001),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      product.name,
                      style: const TextStyle(
                          color: lightColorsPrimary,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      '\$ ${product.price}',
                      style: const TextStyle(
                          color: lightColorsSecondary,
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                const SizedBox(
                  width: 10,
                ),
                BlocBuilder<CartBloc, CartState>(
                  builder: (context, state) {
                    return Row(
                      children: [
                        IconButton(
                            onPressed: () {
                              context
                                  .read<CartBloc>()
                                  .add(CartProductRemove(product));
                            },
                            icon: const Icon(
                              Icons.remove_circle,
                              color: lightFontGrey,
                              size: 32,
                            )),
                        Text(
                          '$quantity',
                          style: const TextStyle(
                              color: lightFontDark,
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        ),
                        IconButton(
                            onPressed: () {
                              context
                                  .read<CartBloc>()
                                  .add(CartProductAdded(product));
                            },
                            icon: const Icon(Icons.add_circle,
                                size: 32, color: lightColorsPrimary)),
                      ],
                    );
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
