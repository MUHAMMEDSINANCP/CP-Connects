import 'package:flutter/material.dart';

import '../common/color_extension.dart';

class UserStoryCell extends StatelessWidget {
  final Map sObj;
  const UserStoryCell({super.key, required this.sObj});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(14),
          child: AspectRatio(
            aspectRatio: 1 / 1.02,
            child: Image.asset(
              sObj["image"] as String? ?? "",
              fit: BoxFit.cover,
              width: double.maxFinite,
              height: double.maxFinite,
            ),
          ),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image.asset(
                sObj["user_image"] as String? ?? "",
                fit: BoxFit.cover,
                width: 30,
                height: 30,
              ),
            ),
            Text(
              sObj["name"] as String? ?? "",
              maxLines: 1,
              style: TextStyle(color: TColor.secondaryText, fontSize: 13),
            )
          ],
        )
      ],
    );
  }
}
