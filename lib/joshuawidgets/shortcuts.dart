import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:your_first_app/joshua.dart';

class ShortCuts extends StatelessWidget {
  const ShortCuts({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: appBarBuilder('Shortcut Demo', true),
        body: CopyableTextField(),
      ),
    );
  }
}

class CopyableTextField extends StatefulWidget {
  const CopyableTextField({super.key});

  @override
  State<CopyableTextField> createState() => _CopyableTextFieldState();
}

class _CopyableTextFieldState extends State<CopyableTextField> {
  late TextEditingController controller = TextEditingController();
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Actions(
      actions: <Type, Action<Intent>>{
        ClearIntent: ClearAction(controller),
        CopyIntent: CopyAction(controller),
      },
      child: Builder(
        builder: (context) {
          return Scaffold(
            body: Center(
              child: Row(
                children: <Widget>[
                  const Spacer(),
                  Expanded(
                    child: TextField(
                      controller: controller,
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.copy),
                    onPressed: Actions.handler<CopyIntent>(
                        context, const CopyIntent()),
                  ),
                  IconButton(
                    onPressed: Actions.handler<SelectAllIntent>(
                        context, SelectAllIntent()),
                    icon: Icon(Icons.select_all),
                  ),
                  const Spacer(),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class SelectAllIntent extends Intent {
  const SelectAllIntent();
}

class SelectAllAction extends Action<SelectAllIntent> {
  SelectAllAction(this.controller);

  final TextEditingController controller;

  @override
  Object? invoke(covariant SelectAllIntent intent) {
    controller.selection = controller.selection.copyWith(
      baseOffset: 0,
      affinity: controller.selection.affinity,
      extentOffset: controller.text.length,
    );
    return null;
  }
}

class CopyIntent extends Intent {
  const CopyIntent();
}

class CopyAction extends Action<CopyIntent> {
  CopyAction(this.controller);
  final TextEditingController controller;

  @override
  Object? invoke(covariant CopyIntent intent) {
    final String selectedString = controller.text.substring(
      controller.selection.baseOffset,
      controller.selection.extentOffset,
    );
    Clipboard.setData(ClipboardData(text: selectedString));
    return null;
  }
}

class ClearIntent extends Intent {
  const ClearIntent();
}

class ClearAction extends Action<ClearIntent> {
  final TextEditingController controller;
  ClearAction(this.controller);

  @override
  Object? invoke(covariant ClearIntent intent) {
    controller.clear();
    return null;
  }
}
