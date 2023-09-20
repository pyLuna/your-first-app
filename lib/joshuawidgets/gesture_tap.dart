import 'package:flutter/material.dart';

class GestureTap extends StatelessWidget {
  const GestureTap({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Gesture Demo'),
          centerTitle: true,
          elevation: 2,
        ),
        body: Center(
          child: GestureDetector(
            onTap: () {
              const snackBar = SnackBar(content: Text('Tapped'));
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
            },
            child: Container(
              height: 50,
              width: 100,
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor.withOpacity(.5),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(
                child: Text('My Button'),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
