import 'package:cp_connects/view/home/chat_conversation_view.dart';
import 'package:cp_connects/view/home/details_view.dart';
import 'package:flutter/material.dart';

import '../../common/color_extension.dart';
import '../../common_widget/group_cell.dart';
import '../../common_widget/recommend_cell.dart';
import '../../common_widget/user_chat_row.dart';
 
class ChatView extends StatefulWidget {
  const ChatView({super.key});

  @override
  State<ChatView> createState() => _ChatViewState();
}

class _ChatViewState extends State<ChatView> {
  List activeArr = [
    {"name": "James McL..", "image": "assets/img/r1.png"},
    {"name": "Bessie Sima...", "image": "assets/img/r2.png"},
    {"name": "Jeffery Hall", "image": "assets/img/r3.png"},
    {"name": "Judy Adler", "image": "assets/img/r4.png"}
  ];

  List myChatArr = [
    {
      "name": "Alex Fish",
      "last_message": "Hey, nice shoes where are...",
      "image": "assets/img/u1.png",
      "is_online": true,
      "time": "7s ago",
      "is_group": false,
    },
    {
      "name": "Johny Vino",
      "last_message": "I'm at Batch bar waiting to...",
      "image": "assets/img/u2.png",
      "time": "20mins ago",
      "is_online": false,
      "is_group": false,
    },
    {
      "name": "Scott Horsfall",
      "last_message": "I can't find the location.",
      "image": "assets/img/u3.png",
      "time": "30 days ago",
      "is_online": true,
      "is_group": false,
    },
    {
      "name": "Group:",
      "last_message": "Andrew, Rob, +21",
      "image": [
        "assets/img/p10.png",
        "assets/img/p11.png",
        "assets/img/p12.png"
      ],
      "time": "20 days ago",
      "is_online": false,
      "is_group": true,
    }
  ];

  List myGroupArr = [
    {
      "name": "Parties in Toronto downtown",
      "image": [
        "assets/img/u1.png",
        "assets/img/u2.png",
        "assets/img/u3.png",
        "assets/img/u2.png",
        "assets/img/u1.png",
        "assets/img/u4.png",
        "assets/img/u1.png",
        "assets/img/u2.png",
        "assets/img/u3.png"
      ],
      "time": "3 days ago",
      "members": "381",
      "comments": "210"
    },
    {
      "name": "Thoughts on F45 classes?",
      "image": [
        "assets/img/u2.png",
        "assets/img/u3.png",
        "assets/img/u1.png",
        "assets/img/u3.png",
        "assets/img/u1.png",
        "assets/img/u2.png",
        "assets/img/u3.png"
      ],
      "time": "8 days ago",
      "members": "651",
      "comments": "192"
    },
    {
      "name": "UX Meet ups and coffee",
      "image": [
        "assets/img/u1.png",
        "assets/img/u2.png",
        "assets/img/u3.png",
        "assets/img/u1.png",
        "assets/img/u2.png",
        "assets/img/u3.png"
      ],
      "time": "10 days ago",
      "members": "540",
      "comments": "192"
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
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
        centerTitle: false,
        title: Text(
          "Messages",
          style: TextStyle(
            color: TColor.primaryText,
            fontSize: 20,
            fontWeight: FontWeight.w700,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const DetailsView(),
                ),
              );
            },
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
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Divider(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  Image.asset(
                    "assets/img/search.png",
                    width: 25,
                    height: 25,
                    fit: BoxFit.cover,
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        enabledBorder: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        hintText: "Search Messages",
                        hintStyle: TextStyle(
                          color: TColor.secondaryText,
                          fontSize: 13,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Image.asset(
                      "assets/img/filter.png",
                      width: 25,
                      height: 25,
                      fit: BoxFit.cover,
                    ),
                  )
                ],
              ),
            ),
            const Divider(),
            Container(
              width: double.maxFinite,
              decoration: const BoxDecoration(color: Colors.white, boxShadow: [
                BoxShadow(
                    color: Colors.black12, blurRadius: 3, offset: Offset(0, 2))
              ]),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Text(
                      "Active",
                      style: TextStyle(
                        color: TColor.primaryText,
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 110,
                    child: ListView.builder(
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        scrollDirection: Axis.horizontal,
                        itemCount: activeArr.length,
                        itemBuilder: (context, index) {
                          var rObj = activeArr[index] as Map? ?? {};
                          return RecommendCell(
                            rObj: rObj,
                            isActive: true,
                            onPressed: () {},
                          );
                        }),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "My chats",
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      color: TColor.primaryText,
                      fontSize: 19,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Image.asset(
                      "assets/img/edit.png",
                      width: 20,
                      height: 20,
                    ),
                  )
                ],
              ),
            ),
            ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: myChatArr.length,
                itemBuilder: (context, index) {
                  var uObj = myChatArr[index] as Map? ?? {};
                  return UserChatRow(
                    uObj: uObj,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              ChatConversationView(uObj: uObj),
                        ),
                      );
                    },
                  );
                }),
            const Divider(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
              child: Text(
                "What people are talking about...",
                textAlign: TextAlign.start,
                style: TextStyle(
                  color: TColor.primaryText,
                  fontSize: 19,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            SizedBox(
              height: 180,
              child: ListView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  scrollDirection: Axis.horizontal,
                  itemCount: myGroupArr.length,
                  itemBuilder: (context, index) {
                    var gObj = myGroupArr[index] as Map? ?? {};
                    return GroupCell(
                      gObj: gObj,
                      onPressed: () {},
                    );
                  }),
            ),
            const SizedBox(
              height: 40,
            )
          ],
        ),
      ),
    );
  }
}
