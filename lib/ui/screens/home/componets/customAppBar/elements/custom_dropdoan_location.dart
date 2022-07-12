import 'package:flutter/material.dart';

import '../../../../../theme/colors.dart';

class CustomDropDownLocation extends StatefulWidget {
  const CustomDropDownLocation({Key? key}) : super(key: key);

  @override
  State<CustomDropDownLocation> createState() => _CustomDropDownLocationState();
}

String selectval = "My Home";

// List of items in our dropdown menu
List<String> listitems = [
  "My Home",
  "Home",
];

class _CustomDropDownLocationState extends State<CustomDropDownLocation> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
        padding: EdgeInsets.symmetric(
            vertical: size.width * 0.008, horizontal: size.width * 0.002),
        height: size.height * 0.05,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(35), color: lightColorsLightBG),
        child: DropdownButtonHideUnderline(
          child: DropdownButton(
            icon: Icon(Icons.expand_more),
            value: selectval,
            onChanged: (value) {
              setState(() {
                selectval = value.toString();
              });
            },
            items: listitems.map((itemone) {
              return DropdownMenuItem(
                  value: itemone,
                  child: Row(
                    children: [
                      Icon(
                        Icons.fmd_good,
                        size: size.width * 0.06,
                        color: lightColorsPrimary,
                      ),
                      Text(itemone),
                    ],
                  ));
            }).toList(),
          ),
        ));
  }
}
