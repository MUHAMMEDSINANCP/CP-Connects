import 'package:flutter/material.dart';

import '../common/color_extension.dart';
 
class TabButton extends StatelessWidget {
  final String title;
  final String icon;
  final bool isSelect;
  final VoidCallback onPressed;

  const TabButton(
      {super.key,
      required this.title,
      required this.icon,
      required this.isSelect,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: SizedBox(
        width: 70,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              icon,
              width: 30,
              height: 30,
              color: isSelect ? TColor.primary : null,
            ),

            const SizedBox(height: 4,),
            Text(
              title,
              style: TextStyle(
                  color: isSelect ? TColor.primary : TColor.secondaryText,
                  fontSize: 8,
                  fontWeight: FontWeight.w500),
            )
          ],
        ),
      ),
    );
  }
}
