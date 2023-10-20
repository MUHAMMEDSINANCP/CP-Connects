import 'package:flutter/material.dart';

import '../common/color_extension.dart';
 
class ChatDateBubble extends StatelessWidget {
  final String date;
  const ChatDateBubble({super.key, required this.date});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: Row(
        children: [
          Expanded(
            child: Container(
              height: 0.5,
              color: TColor.primaryText.withOpacity(0.8),
            ),
          ),
          const SizedBox(
            width: 15,
          ),
          Text(
            date,
            textAlign: TextAlign.center,
            style: TextStyle(color: TColor.secondaryText, fontSize: 13),
          ),
          const SizedBox(
            width: 15,
          ),
          Expanded(
            child: Container(
              height: 0.5,
              color: TColor.primaryText.withOpacity(0.8),
            ),
          ),
        ],
      ),
    );
  }
}
