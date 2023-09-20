import 'package:flutter/material.dart';
import 'package:your_first_app/joshua.dart';

class FocusedWidget extends StatelessWidget {
  const FocusedWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: appBarBuilder('Focused Demo', true),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CustomWidget(),
            CustomWidget(),
            CustomWidget(),
          ],
        ),
      ),
    );
  }
}

class CustomWidget extends StatefulWidget {
  const CustomWidget({super.key});

  @override
  State<CustomWidget> createState() => _CustomWidgetState();
}

class _CustomWidgetState extends State<CustomWidget> {
  Color _color = Colors.white;
  String _label = 'Unfocused';
  @override
  Widget build(BuildContext context) {
    return Focus(
      child: Container(
        height: 100,
        width: 300,
        alignment: Alignment.center,
        color: _color,
        child: Text(_label),
      ),
      onFocusChange: (focused) {
        setState(() {
          _color = focused ? Colors.black26 : Colors.white;
          _label = focused ? 'Focused' : 'Unfocused';
        });
      },
    );
  }
}
