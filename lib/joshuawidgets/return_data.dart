import 'package:flutter/material.dart';
import 'package:your_first_app/joshua.dart';

class ReturnHomeScreen extends StatefulWidget {
  const ReturnHomeScreen({super.key});

  @override
  State<ReturnHomeScreen> createState() => _ReturnHomeScreenState();
}

class _ReturnHomeScreenState extends State<ReturnHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: appBarBuilder('Returning Data Demo', true),
        body: Center(
          child: ElevatedButton(
            child: Text('Pick an option, any option!'),
            onPressed: () {
              _navigateAndDisplaySelection(context);
            },
          ),
        ),
      ),
    );
  }

  Future<void> _navigateAndDisplaySelection(BuildContext context) async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => TwoButtons(),
      ),
    );

    if (!mounted) return;

    ScaffoldMessenger.of(context)
      ..removeCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          content: Text('$result'),
        ),
      );
  }
}

class TwoButtons extends StatelessWidget {
  const TwoButtons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ButtonBuilder(message: 'Yep!'),
        SizedBox(width: 10),
        ButtonBuilder(message: 'Nope!'),
      ],
    );
  }
}

class ButtonBuilder extends StatelessWidget {
  const ButtonBuilder({super.key, required this.message});

  final String message;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 100,
      height: 50,
      child: ElevatedButton(
        onPressed: () {
          Navigator.pop(context, message);
        },
        child: Text(message),
      ),
    );
  }
}
