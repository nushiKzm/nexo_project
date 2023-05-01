import 'package:flutter/material.dart';
import 'package:nexo_project/ui/list/list.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          centerTitle: true,
        ),
        textTheme: TextTheme(
          headlineSmall: TextStyle(fontSize: 20),
          titleLarge: TextStyle(fontWeight: FontWeight.bold),
          labelLarge: TextStyle(fontSize: 20, fontWeight: FontWeight.normal),
          labelSmall:
              TextStyle(color: Colors.black.withOpacity(0.3), fontSize: 16),
        ),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const ListScreen(),
    );
  }
}
