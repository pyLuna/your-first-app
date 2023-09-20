import 'package:flutter/material.dart';
import 'package:your_first_app/joshua.dart';

class TouchRipple extends StatefulWidget {
  const TouchRipple({super.key});

  @override
  State<TouchRipple> createState() => _TouchRippleState();
}

class _TouchRippleState extends State<TouchRipple> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: appBarBuilder('InkWell Demo', true),
        body: _bodyButton(context),
      ),
    );
  }

  Widget _bodyButton(BuildContext context) {
    return Center(
      child: InkWell(
        onTap: () {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Tapped'),
            ),
          );
        },
        child: Padding(
          padding: EdgeInsets.all(12),
          child: Text('Flat Button'),
        ),
      ),
    );
  }
}
