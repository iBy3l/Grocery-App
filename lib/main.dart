import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ui_grocery_app/bloc/cart/bloc/cart_bloc.dart';
import 'package:ui_grocery_app/bloc/favoriteslist/bloc/favoriteslist_bloc.dart';
import 'package:ui_grocery_app/config/app_router.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (_) => FavoriteslistBloc()..add(StartFavoritelist())),
        BlocProvider(create: (_) => CartBloc()..add(CartStarted()))
      ],
      child: MaterialApp(
        theme: ThemeData(
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        debugShowCheckedModeBanner: false,
        // showSemanticsDebugger: true,
        title: 'Grocery App',
        // theme: ThemeData(textTheme: customTextTheme, fontFamily: 'DMSans'),
        onGenerateRoute: AppRouter.onGenerateRoute,
        initialRoute: AppRouter.intro,

        // home: const IntroPage(),
      ),
    );
  }
}
