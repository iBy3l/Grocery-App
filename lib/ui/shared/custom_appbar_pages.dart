import 'package:flutter/material.dart';

import '../theme/colors.dart';

class CustomAppPagesWidget extends StatelessWidget {
  const CustomAppPagesWidget({
    Key? key,
    required this.title,
  }) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      title: Text(
        title,
        style: TextStyle(
            color: lightFontDark, fontWeight: FontWeight.bold, fontSize: 24),
      ),
      backgroundColor: Colors.transparent,
      elevation: 0,
      leading: IconButton(
        icon: Icon(
          Icons.arrow_back_ios,
          color: lightFontDark,
          size: 16,
        ),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
    );
  }
}
