import 'package:cp_connects/view/home/chat_view.dart';
import 'package:cp_connects/view/home/details_view.dart';
import 'package:flutter/material.dart';

import '../../common/color_extension.dart';
import '../../common_widget/home_row.dart';
import '../../common_widget/recommend_cell.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  List recommendationsArr = [
    {"name": "James McL..", "image": "assets/img/r1.png"},
    {"name": "Bessie Sima...", "image": "assets/img/r2.png"},
    {"name": "Jeffery Hall", "image": "assets/img/r3.png"},
    {"name": "Judy Adler", "image": "assets/img/r4.png"}
  ];
  List allArr = [
    {
      "name": "Georgia Bates",
      "image": "assets/img/u1.png",
      "status": "Toronto, Ontario",
      "is_online": false,
      "time": "30s ago",
      "images": ["assets/img/p1.png", "assets/img/p2.png", "assets/img/p3.png"]
    },
    {
      "name": "Johny Vino",
      "image": "assets/img/u2.png",
      "status": "Mississauga, Ontario",
      "time": "5mins ago",
      "is_online": false,
      "images": ["assets/img/p4.png", "assets/img/p5.png", "assets/img/p6.png"]
    },
    {
      "name": "Scott Horsfall",
      "image": "assets/img/u3.png",
      "status": "Markham, Ontario",
      "time": "10mins ago",
      "is_online": true,
      "images": ["assets/img/p7.png", "assets/img/p8.png", "assets/img/p9.png"]
    },
    {
      "name": "Meagan Ryan",
      "image": "assets/img/u4.png",
      "status": "Oakvill Ontario",
      "time": "2days ago",
      "is_online": false,
      "images": [
        "assets/img/p10.png",
        "assets/img/p11.png",
        "assets/img/p12.png"
      ]
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
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const ChatView(),
              ),
            );
          },
          icon: Image.asset(
            "assets/img/chat.png",
            width: 35,
            height: 35,
          ),
        ),
        centerTitle: true,
        title: Text(
          "Logo",
          style: TextStyle(
            color: TColor.primaryText,
            fontSize: 26,
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
          children: [
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
                      "Recommendations",
                      style: TextStyle(
                        color: TColor.primaryText,
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 120,
                    child: ListView.builder(
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        scrollDirection: Axis.horizontal,
                        itemCount: recommendationsArr.length,
                        itemBuilder: (context, index) {
                          var rObj = recommendationsArr[index] as Map? ?? {};
                          return RecommendCell(
                            rObj: rObj,
                            onPressed: () {},
                          );
                        }),
                  )
                ],
              ),
            ),
            ListView.builder(
                padding: const EdgeInsets.symmetric(vertical: 15),
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: allArr.length,
                itemBuilder: (context, index) {
                  var uObj = allArr[index] as Map? ?? {};
                  return HomeRow(
                    uObj: uObj,
                    onPressed: () {},
                  );
                })
          ],
        ),
      ),
    );
  }
}
