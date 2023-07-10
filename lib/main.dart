import 'package:flutter/material.dart';

import 'src/features/tasks/ui/pages/tasks_page.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'TasksPage',
      initialRoute: 'tasks',
      routes: {
        "tasks": (context) => const TasksPage(),
      },
    );
  }
}
