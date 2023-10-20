import 'package:avatar_stack/avatar_stack.dart';
import 'package:avatar_stack/positions.dart';
import 'package:flutter/material.dart';

import '../common/color_extension.dart';
 
class UserChatRow extends StatelessWidget {
  final Map uObj;
  final VoidCallback onPressed;
  const UserChatRow({super.key, required this.uObj, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    var isGroup = uObj["is_group"] as bool? ?? false;
    var imagesArr = isGroup ? uObj["image"] as List? ?? [] : [];
    final settings = RestrictedPositions(
      maxCoverage: 0.3,
      minCoverage: 0.1,
      align: StackAlign.left,
      infoIndent: 4,
    );

    return InkWell(
      onTap: onPressed,
      child: Container(
        height: 70,
        alignment: Alignment.center,
        child: Row(
          children: [
            if (isGroup)
              SizedBox(
                width: 120,
                height: 50,
                child: WidgetStack(
                  positions: settings,
                  stackedWidgets: imagesArr
                      .map((img) => Container(
                            width: 45,
                            height: 45,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(25),
                                border: Border.all(color: Colors.white, width: 2),
                                color: Colors.white,
                                boxShadow: const [
                                  BoxShadow(
                                    color: Colors.black12,
                                    blurRadius: 2,
                                  )
                                ]),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(25),
                              child: Image.asset(
                                img as String? ?? "",
                                width: 45,
                                height: 45,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ))
                      .toList(),
                  buildInfoWidget: (surplus) {
                    return Center(
                        child: Text(
                      '+$surplus',
                    ));
                  },
                ),
              )
            else
              Stack(
                alignment: Alignment.topRight,
                children: [
    
                  Container(
                            width: 50,
                            height: 50,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(color: Colors.white, width: 2),
                                color: Colors.white,
                                boxShadow: const [
                                  BoxShadow(
                                    color: Colors.black12,
                                    blurRadius: 1,
                                  )
                                ]),
                            child:
    
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.asset(
                      uObj["image"] as String? ?? "",
                      width: 50,
                      height: 50,
                      fit: BoxFit.cover,
                    ),
                  ),),
                  if (uObj["is_online"] as bool? ?? false)
                    Container(
                      width: 15,
                      height: 15,
                      decoration: BoxDecoration(
                          color: TColor.base,
                          border: Border.all(color: Colors.white, width: 2),
                          borderRadius: BorderRadius.circular(7.5),
                          boxShadow: const [
                            BoxShadow(color: Colors.black12, blurRadius: 2)
                          ]),
                    )
                ],
              ),
            const SizedBox(
              width: 8,
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          uObj["name"] as String? ?? "",
                          textAlign: TextAlign.left,
                          maxLines: 1,
                          style: TextStyle(
                            color: TColor.primaryText,
                            fontSize: 17,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      Text(
                        uObj["time"] as String? ?? "",
                        textAlign: TextAlign.left,
                        maxLines: 1,
                        style: TextStyle(
                          color: TColor.secondaryText,
                          fontSize: 13,
                        ),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          uObj["last_message"] as String? ?? "",
                          textAlign: TextAlign.left,
                          maxLines: 1,
                          style: TextStyle(
                            color: TColor.secondaryText,
                            fontSize: 15,
                          ),
                        ),
                      ),
                      if (uObj["is_online"] as bool? ?? false)
                      Text(
                        "Active",
                        textAlign: TextAlign.left,
                        maxLines: 1,
                        style: TextStyle(
                          color: TColor.base,
                          fontSize: 11,
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
