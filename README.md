# Flutter Todo App

A fully functional Todo App built with Flutter using sqflite for local database storage and Provider for state management.  
Includes complete CRUD operations and todo completion toggle with offline persistence.

---

## Features

- Add new todos  
- Mark todo as complete/incomplete (toggle)  
- Strike-through UI for completed todos  
- Delete todos  
- Local SQLite database (offline support)  
- State management using Provider  
- Auto UI update on data changes  
- Clean and simple interface  
- Formatted date display  

---

## Tech Stack

Flutter – UI framework  
Dart – Programming language  
sqflite – Local SQLite database  
path – Database file path  
Provider – State management  
intl – Date formatting  

---

## Dependencies (pubspec.yaml)

dependencies:    
sqflite: ^2.3.0  
path: ^1.8.3  
provider: ^6.1.1  
intl: ^0.19.0  

---

## Project Structure

lib/  
│  
├── models/  
│   └── todo_model.dart  
│  
├── providers/  
│   └── todo_provider.dart  
│  
├── db/  
│   └── db_helper.dart  
│  
├── screens/  
│   └── home_screen.dart  
│  
└── main.dart  

---

## Core Functionalities

- Create: Add new todo  
- Read: Fetch stored todos from SQLite  
- Update: Toggle complete/incomplete  
- Delete: Remove a todo  
- Persistent data storage  

---

## Support

If you like this project, please ⭐ star the repository on GitHub.
