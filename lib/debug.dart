// import 'package:flutter/material.dart';
//
// void main() {
//   runApp(TodoListApp());
// }
//
// class TodoListApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Todo List App',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: TodoListPage(),
//     );
//   }
// }
//
// class TodoListPage extends StatefulWidget {
//   @override
//   _TodoListPageState createState() => _TodoListPageState();
// }
//
// class _TodoListPageState extends State<TodoListPage> {
//   List<String> todos = [];
//   final TextEditingController _textController = TextEditingController();
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Todo List'),
//         centerTitle: true,
//       ),
//       body: ListView.builder(
//         itemCount: todos.length,
//         itemBuilder: (context, index) {
//           return ListTile(
//             title: Text(todos[index]),
//           );
//         },
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () async {
//           final newTodo = await showDialog<String>(
//             context: context,
//             builder: (context) => AddTodoDialog(),
//           );
//
//           if (newTodo != null) {
//             setState(() {
//               todos.add(newTodo);
//             });
//           }
//         },
//         child: Icon(Icons.add),
//       ),
//       bottomNavigationBar: BottomAppBar(
//         child: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: ElevatedButton(
//             onPressed: () async {
//               await Navigator.push(
//                 context,
//                 MaterialPageRoute(
//                   builder: (context) => CompletedTodoPage(todos: todos),
//                 ),
//               );
//               setState(() {
//                 // Clear todos after returning from CompletedTodoPage
//                 todos.clear();
//               });
//             },
//             child: Text('완료'),
//           ),
//         ),
//       ),
//     );
//   }
//
//   @override
//   void dispose() {
//     _textController.dispose();
//     super.dispose();
//   }
// }
//
// class AddTodoDialog extends StatelessWidget {
//   final TextEditingController _textController = TextEditingController();
//
//   @override
//   Widget build(BuildContext context) {
//     return AlertDialog(
//       title: Text('Add Todo'),
//       content: TextField(
//         controller: _textController,
//         decoration: InputDecoration(hintText: 'Enter your todo'),
//       ),
//       actions: <Widget>[
//         TextButton(
//           onPressed: () {
//             Navigator.of(context).pop();
//           },
//           child: Text('Cancel'),
//         ),
//         TextButton(
//           onPressed: () {
//             final newTodo = _textController.text;
//             Navigator.of(context).pop(newTodo);
//           },
//           child: Text('Add'),
//         ),
//       ],
//     );
//   }
// }
//
// class CompletedTodoPage extends StatelessWidget {
//   final List<String> todos;
//
//   CompletedTodoPage({required this.todos});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Completed Todos'),
//         centerTitle: true,
//       ),
//       body: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Expanded(
//             child: ListView.builder(
//               itemCount: todos.length,
//               itemBuilder: (context, index) {
//                 return ListTile(
//                   title: Text(todos[index]),
//                 );
//               },
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.all(16.0),
//             child: ElevatedButton(
//               onPressed: () {
//                 Navigator.pop(context); // Go back to the first page
//               },
//               child: Text('Home'),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }


