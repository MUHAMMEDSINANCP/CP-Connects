import 'package:flutter/material.dart';

import '../common/color_extension.dart';
 
class UserRow extends StatelessWidget {
  final Map uObj;
  const UserRow({super.key, required this.uObj});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.asset(
              uObj["image"] as String? ?? "",
              width: 40,
              height: 40,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(
            width: 8,
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  uObj["name"] as String? ?? "",
                  textAlign: TextAlign.left,
                  maxLines: 1,
                  style: TextStyle(
                    color: TColor.primaryText,
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(
                  height: 2,
                ),
                Text(
                  uObj["tag"] as String? ?? "",
                  textAlign: TextAlign.left,
                  maxLines: 1,
                  style: TextStyle(
                    color: TColor.secondaryText,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
          
        ],
      ),
    );
  }
}