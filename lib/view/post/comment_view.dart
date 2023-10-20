import 'package:flutter/material.dart';

import '../../common/color_extension.dart';
import '../../common_widget/comment_row.dart';

class CommentView extends StatefulWidget {
  const CommentView({super.key});

  @override
  State<CommentView> createState() => _CommentViewState();
}

class _CommentViewState extends State<CommentView> {
  List commentArr = [
    {
      "name": "Ronald Shores",
      "comment": "Impressive set up",
      "time": "14m ago",
      "image": "assets/img/u1.png"
    },
    {
      "name": "Jimmy Love",
      "comment": "Where's you office?",
      "time": "30m ago",
      "image": "assets/img/u2.png"
    },
    {
      "name": "Sha Gaines",
      "comment": "I remember being away that day",
      "time": "31m ago",
      "image": "assets/img/u3.png"
    },
    {
      "name": "Ivey Wilson",
      "comment": "Hahaha you made me clean your...",
      "time": "35m ago",
      "image": "assets/img/u4.png"
    },
    {
      "name": "Bradley Dame",
      "comment": "That was the day we got nothing...",
      "time": "1h ago",
      "image": "assets/img/u1.png"
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.5,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Image.asset(
            "assets/img/back.png",
            width: 25,
            height: 25,
          ),
        ),
        centerTitle: true,
        title: Text(
          "Comments",
          style: TextStyle(
            color: TColor.primaryText,
            fontSize: 20,
            fontWeight: FontWeight.w700,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: ClipRRect(
              borderRadius: BorderRadius.circular(17.5),
              child: Image.asset(
                "assets/img/user_profile.png",
                width: 35,
                height: 35,
                fit: BoxFit.cover,
              ),
            ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text.rich(
              TextSpan(
                  text:
                      "Obsessed with my desk at work. All cleaned & organized after 5 years ",
                  style: TextStyle(
                    color: TColor.primaryText,
                    fontSize: 14,
                  ),
                  children: [
                    TextSpan(
                      text: "#workdesk",
                      style: TextStyle(
                        color: TColor.primary,
                        fontSize: 14,
                      ),
                    ),
                    TextSpan(
                      text: " #worklife",
                      style: TextStyle(
                        color: TColor.primary,
                        fontSize: 14,
                      ),
                    ),
                    TextSpan(
                      text: " #agency",
                      style: TextStyle(
                        color: TColor.primary,
                        fontSize: 14,
                      ),
                    )
                  ]),
            ),
            const SizedBox(
              height: 4,
            ),
            Text(
              "22 hours ago",
              style: TextStyle(
                color: TColor.secondaryText,
                fontSize: 13,
              ),
            ),
            const Divider(),
            Expanded(
              child: ListView.builder(
                  padding: EdgeInsets.zero,
                  itemCount: commentArr.length,
                  itemBuilder: (context, index) {
                    var cObj = commentArr[index] as Map? ?? {};

                    return CommentRow(
                      cObj: cObj,
                    );
                  }),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 15),
        decoration: const BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
                color: Colors.black12, blurRadius: 2, offset: Offset(0, -2))
          ],
        ),
        child: BottomAppBar(
          color: Colors.transparent,
          elevation: 0,
          child: Row(
            children: [
              IconButton(
                onPressed: () {},
                icon: Image.asset(
                  "assets/img/emoji.png",
                  width: 30,
                  height: 30,
                ),
              ),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(25),
                    border: Border.all(
                      color: TColor.primaryText.withOpacity(0.8),
                      width: 0.5,
                    ),
                  ),
                  child: const TextField(
                    decoration: InputDecoration(
                        focusedBorder: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        hintText: "Type a message....",
                        hintStyle: TextStyle(
                            fontSize: 13, fontWeight: FontWeight.w500)),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
