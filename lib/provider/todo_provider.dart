import 'package:flutter/material.dart';
import '../models/todo_model.dart';
import '../database/db_helper.dart';

class TodoProvider extends ChangeNotifier {
  final DbHelper _dbHelper = DbHelper();

  List<Todo> _todos = [];
  List<Todo> get todos => _todos;

  // Load
  Future<void> loadTodos() async {
    _todos = await _dbHelper.getTodos();
    notifyListeners();
  }

  // Add
  Future<void> addTodo(Todo todo) async {
    await _dbHelper.insertTodo(todo);
    await loadTodos();
  }

  // Toggle Complete
  Future<void> toggleTodo(Todo todo) async {
    todo.isCompleted = todo.isCompleted == 0 ? 1 : 0;
    await _dbHelper.updateTodo(todo);
    await loadTodos();
  }

  // Delete
  Future<void> deleteTodo(int id) async {
    await _dbHelper.deleteTodo(id);
    await loadTodos();
  }
}