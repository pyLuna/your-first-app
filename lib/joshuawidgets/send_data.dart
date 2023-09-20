import 'package:flutter/material.dart';
import 'package:your_first_app/joshua.dart';

List<Todo> todo = List<Todo>.generate(
  20,
  (index) => Todo(
      title: 'Todo $index',
      description: 'A description of what needs to be done for Todo $index'),
);

class SendDataToScreen extends StatelessWidget {
  const SendDataToScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: appBarBuilder('Todos', true),
        body: TodoBody(),
      ),
    );
  }
}

class TodoBody extends StatefulWidget {
  const TodoBody({super.key});

  @override
  State<TodoBody> createState() => TodoBodyState();
}

class TodoBodyState extends State<TodoBody> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: todo.length,
      itemBuilder: ((context, index) {
        return ListTile(
          title: Text(todo[index].title),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => TodoDescription(
                    // todo: todo[index],
                    ),
                settings: RouteSettings(
                  arguments: todo[index],
                ),
              ),
            );
          },
        );
      }),
    );
  }
}

class TodoDescription extends StatelessWidget {
  const TodoDescription({
    super.key,
    // required this.todo,
  });

  // final Todo todo;

  @override
  Widget build(BuildContext context) {
    final todo = ModalRoute.of(context)!.settings.arguments as Todo;
    return Scaffold(
      appBar: AppBar(
        title: Text(todo.title),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Text(todo.description),
      ),
    );
  }
}

class Todo {
  final String title;
  final String description;

  Todo({
    required this.title,
    required this.description,
  });
}
