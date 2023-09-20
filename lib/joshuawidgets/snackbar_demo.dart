import 'package:flutter/material.dart';
import 'package:your_first_app/joshua.dart';

class SnackBarDemo extends StatelessWidget {
  const SnackBarDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: appBarBuilder('SnackBar Demo', true),
        body: _snackButton(context),
      ),
    );
  }

  Widget _snackButton(BuildContext context) {
    return Center(
      child: ElevatedButton(
        onPressed: () {
          final snck = SnackBar(
            content: Text('Yay! A SnackBar!'),
            action: SnackBarAction(
              label: 'Undo',
              onPressed: () {},
            ),
          );

          ScaffoldMessenger.of(context).showSnackBar(snck);
        },
        child: Text('Show Snackbar'),
      ),
    );
  }
}
