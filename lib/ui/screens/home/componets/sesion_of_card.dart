import 'package:flutter/material.dart';

import '../../../theme/colors.dart';

Widget SesionOfCard(
  String name,
) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          name,
          style: TextStyle(
              color: lightFontDark, fontSize: 18, fontWeight: FontWeight.w700),
        ),
        Text(
          'See all',
          style: TextStyle(
              color: lightColorsPrimary,
              fontSize: 18,
              fontWeight: FontWeight.bold),
        ),
      ],
    ),
  );
}
