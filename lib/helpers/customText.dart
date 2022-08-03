import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final InputDecoration decoration;
  const CustomTextField({
    Key? key,
    required this.controller,
    required this.decoration,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: decoration,
    );
  }
}
