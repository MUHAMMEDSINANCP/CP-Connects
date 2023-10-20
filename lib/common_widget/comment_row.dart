import 'package:flutter/material.dart';

import '../common/color_extension.dart';
 
class CommentRow extends StatelessWidget {
  final Map cObj;
  const CommentRow({super.key, required this.cObj});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.asset(
              cObj["image"] as String? ?? "",
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
                Wrap(
                  alignment: WrapAlignment.start,
                  children: [
                    Text(
                      cObj["name"] as String? ?? "",
                      textAlign: TextAlign.left,
                      maxLines: 1,
                      style: TextStyle(
                        color: TColor.primaryText,
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Text(
                      " | ${cObj["time"] as String? ?? ""} ",
                      textAlign: TextAlign.left,
                      maxLines: 1,
                      style: TextStyle(
                        color: TColor.secondaryText,
                        fontSize: 13,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 2,
                ),
                Text(
                  cObj["comment"] as String? ?? "",
                  textAlign: TextAlign.left,
                  maxLines: 1,
                  style: TextStyle(
                    color: TColor.secondaryText,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            width: 60,
            child: TextButton(
              
              onPressed: () {},
              child: Text(
                "Replay",
                style: TextStyle(color: TColor.secondaryText, fontSize: 13),
              ),
            ),
          ),
          IconButton(
              onPressed: () {},
              icon: Image.asset(
                "assets/img/fav.png",
                width: 20,
                height: 20,
              ))
        ],
      ),
    );
  }
}
