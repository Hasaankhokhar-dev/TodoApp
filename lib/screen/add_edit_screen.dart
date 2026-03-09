import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import '../models/todo_model.dart';
import '../provider/todo_provider.dart';

class AddScreen extends StatefulWidget {
  const AddScreen({super.key});

  @override
  State<AddScreen> createState() => _AddScreenState();
}

class _AddScreenState extends State<AddScreen> {
  final TextEditingController _titleController =
  TextEditingController();

  void _saveTodo() async {
    // Validation
    if (_titleController.text.isEmpty) return;

    // Todo banao
    Todo todo = Todo(
      title: _titleController.text,
      isCompleted: 0, // Default incomplete
      date:DateFormat('dd MMM yyy').format(DateTime.now()),
    );

    // Provider se save karo
    await Provider.of<TodoProvider>(
      context,
      listen: false,
    ).addTodo(todo);

    if (mounted) Navigator.pop(context);
  }

  @override
  void dispose() {
    _titleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Add Todo',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blueGrey,
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          children: [
            SizedBox(height: 15),

            // Title Field
            TextField(
              controller: _titleController,
              decoration: InputDecoration(
                labelText: 'Todo Title',
                hintText: 'Work Todo?',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            SizedBox(height: 16),

            // Save Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: _saveTodo,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blueGrey,
                  foregroundColor: Colors.white,
                  padding: EdgeInsets.symmetric(vertical: 15),
                ),
                child: Text('Save Todo'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}