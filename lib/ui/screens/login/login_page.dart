import 'package:flutter/material.dart';
import 'package:ui_grocery_app/config/app_router.dart';
import 'package:ui_grocery_app/model/memory_models.dart';
import 'package:ui_grocery_app/ui/theme/colors.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late List<List<dynamic>> keys;
  late String amount;

  @override
  void initState() {
    super.initState();
    keys = [
      ['1', '2', '3'],
      ['4', '5', '6'],
      ['7', '8', '9'],
      [
        '-',
        '0',
        const Text('<',
            style: TextStyle(
              fontSize: 30.0,
              fontWeight: FontWeight.bold,
              color: lightFontDark,
            ))
      ],
    ];
    amount = '';
  }

  //Quando tocar na tela
  onKeyTap(val) {
    if (val == '0' && amount.isEmpty) {
      return;
    }
    setState(() {
      amount = amount + val;
    });
  }

  //pressione space
  onBackspacePress() {
    if (amount.isEmpty) {
      return;
    }

    setState(() {
      amount = amount.substring(0, amount.length - 1);
    });
  }

  //Redenrizar
  renderKeyboard() {
    return keys
        .map(
          (x) => Row(
            children: x.map(
              (y) {
                return Expanded(
                  child: KeyboardKey(
                    label: y,
                    value: y,
                    onTap: (val) {
                      if (val is Widget) {
                        onBackspacePress();
                      } else {
                        onKeyTap(val);
                      }
                    },
                  ),
                );
              },
            ).toList(),
          ),
        )
        .toList();
  }

  //Valor de renderização
  renderAmount() {
    String display = '+44(000)000-00-00';
    TextStyle style = const TextStyle(
      fontSize: 32.0,
      fontWeight: FontWeight.bold,
      color: lightFontGrey,
    );
    if (amount.isNotEmpty) {
      // NumberFormat f = NumberFormat('##(###)###-##-##');
      display = amount;
      // display = f.format(int.parse(amount));
      style = style.copyWith(
        color: lightFontDark,
      );
    }

    return Expanded(
      child: Center(
        child: Text(
          display,
          style: style,
        ),
      ),
    );
  }

  //botão de confirmação de renderização
  renderConfirmButton() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
      child: GestureDetector(
        onTap: amount.isNotEmpty ? () {} : null,
        child: Container(
          height: 8.0,
          width: double.infinity,
          decoration: BoxDecoration(
            color: amount.isNotEmpty ? Colors.blue : Colors.grey,
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: Center(
            child: Text(
              'Submit',
              style: TextStyle(
                color: amount.isNotEmpty ? Colors.white : Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
            size: 16,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          color: Colors.white,
          child: Column(children: [
            SizedBox(height: 8),
            Image(
              width: size.width * .2,
              fit: BoxFit.cover,
              image: AssetImage(
                'assets/img/logo/logo2.png',
              ),
            ),
            SizedBox(height: 20),
            Text(
              textAlign: TextAlign.center,
              'Enter your mobile\nnumber',
              style: TextStyle(
                letterSpacing: 1.4,
                color: lightFontDark,
                fontSize: 27,
                fontWeight: FontWeight.w700,
              ),
            ),
            SizedBox(height: 20),
            const Text(
              'We will send you a verification code',
              style: TextStyle(
                  color: lightFontGrey,
                  fontSize: 16,
                  fontWeight: FontWeight.normal,
                  fontFamily: 'DMSans'),
            ),
            SizedBox(height: 20),
            renderAmount(),
            SizedBox(height: 10),
            ButtonCustom(),
            SizedBox(height: 10),
            Text(
              textAlign: TextAlign.center,
              'By clicking on “Continue” you are agreeing\nto our terms of use',
              style: TextStyle(color: lightFontGrey),
            ),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 300,
                decoration: BoxDecoration(
                  color: lightFontGrey2,
                  borderRadius: BorderRadius.circular(50),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ...renderKeyboard(),
                  ],
                ),
              ),
            ),

            //renderConfirmButton(),
          ]),
        ),
      ),
    );
  }
}

class ButtonCustom extends StatelessWidget {
  const ButtonCustom({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
            const EdgeInsets.symmetric(horizontal: 120, vertical: 15)),
        backgroundColor: MaterialStateProperty.all<Color>(lightColorsPrimary2),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(45),
          ),
        ),
      ),
      onPressed: () {
        Navigator.pushNamed(context, AppRouter.home);
      },
      child: const Text(
        'Continue',
        style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
      ),
    );
  }
}
