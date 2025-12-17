import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(const DoctorApp());
}

class DoctorApp extends StatelessWidget {
  const DoctorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: const Color.fromARGB(255, 99, 21, 82),
          title: const Text('المستشار الطبي'),
          titleTextStyle: TextStyle(
            color: const Color.fromARGB(223, 240, 236, 236),
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
