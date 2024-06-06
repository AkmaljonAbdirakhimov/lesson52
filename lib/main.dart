import 'package:flutter/material.dart';
import 'package:lesson52/services/local_database.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final localDatabase = LocalDatabase();

  bool isLoading = false;

  @override
  void initState() {
    super.initState();

    final db = localDatabase.database;
  }

  void addNote() async {
    setState(() {
      isLoading = true;
    });
    await localDatabase.addNote("Ertaga mazza qilib dars qilishim kerak emas!");
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Database"),
        actions: [
          IconButton(
            onPressed: addNote,
            icon: const Icon(Icons.add),
          )
        ],
      ),
      body: Center(
        child: isLoading
            ? const CircularProgressIndicator()
            : const Text("Notes!"),
      ),
    );
  }
}
