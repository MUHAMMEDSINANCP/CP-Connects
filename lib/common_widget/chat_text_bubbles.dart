import 'package:flutter/material.dart';

import '../common/color_extension.dart';

class ChatTextBubbles extends StatelessWidget {
  final Map cObj;
  final Map uObj;
  final bool isLeft;

  const ChatTextBubbles(
      {super.key,
      required this.cObj,
      required this.uObj,
      required this.isLeft});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Directionality(
          textDirection: isLeft ? TextDirection.ltr : TextDirection.rtl,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Stack(alignment: Alignment.topRight, children: [
                Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    border: Border.all(color: Colors.white, width: 2),
                    boxShadow: const [
                      BoxShadow(color: Colors.black12, blurRadius: 2)
                    ],
                  ),
                  alignment: Alignment.center,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(30),
                    child: Image.asset(
                      uObj["image"] as String? ?? "",
                      width: 60,
                      height: 60,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Container(
                  width: 15,
                  height: 15,
                  decoration: BoxDecoration(
                      color: TColor.base,
                      border: Border.all(color: Colors.white, width: 2),
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: const [
                        BoxShadow(color: Colors.black12, blurRadius: 2)
                      ]),
                )
              ]),
              const SizedBox(
                width: 10,
              ),
              Directionality(
                  textDirection: TextDirection.ltr,
                  child: Container(
                    padding: const EdgeInsets.all(15),
                    constraints: const BoxConstraints(maxWidth: 260),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color:
                            isLeft ? TColor.primary : const Color(0xff434B56)),
                    child: Column(
                      crossAxisAlignment: isLeft
                          ? CrossAxisAlignment.start
                          : CrossAxisAlignment.end,
                      children: [
                        Text(
                          cObj["message"] as String? ?? "",
                          textAlign: TextAlign.left,
                          style: const TextStyle(
                              color: Colors.white, fontSize: 15),
                        ),

                        const SizedBox(height: 4,),

                        Text(
                          cObj["time"] as String? ?? "",
                          textAlign: TextAlign.left,
                          style: const TextStyle(
                              color: Colors.white70, fontSize: 12),
                        )
                      ],
                    ),
                  ))
            ],
          )),
    );
  }
}
