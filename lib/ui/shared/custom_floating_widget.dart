import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ui_grocery_app/config/app_router.dart';

import '../../bloc/cart/bloc/cart_bloc.dart';
import '../theme/colors.dart';

class CustomFloatingWidget extends StatelessWidget {
  const CustomFloatingWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool showFab = MediaQuery.of(context).viewInsets.bottom != 0;
    return Visibility(
      visible: !showFab,
      child: SizedBox(
        width: 60,
        height: 80,
        child: Stack(
          children: [
            Positioned(
              top: 12,
              // left: 15,
              child: InkWell(
                onTap: () {
                  Navigator.pushNamed(context, AppRouter.cart);
                },
                child: Container(
                  height: 60,
                  width: 60,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(45),
                    color: lightColorsPrimary,
                  ),
                  child:
                      Icon(Icons.shopping_cart_rounded, color: lightFontGrey2),
                ),
              ),
            ),
            Positioned(
              left: 18,
              bottom: 0,
              child: Container(
                height: 25,
                width: 25,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(45),
                    color: lightColorsSecondary,
                    border: Border.all(color: lightFontGrey2)),
                child: Center(
                  child: BlocBuilder<CartBloc, CartState>(
                    builder: (context, state) {
                      return Text(
                        '4',
                        style: TextStyle(color: lightFontGrey2, fontSize: 20),
                      );
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
