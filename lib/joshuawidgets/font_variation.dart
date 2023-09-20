import 'dart:ui';

import 'package:flutter/material.dart';

class Variation extends StatelessWidget {
  const Variation({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _builderCard(context, 400, 50, 50),
        _builderCard(context, 500, 70, 60),
        _builderCard(context, 600, 80, 70),
        _builderCard(context, 700, 90, 80),
        _builderCard(context, 900, 100, 100),
      ],
    );
  }

  Widget _builderCard(
    BuildContext context,
    double weight,
    double width,
    double grade,
  ) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Container(
        height: 100,
        decoration: BoxDecoration(
          border: Border.all(width: 2),
        ),
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Row(children: [
            Text(
              'Sample text',
              style: TextStyle(
                //need to import the font file so the FontVariation() works
                fontFamily: 'RobotoSerif',
                fontSize: 32,
                fontVariations: [
                  FontVariation('wght', weight),
                  FontVariation('wdth', width),
                  FontVariation('GRAD', grade),
                ],
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
