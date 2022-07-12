import 'package:flutter/material.dart';

import '../../../theme/colors.dart';

// Widget buildKeyboard() {

// final Memory memory;

class buildKeyboard extends StatefulWidget {
  const buildKeyboard({Key? key}) : super(key: key);

  @override
  State<buildKeyboard> createState() => _buildKeyboardState();
}

class _buildKeyboardState extends State<buildKeyboard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      // padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      height: 300,
      decoration: BoxDecoration(
        color: lightFontGrey2,
        borderRadius: BorderRadius.circular(50),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Expanded(
              flex: 1,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  _buildKeyboradButtom(
                    '1',
                  ),
                  _buildKeyboradButtom(
                    '2',
                  ), //backgroundColor: const Color(0xff14171E)),
                  _buildKeyboradButtom(
                    '3',
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  _buildKeyboradButtom(
                    '4',
                  ),
                  _buildKeyboradButtom('5'),
                  _buildKeyboradButtom('6'),
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  _buildKeyboradButtom('7'),
                  _buildKeyboradButtom('8'),
                  _buildKeyboradButtom('9'),
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  _buildKeyboradButtom(
                    '',
                  ),
                  _buildKeyboradButtom('0', flex: 3),
                  _buildKeyboradButtom('<', flex: 1),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildKeyboradButtom(
    String label, {
    int flex = 1,
    Color textCalor = Colors.black,
    //Color backgroundColor = lightFontGrey2,
  }) {
    return Expanded(
      flex: 1,
      child: ElevatedButton(
        style: ButtonStyle(
          overlayColor:
              MaterialStateProperty.all<Color>(lightFontGrey.withOpacity(.1)),
          // foregroundColor: MaterialStateProperty.all<Color>(Colors.amber),
          elevation: MaterialStateProperty.all<double?>(0),
          backgroundColor: MaterialStateProperty.all<Color>(Colors.transparent),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(45.0),
            ),
          ),
        ),
        child: Text(
          label,
          style: TextStyle(
              fontSize: 24, color: textCalor, fontWeight: FontWeight.w700),
        ),
        onPressed: () {
          setState(() {});
        },
      ),
    );
  }
}
