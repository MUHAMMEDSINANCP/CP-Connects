import 'package:flutter/material.dart';

import '../common/color_extension.dart';
 
class RecommendCell extends StatelessWidget {
  final Map rObj;
  final bool isActive;
  final VoidCallback onPressed;
  const RecommendCell({super.key, required this.rObj, this.isActive = false, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 8.0),
        width: 80,
        alignment: Alignment.center,
        child: Column(
          children: [
            Stack(
              alignment: Alignment.topRight,
              children:[ Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40),
                  gradient: LinearGradient(
                    colors: TColor.secondaryG,
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
                alignment: Alignment.center,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(35),
                  child: Image.asset(
                    rObj["image"] as String? ?? "",
                    width: 70,
                    height: 70,
                    fit: BoxFit.cover,
                  ),
                ),
              ), 

              if (isActive)
                Container(
                  width: 20,
                  height: 20,
                  decoration: BoxDecoration(
                      color: TColor.base,
                      border: Border.all(color: Colors.white, width: 2),
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: const [
                        BoxShadow(color: Colors.black12, blurRadius: 2)
                      ]),
                )
              
              ]
            ),
            Text(
              rObj["name"] as String? ?? "",
              textAlign: TextAlign.left,
              maxLines: 1,
              style: TextStyle(
                color: TColor.secondaryText,
                fontSize: 13,
              ),
            )
          ],
        ),
      ),
    );
  }
}
