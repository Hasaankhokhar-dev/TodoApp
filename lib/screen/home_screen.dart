import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/todo_provider.dart';
import 'add_edit_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Todo App',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blueGrey,
      ),

      body: Consumer<TodoProvider>(
        builder: (context, provider, child) {
          // Todos List
          return ListView.builder(
            itemCount: provider.todos.length,
            itemBuilder: (context, index) {
              final todo = provider.todos[index];
              return Card(
                margin: EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 8,
                ),
                child: ListTile(

                  // Checkbox
                  leading: Checkbox(
                    value: todo.isCompleted == 1,
                    activeColor: Colors.blueGrey,
                    onChanged: (value) {
                      provider.toggleTodo(todo);
                    },
                  ),

                  // Title
                  title: Text(
                    todo.title,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      // Complete hone pe line aaye
                      decoration: todo.isCompleted == 1
                          ? TextDecoration.lineThrough
                          : TextDecoration.none,
                      color: todo.isCompleted == 1
                          ? Colors.grey
                          : Colors.black,
                    ),
                  ),

                  // Date
                  subtitle: Text(todo.date),

                  // Delete
                  trailing: IconButton(
                    icon: Icon(
                      Icons.delete,
                      color: Colors.red,
                    ),
                    onPressed: () {
                      provider.deleteTodo(todo.id!);
                    },
                  ),
                ),
              );
            },
          );
        },
      ),

      // Add Button
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blueGrey,
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AddScreen(),
            ),
          );
        },
        child: Icon(Icons.add, color: Colors.white),
      ),
    );
  }
}