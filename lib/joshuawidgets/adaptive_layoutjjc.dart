import 'package:flutter/material.dart';
import 'package:your_first_app/joshua.dart';

// https://www.youtube.com/watch?v=8sAyPDLorek&t=1s

class Adaptive extends StatelessWidget {
  const Adaptive({super.key});

  @override
  Widget build(BuildContext context) {
    const title = 'Adaptive Layout';
    return MaterialApp(
      title: title,
      home: Scaffold(
        appBar: appBarBuilder(title, true),
        body: OrientationBuilder(
          builder: (context, orientation) {
            return GridView.count(
              crossAxisCount: orientation == Orientation.portrait ? 2 : 4,
              children: List.generate(
                100,
                (index) => Center(
                  child: Text(
                    '$index',
                    style: Theme.of(context).textTheme.displaySmall,
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
