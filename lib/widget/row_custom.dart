import 'package:flutter/material.dart';

class RowCustom extends StatelessWidget {
  final String text1;
  final String text2;

  const RowCustom({
    super.key, required this.text1, required this.text2,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text('$text1: ', style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w400),),
        const SizedBox(
          width: 20,
        ),
        Text(text2, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
      ],
    );
  }
}