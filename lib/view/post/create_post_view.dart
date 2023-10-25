import 'package:flutter/material.dart';

import '../../common/color_extension.dart';
import '../home/details_view.dart';
import '../main_tab/main_tab_view.dart';
import 'post_detail_view.dart';

class CreatePostView extends StatefulWidget {
  const CreatePostView({super.key});

  @override
  State<CreatePostView> createState() => _CreatePostViewState();
}

class _CreatePostViewState extends State<CreatePostView> {
  List imageArr = [
    "assets/img/po_1.png",
    "assets/img/po_2.png",
    "assets/img/po_3.png",
    "assets/img/po_4.png",
    "assets/img/po_5.png"
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
          "Create Post",
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
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              "What's on your mind?",
              style: TextStyle(
                color: TColor.primaryText,
                fontSize: 16,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Image.asset(
                  "assets/img/location.png",
                  width: 10,
                  height: 10,
                ),
                const SizedBox(
                  width: 8,
                ),
                Text(
                  "Toronto, Ontario",
                  style: TextStyle(
                    color: TColor.primaryText,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
          const Spacer(),
          SizedBox(
            height: 100,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                itemCount: imageArr.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const PostDetailView(),
                        ),
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(right: 15),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.asset(
                          imageArr[index] as String? ?? "",
                          width: 80,
                          height: 80,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  );
                }),
          ),
          const SizedBox(
            height: 15,
          ),
        ],
      ),
    );
  }
}
