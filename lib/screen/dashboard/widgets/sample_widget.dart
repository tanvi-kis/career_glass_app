import 'package:flutter/material.dart';

class SampleWidget extends StatelessWidget {
  final String name;
  const SampleWidget({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    return Text(name);
  }
}
