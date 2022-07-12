import 'package:flutter/material.dart';

class InfoProfileWidget extends StatelessWidget {
  const InfoProfileWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          backgroundImage: AssetImage('assets/img/perf/perf.png'),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Be Welcome',
                style: TextStyle(fontSize: 12),
              ),
              Text(
                'Amelia Barlow',
                style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
