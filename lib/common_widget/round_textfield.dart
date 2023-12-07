import 'package:flutter/material.dart';
import '../common/color_extension.dart';

class RoundTextField extends StatefulWidget {
  final String hintText;
  final TextInputType? keyboardType;
  final TextEditingController? controller;
  final Widget? right;
  final bool obscureText;
  final String? Function(String?)? validator;
  final VoidCallback? togglePasswordVisibility;

  const RoundTextField({
    Key? key,
    required this.hintText,
    this.keyboardType,
    this.controller,
    this.right,
    this.obscureText = false,
    this.validator,
    this.togglePasswordVisibility,
  }) : super(key: key);

  @override
  State<RoundTextField> createState() => _RoundTextFieldState();
}

class _RoundTextFieldState extends State<RoundTextField> {
  // bool _isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      padding: const EdgeInsets.symmetric(horizontal: 25),
      alignment: Alignment.center,
      decoration: BoxDecoration(
          border: Border.all(color: TColor.secondaryText, width: 1),
          borderRadius: BorderRadius.circular(25)),
      child: TextFormField(
        controller: widget.controller,
        keyboardType: widget.keyboardType,

        obscureText:
            widget.obscureText, // Use local variable to control obscure text

        // validator: widget.validator,
        decoration: InputDecoration(
          enabledBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
          suffixIcon: widget.right != null
              ? GestureDetector(
                  onTap: () {
                    widget.togglePasswordVisibility?.call();
                  },
                  child: widget.right,
                )
              : null,
          hintText: widget.hintText,
          hintStyle: TextStyle(
              color: TColor.secondaryText,
              fontSize: 13,
              fontWeight: FontWeight.w500),
        ),
      ),
    );
  }
}
