import 'package:flutter/material.dart';
import 'package:ui_grocery_app/config/app_router.dart';

class CustomButtonWidget extends StatelessWidget {
  const CustomButtonWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      height: size.height * 0.08,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              onPressed: () {
                Navigator.pushNamed(context, AppRouter.home);
              },
              icon: Icon(
                Icons.home,
                size: 30,
              ),
            ),
            IconButton(
              onPressed: () {
                Navigator.pushNamed(context, AppRouter.favoritesList);
              },
              icon: Icon(
                Icons.favorite,
                size: 30,
              ),
            ),
            SizedBox(width: 24),
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.mode_comment,
                size: 30,
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.person,
                size: 30,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
