import 'package:cp_connects/view/login/step3_view.dart';
import 'package:flutter/material.dart';

import '../../common/color_extension.dart';
import '../../common_widget/round_button.dart';
import '../../common_widget/round_textfield.dart';

class Step2View extends StatefulWidget {
  final String firstName;
  final String lastName;
  const Step2View({super.key, required this.firstName, required this.lastName});

  @override
  State<Step2View> createState() => _Step2ViewState();
}

class _Step2ViewState extends State<Step2View> {
  TextEditingController txtEmail = TextEditingController();

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
                "What's your email?",
                style: TextStyle(
                    color: TColor.primaryText,
                    fontSize: 25,
                    fontWeight: FontWeight.w700),
              ),
              const SizedBox(
                height: 25,
              ),
              RoundTextField(
                controller: txtEmail,
                hintText: "yourname@company.com",
                keyboardType: TextInputType.emailAddress,
              ),
              const SizedBox(
                height: 25,
              ),
              RoundButton(
                title: "Next",
                onPressed: () {
                  if (txtEmail.text.isNotEmpty) {
                    // Both fields have data, navigate to the next screen
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Step3View(
                          email: txtEmail.text,
                          firstName: widget.firstName,
                          lastName: widget.lastName,
                        ),
                      ),
                    );
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        dismissDirection: DismissDirection.up,
                        behavior: SnackBarBehavior.floating,
                        duration: const Duration(seconds: 2),
                        margin: EdgeInsets.only(
                            bottom: MediaQuery.of(context).size.width * 0.1,
                            left: 26,
                            right: 26),
                        backgroundColor: Colors.redAccent,
                        content: const Text(
                          "Please enter your email address.",
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
