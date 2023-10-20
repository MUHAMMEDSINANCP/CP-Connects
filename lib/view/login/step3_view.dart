import 'package:cp_connects/view/login/step4_view.dart';
import 'package:flutter/material.dart';

import '../../common/color_extension.dart';
import '../../common_widget/round_button.dart';
import '../../common_widget/round_textfield.dart';

class Step3View extends StatefulWidget {
  const Step3View({super.key});

  @override
  State<Step3View> createState() => _Step3ViewState();
}

class _Step3ViewState extends State<Step3View> {
  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.sizeOf(context);
    return Scaffold(
      backgroundColor: TColor.bg,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Image.asset(
            "assets/img/back.png",
            width: 20,
            height: 20,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          height: media.height * 0.8,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Create a password",
                style: TextStyle(
                    color: TColor.primaryText,
                    fontSize: 25,
                    fontWeight: FontWeight.w700),
              ),
              const SizedBox(
                height: 25,
              ),
              Text(
                "Your password must include at least one\nsymbol and be 8 or more characters long.",
                style: TextStyle(color: TColor.primaryText, fontSize: 14),
              ),
              const SizedBox(
                height: 25,
              ),
              RoundTextField(
                hintText: "Password",
                keyboardType: TextInputType.name,
                obscureText: true,
                right: Container(
                  width: 40,
                  alignment: Alignment.center,
                  child: Image.asset(
                    "assets/img/show.png",
                    width: 25,
                    height: 25,
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              RoundTextField(
                hintText: "Re-Type Password",
                keyboardType: TextInputType.name,
                obscureText: true,
                right: Container(
                  width: 40,
                  alignment: Alignment.center,
                  child: Image.asset(
                    "assets/img/show.png",
                    width: 25,
                    height: 25,
                  ),
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              RoundButton(
                  title: "Next",
                  onPressed: () {
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const Step4View(),
                        ),
                        (route) => false);
                  })
            ],
          ),
        ),
      ),
    );
  }
}
