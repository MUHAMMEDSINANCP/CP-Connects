import 'package:cp_connects/view/main_tab/main_tab_view.dart';
import 'package:flutter/material.dart';

import '../../common/color_extension.dart';
import '../../common_widget/round_button.dart';

class Step4View extends StatefulWidget {
  const Step4View({super.key});

  @override
  State<Step4View> createState() => _Step4ViewState();
}

class _Step4ViewState extends State<Step4View> {
  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.sizeOf(context);
    return Scaffold(
      backgroundColor: TColor.bg,
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          height: media.height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Turn on notifications",
                style: TextStyle(
                    color: TColor.primaryText,
                    fontSize: 25,
                    fontWeight: FontWeight.w700),
              ),
              const SizedBox(
                height: 25,
              ),
              Text(
                "Get the most out of Company by staying up to date with what's happening.",
                style: TextStyle(color: TColor.primaryText, fontSize: 14),
              ),
              const SizedBox(
                height: 25,
              ),
              RoundButton(
                  title: "Allow Notifications",
                  onPressed: () {
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const MainTabView(),
                      ),
                      (route) => false,
                    );
                  }),
              TextButton(
                  onPressed: () {
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const MainTabView(),
                      ),
                      (route) => false,
                    );
                  },
                  child: Text(
                    "Skip for now",
                    style: TextStyle(
                        color: TColor.primary,
                        fontSize: 14,
                        fontWeight: FontWeight.w700),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
