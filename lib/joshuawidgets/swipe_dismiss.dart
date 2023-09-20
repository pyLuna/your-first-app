import 'package:flutter/material.dart';
import 'package:your_first_app/joshua.dart';

class SwipeDismiss extends StatefulWidget {
  const SwipeDismiss({super.key});

  @override
  State<SwipeDismiss> createState() => _SwipeDismissState();
}

class _SwipeDismissState extends State<SwipeDismiss> {
  final items = List<String>.generate(50, (index) => 'Index $index');
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: appBarBuilder('Dismissing Items', true),
        body: _listViewBuilder(),
      ),
    );
  }

  Widget _listViewBuilder() {
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index) {
        return _buildContainer(index);
      },
    );
  }

  Widget _buildContainer(int index) {
    final item = items[index];
    return Dismissible(
      key: Key(item),
      onDismissed: (direction) {
        setState(() {
          items.removeAt(index);
        });

        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text('$item dismissed')));
      },
      background: Container(color: Colors.red),
      secondaryBackground: Container(color: Colors.green),
      child: ListTile(
        title: Text(item),
      ),
    );
  }
}
