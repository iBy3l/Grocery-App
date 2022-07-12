import 'package:flutter/material.dart';

import '../../../../model/descrition_models.dart';
import '../../../theme/colors.dart';

class DescriWidget extends StatelessWidget {
  DescriWidget({
    Key? key,
  }) : super(key: key);

  final List<Descri> descri = Descri.descris.map((descri) => descri).toList();

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      primary: false,
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          mainAxisExtent: 70,
          maxCrossAxisExtent: 200,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16),
      itemCount: descri.length,
      itemBuilder: (context, index) {
        return Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Colors.white,
                border: Border.all(width: 1, color: lightFontGrey2)),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 16),
                  child: Image(
                      image: AssetImage(
                    descri[index].imgD,
                  )),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text('${descri[index].valor} ',
                            style: TextStyle(
                                color: lightColorsPrimary,
                                fontSize: 16,
                                fontWeight: FontWeight.bold)),
                        Text(' ${descri[index].tipy}',
                            style: TextStyle(
                                color: lightColorsPrimary,
                                fontSize: 14,
                                fontWeight: FontWeight.bold)),
                      ],
                    ),
                    Text(descri[index].name,
                        style: TextStyle(
                            color: lightFontGrey,
                            fontSize: 16,
                            fontWeight: FontWeight.w700)),
                  ],
                ),
              ],
            ));
      },
    );
  }
}
