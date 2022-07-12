import 'package:flutter/material.dart';

import '../../shared/custom_appbar_pages.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(80),
        child: CustomAppPagesWidget(
          title: ' Checkout  🧾',
        ),
      ),
      body: Column(children: []),
    );
  }
}
