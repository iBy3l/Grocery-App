import 'package:flutter/material.dart';

import 'elements/custom_dropdoan_location.dart';
import 'elements/info_profile_widget.dart';
import 'elements/search_widget.dart';

class CustomAppbar extends StatefulWidget {
  const CustomAppbar({Key? key}) : super(key: key);

  @override
  State<CustomAppbar> createState() => _CustomAppbarState();
}

class _CustomAppbarState extends State<CustomAppbar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
        Color.fromARGB(174, 136, 136, 136),
        Color.fromARGB(5, 219, 219, 219),
      ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 48),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InfoProfileWidget(),
                  CustomDropDownLocation(),
                ],
              ),
            ),
            SearchWidget(),
          ],
        ),
      ),
    );
  }
}
