import 'package:flutter/material.dart';

import '../theme/colors.dart';

class CircularProgressIndWidget extends StatelessWidget {
  const CircularProgressIndWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(
        color: lightColorsPrimary,
      ),
    );
  }
}
