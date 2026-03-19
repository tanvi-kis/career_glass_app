import 'package:flutter/material.dart';

class HimaniScreen extends StatefulWidget {
  const HimaniScreen({super.key});

  @override
  State<HimaniScreen> createState() => _HimaniScreenState();
}

class _HimaniScreenState extends State<HimaniScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        children: [
          Text("Himani parekh")
        ],
      ),
    );
  }
}
