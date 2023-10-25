import 'package:flutter/material.dart';

import '../../common/color_extension.dart';
import '../../common_widget/notification_section_row.dart';
import '../home/details_view.dart';
import '../main_tab/main_tab_view.dart';

class NotificationsView extends StatefulWidget {
  const NotificationsView({super.key});

  @override
  State<NotificationsView> createState() => _NotificationsViewState();
}

class _NotificationsViewState extends State<NotificationsView> {
  List notificationArr = [
    {
      "name": "New",
      "list": [
        {
          "name": "Cathy Lerner",
          "image": "assets/img/u1.png",
          "message": "liked your post",
          "time": "7s ago"
        },
        {
          "name": "Marvin Anderson",
          "image": "assets/img/u2.png",
          "message": "Started following you",
          "time": "30s ago"
        },
        {
          "name": "Timothy Coffey",
          "image": "assets/img/u3.png",
          "message": "Commented: Impressive App design",
          "time": "6m ago"
        }
      ]
    },
    {
      "name": "Today",
      "list": [
        {
          "name": "Jimmy Love",
          "image": "assets/img/u4.png",
          "message": "liked your post",
          "time": "14m ago"
        },
        {
          "name": "Sha Gaines",
          "image": "assets/img/u1.png",
          "message": "Started following you",
          "time": "30m ago"
        },
        {
          "name": "Ronald Shores",
          "image": "assets/img/u2.png",
          "message": "Commented: Impressive App design",
          "time": "1h ago"
        },
        {
          "name": "Eileen Conners",
          "image": "assets/img/u3.png",
          "message": "liked your post",
          "time": "2h ago"
        },
        {
          "name": "Earl Garcia",
          "image": "assets/img/u4.png",
          "message": "Started following you",
          "time": "6h ago"
        }
      ]
    },
    {
      "name": "This Week",
      "list": [
        {
          "name": "Ivey Wilson",
          "image": "assets/img/u1.png",
          "message": "Started following you",
          "time": "2d ago"
        },
        {
          "name": "Bradley Dame",
          "image": "assets/img/u2.png",
          "message": "Started following you",
          "time": "3d ago"
        }
      ]
    },
    {
      "name": "This Month",
      "list": [
        {
          "name": "Tom Joy",
          "image": "assets/img/u3.png",
          "message": "Started following you",
          "time": "2w ago"
        },
        {
          "name": "Francis Fidler",
          "image": "assets/img/u4.png",
          "message": "Started following you",
          "time": "3w ago"
        }
      ]
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        leading: IconButton(
          onPressed: () {
       Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) => const MainTabView()));          },
          icon: Image.asset(
            "assets/img/back.png",
            width: 25,
            height: 25,
          ),
        ),
        centerTitle: false,
        title: Text(
          "Notifications",
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
      body: ListView.builder(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
          itemCount: notificationArr.length,
          itemBuilder: (context, index) {
            var sObj = notificationArr[index] as Map? ?? {};

            return NotificationSectionRow(
              sObj: sObj,
            );
          }),
    );
  }
}
