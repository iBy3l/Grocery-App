import 'package:flutter/material.dart';
import 'package:ui_grocery_app/config/app_router.dart';
import '../../theme/colors.dart';

class IntroPage extends StatefulWidget {
  const IntroPage({Key? key}) : super(key: key);

  @override
  State<IntroPage> createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: const Color(0xffFFFFFF),
      body: Stack(
        children: [
          Positioned(
            bottom: size.width * .0,
            child: Image(
              height: size.height * .4,
              width: size.width * .99,
              fit: BoxFit.cover,
              image: const AssetImage(
                'assets/img/wallpaper/paper.png',
              ),
            ),
          ),
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(colors: [
                Color.fromARGB(73, 84, 161, 87),
                Color.fromARGB(6, 218, 250, 219),
              ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
            ),
          ),
          // folha top direita
          Positioned.fill(
            top: size.width * .2,
            right: size.width * .1,
            child: Align(
              alignment: Alignment.topRight,
              child: Image(
                height: size.height * 0.04,
                fit: BoxFit.cover,
                image: const AssetImage(
                  'assets/img/element/folha1.png',
                ),
              ),
            ),
          ),
          //Folha de baixo esquerdo
          Positioned(
            left: size.width / 8,
            top: size.width / 0.8,
            child: Image(
              height: size.width * 0.12,
              fit: BoxFit.cover,
              image: const AssetImage(
                'assets/img/element/folha2.png',
              ),
            ),
          ),
          // Folha direira baixo
          Positioned(
            right: size.width * .001,
            top: size.width / 1.1,
            child: Image(
              width: size.width / 8,
              fit: BoxFit.cover,
              image: const AssetImage(
                'assets/img/element/folha4.png',
              ),
            ),
          ),
          Positioned.fill(
            top: size.width / 4,
            child: Align(
              alignment: Alignment.topCenter,
              child: SizedBox(
                height: size.width * .75,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image(
                      height: size.width * 0.18,
                      fit: BoxFit.cover,
                      image: const AssetImage(
                        'assets/img/logo/logo.png',
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      width: size.width / 1.5,
                      child: Text(
                        textAlign: TextAlign.center,
                        'Get your groceries  delivered to your home',
                        style: TextStyle(
                            color: lightFontDark,
                            fontSize: 24,
                            fontWeight: FontWeight.w700,
                            fontFamily: 'DMSans'),
                      ),
                    ),
                    SizedBox(
                      // padding: EdgeInsets.symmetric(vertical: 20),
                      width: size.width / 1.4,
                      child: Text(
                        textAlign: TextAlign.center,
                        'The best delivery app in town for delivering your daily fresh groceries',
                        style: TextStyle(
                            color: lightFontGrey,
                            fontSize: 16,
                            fontWeight: FontWeight.normal,
                            fontFamily: 'DMSans'),
                      ),
                    ),
                    ElevatedButton(
                      style: ButtonStyle(
                        padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                            const EdgeInsets.symmetric(
                                horizontal: 56, vertical: 16)),
                        backgroundColor: MaterialStateProperty.all<Color>(
                            lightColorsPrimary2),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(48),
                          ),
                        ),
                      ),
                      onPressed: () {
                        Navigator.pushNamed(context, AppRouter.login);
                      },
                      child: const Text(
                        'Shop now',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w700),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
