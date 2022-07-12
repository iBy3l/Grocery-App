import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ui_grocery_app/config/app_router.dart';
import 'package:ui_grocery_app/model/descrition_models.dart';
import 'package:ui_grocery_app/model/product_models.dart';
import 'package:ui_grocery_app/ui/theme/colors.dart';

import '../../../bloc/cart/bloc/cart_bloc.dart';
import '../../../bloc/favoriteslist/bloc/favoriteslist_bloc.dart';
import '../../../model/product_models.dart';
import 'componets/descri_widget.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({
    Key? key,
    required this.product,
    required this.descri,
  }) : super(key: key);
  final Product product;
  final List<Descri> descri;

  static const String routeName = '/product';

  static Route route({required Product product}) {
    return MaterialPageRoute(
        settings: const RouteSettings(name: routeName),
        builder: (_) => ProductScreen(
              product: product,
              descri: const <Descri>[],
            ));
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: lightFontGrey2,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            color: lightFontDark,
            size: 16,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: size.height * 0.4,
              child: Container(
                decoration: const BoxDecoration(
                  color: lightFontGrey2,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(200.0),
                    bottomRight: Radius.circular(200.0),
                  ),
                ),
                child: Center(
                  child: SizedBox(
                    height: 280,
                    width: 280,
                    child: Image.asset(
                      product.imgP,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        product.name,
                        style: const TextStyle(
                          fontSize: 24,
                          color: lightFontDark,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      BlocBuilder<FavoriteslistBloc, FavoriteslistState>(
                        builder: (context, state) {
                          return IconButton(
                            onPressed: () {
                              context
                                  .read<FavoriteslistBloc>()
                                  .add(AddFavoritelistProduct(product));
                            },
                            icon: const Icon(Icons.favorite),
                            iconSize: 32,
                          );
                        },
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        '${product.kg}Kg, ',
                        style: const TextStyle(
                          fontSize: 24,
                          color: lightColorsSecondary,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Text(
                        '${product.price}\$',
                        style: const TextStyle(
                          fontSize: 24,
                          color: lightColorsSecondary,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Text(
                    product.coment,
                    style: const TextStyle(
                      fontSize: 18,
                      color: lightFontGrey,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Container(
                    height: 180,
                    width: 342,
                    padding: const EdgeInsets.all(10),
                    // color: Colors.amber,
                    child: DescriWidget(),
                  ),
                  BlocBuilder<CartBloc, CartState>(
                    builder: (context, state) {
                      return ElevatedButton(
                          style: ButtonStyle(
                            padding:
                                MaterialStateProperty.all<EdgeInsetsGeometry>(
                                    const EdgeInsets.symmetric(
                                        horizontal: 100, vertical: 15)),
                            backgroundColor: MaterialStateProperty.all<Color>(
                                lightColorsPrimary2),
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(45),
                              ),
                            ),
                          ),
                          onPressed: () {
                            context
                                .read<CartBloc>()
                                .add(CartProductAdded(product));

                            final snackBar = SnackBar(
                              backgroundColor: lightColorsSecondary,
                              content: const Text('YOU ADD PRODUCT TO CART.'),
                              action: SnackBarAction(
                                  label: 'Cart Look',
                                  textColor: Colors.black,
                                  onPressed: () {
                                    Navigator.pushNamed(
                                        context, AppRouter.cart);
                                  }),
                            );
                            ScaffoldMessenger.of(context)
                                .showSnackBar(snackBar);
                          },
                          child: const Text(
                            'Add to cart',
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w700),
                          ));
                    },
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
