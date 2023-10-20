import 'package:flutter/material.dart';

import '../common/color_extension.dart';
 
class RoundTextField extends StatelessWidget {
  final String hintText;
  final TextInputType? keyboardType;
  final TextEditingController? controller;
  final Widget? right;
  final bool obscureText;

  const RoundTextField(
      {super.key,
      required this.hintText,
      this.keyboardType,
      this.controller,
      this.right,
      this.obscureText = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      padding: const EdgeInsets.symmetric(horizontal: 25),
      alignment: Alignment.center,
      decoration: BoxDecoration(
          border: Border.all(color: TColor.secondaryText, width: 1),
          borderRadius: BorderRadius.circular(25)),
      child: TextField(
        controller: controller,
        keyboardType: keyboardType,
        obscureText: obscureText,
        decoration: InputDecoration(
          enabledBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
          suffixIcon: right,
          hintText: hintText,
          hintStyle: TextStyle(
              color: TColor.secondaryText,
              fontSize: 13,
              fontWeight: FontWeight.w500),
        ),
      ),
    );
  }
}
