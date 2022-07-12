import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ui_grocery_app/config/app_router.dart';

import '../../../../bloc/cart/bloc/cart_bloc.dart';
import '../../../theme/colors.dart';

class CheckoutCartContainer extends StatelessWidget {
  const CheckoutCartContainer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return BlocBuilder<CartBloc, CartState>(
      builder: (context, state) {
        if (state is CartLoading) {
          return const Center(
            child: CircularProgressIndicator(
              color: lightColorsPrimary,
            ),
          );
        }
        if (state is CartLoaded) {
          return Container(
            decoration: BoxDecoration(
              color: lightFontGrey2,
              border: Border.all(
                width: 2,
                color: lightFontDark.withOpacity(0.05),
              ),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(45),
                topRight: Radius.circular(45),
              ),
            ),
            height: size.height * .2,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    width: 290,
                    // color: Colors.amber,
                    padding: EdgeInsets.symmetric(horizontal: 25, vertical: 30),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'SUBTOTAL',
                              style: TextStyle(
                                  color: lightFontDark,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600),
                            ),
                            Text(
                              '\$ ${state.cart.subtotalString}',
                              style: TextStyle(
                                  color: lightFontDark,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600),
                            )
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'DELIVERY PRICE',
                              style: TextStyle(
                                  color: lightFontDark,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600),
                            ),
                            Text(
                              '\$ ${state.cart.deliveryFreeString}',
                              style: TextStyle(
                                  color: lightFontDark,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600),
                            )
                          ],
                        ),
                        Divider(
                          indent: 10,
                          height: 20,
                          color: lightFontDark,
                        ),
                        SizedBox(height: 5),
                        ElevatedButton(
                          style: ButtonStyle(
                            padding:
                                MaterialStateProperty.all<EdgeInsetsGeometry>(
                                    const EdgeInsets.symmetric(
                                        horizontal: 40, vertical: 2)),
                            backgroundColor: MaterialStateProperty.all<Color>(
                              lightColorsPrimary,
                            ),
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(48),
                              ),
                            ),
                          ),
                          onPressed: () {
                            Navigator.pushNamed(context, AppRouter.checkout);
                          },
                          child: Container(
                            width: size.width * 0.9,
                            height: size.width * 0.12,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(
                                  'CHECKOUT',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w700),
                                ),
                                Text(
                                  '\$ ${state.cart.totalString}',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w700),
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        } else {
          return Text('Deu Ruim!');
        }
      },
    );
  }
}


// showModalBottomSheet(
                            //     backgroundColor: Colors.transparent,
                            //     context: context,
                            //     builder: (BuildContext context) {
                            //       return Container(
                            //         height: 220,
                            //         decoration: BoxDecoration(
                            //           color: Colors.white,
                            //           borderRadius: BorderRadius.only(
                            //             topLeft: Radius.circular(25),
                            //             topRight: Radius.circular(25),
                            //           ),
                            //         ),
                            //         child: Padding(
                            //           padding: const EdgeInsets.symmetric(
                            //               horizontal: 20, vertical: 20),
                            //           child: Container(
                            //             // color: lightColorsSecondary,
                            //             width: 385,
                            //             child: Column(
                            //               mainAxisAlignment:
                            //                   MainAxisAlignment.spaceBetween,
                            //               crossAxisAlignment:
                            //                   CrossAxisAlignment.start,
                            //               children: [
                            //                 Padding(
                            //                   padding: EdgeInsets.symmetric(
                            //                       horizontal: 20, vertical: 5),
                            //                   child: Text(
                            //                     '👤:  Hallan Abreu a porta',
                            //                     style: TextStyle(
                            //                         color: lightFontDark,
                            //                         fontSize: 18),
                            //                   ),
                            //                 ),
                            //                 Divider(
                            //                   height: 10,
                            //                   indent: 5,
                            //                 ),
                            //                 Padding(
                            //                   padding: EdgeInsets.symmetric(
                            //                       horizontal: 20, vertical: 5),
                            //                   child: Text(
                            //                     '🏡:   Rua do Hallan com o negão. nº 24',
                            //                     style: TextStyle(
                            //                         color: lightFontDark,
                            //                         fontSize: 18),
                            //                   ),
                            //                 ),
                            //                 Divider(
                            //                   height: 10,
                            //                   indent: 5,
                            //                 ),
                            //                 Padding(
                            //                   padding: EdgeInsets.symmetric(
                            //                       horizontal: 20, vertical: 5),
                            //                   child: Text(
                            //                     '💳:   ********* 5764',
                            //                     style: TextStyle(
                            //                         color: lightFontDark,
                            //                         fontSize: 18),
                            //                   ),
                            //                 ),
                            //                 Divider(
                            //                   height: 10,
                            //                   indent: 5,
                            //                 ),
                            //                 Row(
                            //                   mainAxisAlignment:
                            //                       MainAxisAlignment.end,
                            //                   children: [
                            //                     Padding(
                            //                       padding: const EdgeInsets
                            //                           .symmetric(horizontal: 5),
                            //                       child: ElevatedButton(
                            //                         style: ElevatedButton.styleFrom(
                            //                             primary:
                            //                                 lightColorsPrimary),
                            //                         onPressed: () {},
                            //                         child: Text(' Edit '),
                            //                       ),
                            //                     ),
                            //                     Padding(
                            //                       padding: const EdgeInsets
                            //                           .symmetric(horizontal: 5),
                            //                       child: ElevatedButton(
                            //                         style: ElevatedButton.styleFrom(
                            //                             primary:
                            //                                 lightColorsPrimary),
                            //                         onPressed: () {},
                            //                         child: Text(' Purchase '),
                            //                       ),
                            //                     ),
                            //                   ],
                            //                 ),
                            //               ],
                            //             ),
                            //           ),
                            //         ),
                            //       );
                            //     });