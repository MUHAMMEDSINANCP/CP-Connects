import 'package:flutter/material.dart';

import '../../common/color_extension.dart';
import '../../common_widget/user_row.dart';
import '../../common_widget/user_story_cell.dart';
import '../home/details_view.dart';

class SearchView extends StatefulWidget {
  const SearchView({super.key});

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  TextEditingController txtSearch = TextEditingController();

  List searchArr = [
    {"name": "Emily Lerner", "image": "assets/img/u1.png", "tag": "@loveemily"},
    {
      "name": "Erin Anderson",
      "image": "assets/img/u2.png",
      "tag": "@erin4life"
    },
    {"name": "Ewan Coffey", "image": "assets/img/u3.png", "tag": "@ewancoffey"},
    {
      "name": "Elis Jimmy",
      "image": "assets/img/u4.png",
      "tag": "@its_me_jimmy"
    },
    {"name": "Elisha Gaines", "image": "assets/img/u1.png", "tag": "@elisha22"},
    {
      "name": "Eamon Shores",
      "image": "assets/img/u2.png",
      "tag": "@eamon_shores"
    },
    {"name": "Eileen Conners", "image": "assets/img/u3.png", "tag": "@eileen"},
    {
      "name": "Earl Garcia",
      "image": "assets/img/u4.png",
      "tag": "@earl-design"
    },
    {
      "name": "Elliemay Maio",
      "image": "assets/img/u1.png",
      "tag": "@elliemay_ny"
    },
    {"name": "Eathen Joy", "image": "assets/img/u2.png", "tag": "@eathen_12"},
    {
      "name": "Ebenezer Fidler",
      "image": "assets/img/u3.png",
      "tag": "@ebenezerfidler_"
    }
  ];

  List storiesArr = [
    {
      "name": "Megan Rae",
      "image": "assets/img/s1.png",
      "user_image": "assets/img/u1.png"
    },
    {
      "name": "Charles Dixon",
      "image": "assets/img/s2.png",
      "user_image": "assets/img/u2.png"
    },
    {
      "name": "Rebecca Taylor",
      "image": "assets/img/s3.png",
      "user_image": "assets/img/u3.png"
    },
    {
      "name": "Deanna Walser",
      "image": "assets/img/s4.png",
      "user_image": "assets/img/u4.png"
    },
    {
      "name": "Janice Williams",
      "image": "assets/img/s5.png",
      "user_image": "assets/img/u1.png"
    },
    {
      "name": "Adam Neumann",
      "image": "assets/img/s6.png",
      "user_image": "assets/img/u2.png"
    },
    {
      "name": "Mary Hennen",
      "image": "assets/img/s7.png",
      "user_image": "assets/img/u3.png"
    },
    {
      "name": "Joe Terpstra",
      "image": "assets/img/s8.png",
      "user_image": "assets/img/u4.png"
    },
    {
      "name": "William Yoshioka",
      "image": "assets/img/s9.png",
      "user_image": "assets/img/u1.png"
    },
    {
      "name": "Megan Rae",
      "image": "assets/img/s10.png",
      "user_image": "assets/img/u2.png"
    },
    {
      "name": "Charles Dixon",
      "image": "assets/img/s11.png",
      "user_image": "assets/img/u3.png"
    },
    {
      "name": "Rebecca Taylor",
      "image": "assets/img/s12.png",
      "user_image": "assets/img/u4.png"
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
          onPressed: () {},
          icon: Image.asset(
            "assets/img/back.png",
            width: 25,
            height: 25,
          ),
        ),
        centerTitle: false,
        title: Text(
          "Search",
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
                    controller: txtSearch,
                    onChanged: (newVal) {
                      setState(() {});
                    },
                    decoration: InputDecoration(
                      enabledBorder: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      hintText: "Search by user name or full name",
                      hintStyle: TextStyle(
                        color: TColor.secondaryText,
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const Divider(),
          if (txtSearch.text.isNotEmpty)
            Expanded(
              child: GridView.builder(
                  padding: const EdgeInsets.all(15),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      crossAxisSpacing: 8,
                      mainAxisSpacing: 8,
                      childAspectRatio: 140 / 175),
                  itemCount: storiesArr.length,
                  itemBuilder: (context, index) {
                    var sObj = storiesArr[index] as Map? ?? {};

                    return UserStoryCell(
                      sObj: sObj,
                    );
                  }),
            )
          else
            Expanded(
                child: ListView.builder(
                    padding: const EdgeInsets.symmetric(
                        vertical: 20, horizontal: 15),
                    itemCount: searchArr.length,
                    itemBuilder: (context, index) {
                      var uObj = searchArr[index] as Map? ?? {};
                      return UserRow(
                        uObj: uObj,
                      );
                    })),
          const SizedBox(
            height: 20,
          )
        ],
      ),
    );
  }
}
