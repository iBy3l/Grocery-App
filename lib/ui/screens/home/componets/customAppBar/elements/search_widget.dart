import 'package:flutter/material.dart';

import '../../../../../theme/colors.dart';

class SearchWidget extends StatelessWidget {
  const SearchWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Container(
        height: size.height * 0.055,
        width: size.width,
        child: Card(
          elevation: 0,
          margin: EdgeInsets.symmetric(horizontal: 30),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(35)),
          child: TextFormField(
            decoration: InputDecoration(
              border: InputBorder.none,
              prefixIcon: Icon(
                Icons.search,
                color: lightColorsPrimary,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
