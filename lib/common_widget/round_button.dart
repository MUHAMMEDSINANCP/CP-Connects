import 'package:flutter/material.dart';

import '../common/color_extension.dart';

enum RoundButtonType { whiteBoard, primary }

class RoundButton extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;
  final bool isLoading;
  final RoundButtonType type;

  const RoundButton({
    super.key,
    required this.title,
    required this.onPressed,
    this.type = RoundButtonType.primary,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(25),
      onTap: onPressed,
      child: Container(
        height: 50,
        padding: const EdgeInsets.symmetric(horizontal: 25),
        decoration: BoxDecoration(
            border: type == RoundButtonType.primary
                ? null
                : Border.all(color: TColor.primaryTextW, width: 1),
            color: type == RoundButtonType.primary
                ? TColor.primary
                : Colors.transparent,
            borderRadius: BorderRadius.circular(25)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            isLoading
                ? SizedBox(
                    height: 26,
                    width: 26,
                    child: CircularProgressIndicator(
                      strokeWidth: 5,
                      color: Colors.white,
                      backgroundColor: TColor.secondaryEnd,
                    ),
                  )
                : Text(
                    title,
                    style: TextStyle(
                      color: TColor.primaryTextW,
                      fontSize: 15,
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
