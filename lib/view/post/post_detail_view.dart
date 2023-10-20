import 'package:avatar_stack/avatar_stack.dart';
import 'package:avatar_stack/positions.dart';
import 'package:cp_connects/view/post/comment_view.dart';
import 'package:flutter/material.dart';

import '../../common/color_extension.dart';
import '../../common_widget/comment_row.dart';

class PostDetailView extends StatefulWidget {
  const PostDetailView({super.key});

  @override
  State<PostDetailView> createState() => _PostDetailViewState();
}

class _PostDetailViewState extends State<PostDetailView> {
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
    var media = MediaQuery.sizeOf(context);

    final settings = RestrictedPositions(
      maxCoverage: 0.3,
      minCoverage: 0.1,
      align: StackAlign.left,
      infoIndent: 4,
    );

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.5,
        leading: IconButton(
          onPressed: () {},
          icon: Image.asset(
            "assets/img/back.png",
            width: 25,
            height: 25,
          ),
        ),
        centerTitle: false,
        title: Text(
          "Post",
          style: TextStyle(
            color: TColor.primaryText,
            fontSize: 26,
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
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            Image.asset(
              "assets/img/post_detail.png",
              width: media.width,
              fit: BoxFit.fitWidth,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: media.width * 0.9,
                ),
                Container(
                  margin: const EdgeInsets.only(top: 20),
                  width: media.width,
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(50),
                          topRight: Radius.circular(50)),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black54,
                            blurRadius: 10,
                            offset: Offset(0, -15))
                      ]),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            IconButton(
                              onPressed: () {},
                              icon: Image.asset(
                                "assets/img/fav.png",
                                width: 25,
                                height: 25,
                              ),
                            ),
                            IconButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const CommentView(),
                                  ),
                                );
                              },
                              icon: Image.asset(
                                "assets/img/chat.png",
                                width: 25,
                                height: 25,
                              ),
                            ),
                            IconButton(
                              onPressed: () {},
                              icon: Image.asset(
                                "assets/img/more.png",
                                width: 20,
                                height: 20,
                              ),
                            ),
                          ],
                        ),
                        Container(
                          height: 50,
                          alignment: Alignment.center,
                          child: Row(
                            children: [
                              SizedBox(
                                width: 80,
                                height: 50,
                                child: WidgetStack(
                                  positions: settings,
                                  stackedWidgets: [
                                    "assets/img/u1.png",
                                    "assets/img/u2.png"
                                  ]
                                      .map((img) => Container(
                                            width: 45,
                                            height: 45,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(25),
                                                border: Border.all(
                                                    color: Colors.white,
                                                    width: 2),
                                                color: Colors.white,
                                                boxShadow: const [
                                                  BoxShadow(
                                                    color: Colors.black12,
                                                    blurRadius: 2,
                                                  )
                                                ]),
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(25),
                                              child: Image.asset(
                                                img ?? "",
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
                                      "Liked by",
                                      textAlign: TextAlign.left,
                                      maxLines: 1,
                                      style: TextStyle(
                                        color: TColor.secondaryText,
                                        fontSize: 13,
                                      ),
                                    ),
                                    Text(
                                      "Earl Garcia, Nancy Maio",
                                      textAlign: TextAlign.left,
                                      maxLines: 1,
                                      style: TextStyle(
                                        color: TColor.primaryText,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        const Divider(),
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
                        ListView.builder(
                            padding: EdgeInsets.zero,
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: commentArr.length,
                            itemBuilder: (context, index) {
                              var cObj = commentArr[index] as Map? ?? {};
                              return CommentRow(
                                cObj: cObj,
                              );
                            }),
                        const SizedBox(
                          height: 50,
                        ),
                      ],
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
