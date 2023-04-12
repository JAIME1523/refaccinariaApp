import 'package:flutter/material.dart';

class DecorationCustom {
  static InputDecoration registro({
    required String hint,
  }) {
    return InputDecoration(
      border: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.white.withOpacity(0.3)),
      ),

      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.white.withOpacity(0.3)),
      ),
      hintText: hint,
      // labelText: label,
      hintStyle: const TextStyle(color: Colors.grey),
      labelStyle: const TextStyle(color: Colors.grey),
    );
  }
}
