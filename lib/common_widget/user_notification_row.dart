import 'package:flutter/material.dart';

import '../common/color_extension.dart';

class UserNotificationRow extends StatelessWidget {
  final Map nObj;
  const UserNotificationRow({super.key, required this.nObj});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.asset(
              nObj["image"] as String? ?? "",
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
                  nObj["name"] as String? ?? "",
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
                  "${nObj["message"] as String? ?? ""} | ${nObj["time"] as String? ?? ""} ",
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
          IconButton(
              onPressed: () {},
              icon: Image.asset(
                "assets/img/more.png",
                width: 20,
                height: 20,
              ))
        ],
      ),
    );
  }
}
