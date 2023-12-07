import 'package:cp_connects/common_widget/round_button.dart';
import 'package:cp_connects/view/login/step2_view.dart';
import 'package:flutter/material.dart';
import '../../common/color_extension.dart';
import '../../common_widget/round_textfield.dart';

class Step1View extends StatefulWidget {
  const Step1View({super.key});

  @override
  State<Step1View> createState() => _Step1ViewState();
}

class _Step1ViewState extends State<Step1View> {
  TextEditingController txtName = TextEditingController();
  TextEditingController txtLastName = TextEditingController();

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
                "What's your name?",
                style: TextStyle(
                    color: TColor.primaryText,
                    fontSize: 25,
                    fontWeight: FontWeight.w700),
              ),
              const SizedBox(
                height: 25,
              ),
              RoundTextField(
                hintText: "First Name",
                keyboardType: TextInputType.name,
                controller: txtName,
              ),
              const SizedBox(
                height: 15,
              ),
              RoundTextField(
                controller: txtLastName,
                hintText: "Last Name",
                keyboardType: TextInputType.name,
              ),
              const SizedBox(
                height: 25,
              ),
              RoundButton(
                title: "Next",
                onPressed: () {
                  if (txtName.text.isNotEmpty && txtLastName.text.isNotEmpty) {
                    // Both fields have data, navigate to the next screen
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>   Step2View(
                          firstName: txtName.text,
                          lastName: txtLastName.text,
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
                          "Please enter both first name and last name.",
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    );
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
