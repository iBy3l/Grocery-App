import 'package:flutter/material.dart';

import '../theme/colors.dart';

Widget ButtonPrimary(String title, onPressed) {
  return ElevatedButton(
    style: ButtonStyle(
      padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
          const EdgeInsets.symmetric(horizontal: 55, vertical: 15)),
      backgroundColor: MaterialStateProperty.all<Color>(lightColorsPrimary2),
      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(45),
        ),
      ),
    ),
    onPressed: onPressed,
    //() {
    //   Navigator.push(
    //       context,
    //       MaterialPageRoute(
    //           builder: (context) => const HomePage()));
    // },
    child: Text(
      title,
      style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
    ),
  );
}
