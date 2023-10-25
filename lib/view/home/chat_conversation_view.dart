import 'package:flutter/material.dart';

import '../../common/color_extension.dart';
import '../../common_widget/chat_date_bubbles.dart';
import '../../common_widget/chat_text_bubbles.dart';

class ChatConversationView extends StatefulWidget {
  final Map uObj;
  const ChatConversationView({super.key, required this.uObj});

  @override
  State<ChatConversationView> createState() => _ChatConversationViewState();
}

class _ChatConversationViewState extends State<ChatConversationView> {
  List chatMessageArr = [
    {
      "message": "Hey, nice to meet you Alex",
      "time": "7:50 PM • Seen",
      "is_sender": true,
      "is_text": true,
    },
    {
      "message": "Hey Jenna!! I see were both at Burning Man! huge fans",
      "time": "7:53 PM • Seen",
      "is_sender": false,
      "is_text": true,
    },
    {
      "message": "Mar, 7, 10:17PM",
      "is_text": false,
    },
    {
      "message":
          "OMG me too! Totally wish the City would have more stuff like that",
      "time": "8:00 PM • Seen",
      "is_sender": true,
      "is_text": true,
    },
    {
      "message": "Wanna grab something to eat?",
      "time": "8:02 PM • Seen",
      "is_sender": false,
      "is_text": true,
    },
    {
      "message": "I'm down! That sounds aaamazing!!",
      "time": "8:04 PM • Seen",
      "is_sender": true,
      "is_text": true,
    },
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
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Stack(alignment: Alignment.topRight, children: [
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: Colors.white, width: 2),
                  boxShadow: const [
                    BoxShadow(color: Colors.black12, blurRadius: 2)
                  ],
                ),
                alignment: Alignment.center,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.asset(
                    widget.uObj["image"] is List
                        ? widget.uObj["image"][0]
                        : widget.uObj["image"].toString(),
                    width: 40,
                    height: 40,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Container(
                width: 10,
                height: 10,
                decoration: BoxDecoration(
                    color: TColor.base,
                    border: Border.all(color: Colors.white, width: 2),
                    borderRadius: BorderRadius.circular(5),
                    boxShadow: const [
                      BoxShadow(color: Colors.black12, blurRadius: 2)
                    ]),
              )
            ]),
            const SizedBox(
              width: 8,
            ),
            Text(
              widget.uObj["name"].toString(),
              style: TextStyle(
                color: TColor.primaryText,
                fontSize: 20,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: ClipRRect(
              borderRadius: BorderRadius.circular(17.5),
              child: Image.asset(
                "assets/img/info.png",
                width: 25,
                height: 25,
                fit: BoxFit.cover,
              ),
            ),
          )
        ],
      ),
      body: ListView.builder(
          padding: const EdgeInsets.all(15),
          itemCount: chatMessageArr.length,
          itemBuilder: (context, index) {
            var cObj = chatMessageArr[index] as Map? ?? {};

            if (cObj["is_text"] as bool? ?? false) {
              //Message Row
              return ChatTextBubbles(
                cObj: cObj,
                uObj: (cObj["is_sender"] as bool? ?? false)
                    ? {"image": "assets/img/user_profile.png"}
                    : widget.uObj,
                isLeft: cObj["is_sender"] as bool? ?? false,
                
              );
            } else {
              // Date Row
              return ChatDateBubble(
                date: cObj["message"] as String? ?? "",
              );
            }
          }),
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
              IconButton(
                onPressed: () {},
                icon: Image.asset(
                  "assets/img/image_picker.png",
                  width: 30,
                  height: 30,
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: Image.asset(
                  "assets/img/att.png",
                  width: 25,
                  height: 25,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
