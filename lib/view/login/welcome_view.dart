import 'package:cp_connects/view/login/login_view.dart';
import 'package:cp_connects/view/login/step1_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../common/color_extension.dart';
import '../../common_widget/round_button.dart';

class WelcomeView extends StatefulWidget {
  const WelcomeView({super.key});

  @override
  State<WelcomeView> createState() => _WelcomeViewState();
}

class _WelcomeViewState extends State<WelcomeView> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.leanBack);
  }

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.sizeOf(context);

    return Scaffold(
        body: Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: TColor.primaryG,
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter)),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    "Have an account already?",
                    style: TextStyle(color: TColor.primaryTextW, fontSize: 14),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const LoginView()),
                      );
                    },
                    child: Text(
                      "Login",
                      style: TextStyle(
                          color: TColor.primaryTextW,
                          fontSize: 14,
                          decoration: TextDecoration.underline),
                    ),
                  )
                ],
              ),
              const Spacer(),
              Image.asset(
                "assets/img/app_logo.png",
                width: 80,
                height: 80,
              ),
              const SizedBox(
                height: 15,
              ),
              Text.rich(
                TextSpan(
                    text: "Welcome to ",
                    style: TextStyle(color: TColor.primaryTextW, fontSize: 25),
                    children: [
                      TextSpan(
                        text: "Company.",
                        style: TextStyle(
                          color: TColor.primaryTextW,
                          fontSize: 25,
                          fontWeight: FontWeight.w700,
                        ),
                      )
                    ]),
              ),
              const SizedBox(
                height: 35,
              ),
              InkWell(
                onTap: () {},
                child: Container(
                  height: 50,
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  decoration: BoxDecoration(
                      color: TColor.bg,
                      borderRadius: BorderRadius.circular(25)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        "assets/img/facebook.png",
                        width: 20,
                        height: 20,
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Text(
                        "Continue with Facebook",
                        style: TextStyle(
                          color: TColor.primary,
                          fontSize: 15,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              RoundButton(
                title: "Create Account",
                type: RoundButtonType.whiteBoard,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Step1View()),
                  );
                },
              ),
              const SizedBox(
                height: 20,
              ),
              Text.rich(
                TextSpan(
                    text:
                        "By tapping Continue, Create account, I agree to Company's",
                    style: TextStyle(color: TColor.primaryTextW, fontSize: 12),
                    children: [
                      TextSpan(
                        text: "Terms of Service,",
                        style: TextStyle(
                          color: TColor.primaryTextW,
                          fontSize: 12,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                      TextSpan(
                        text: "Payments Terms of Service,",
                        style: TextStyle(
                          color: TColor.primaryTextW,
                          fontSize: 12,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                      TextSpan(
                        text: "Privacy Policy, and Non-discrimination Policy.",
                        style: TextStyle(
                          color: TColor.primaryTextW,
                          fontSize: 12,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ]),
              ),
              SizedBox(
                height: media.width * 0.2,
              )
            ],
          ),
        ),
      ),
    ));
  }
}
