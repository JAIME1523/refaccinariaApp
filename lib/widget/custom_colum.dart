import 'package:flutter/material.dart';

class ColumName extends StatelessWidget {
  final String name;
  const ColumName({
    super.key,
    required this.name,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          '$name:',
          style: const TextStyle(fontSize: 18),
        ),
        const SizedBox(
          height: 10,
        ),
      ],
    );
  }
}