import 'package:cp_connects/view/login/step1_view.dart';
import 'package:cp_connects/view/main_tab/main_tab_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../../common/color_extension.dart';
import '../../common_widget/round_button.dart';
import '../../common_widget/round_textfield.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  TextEditingController txtEmail = TextEditingController();
  TextEditingController txtPassword = TextEditingController();
  String password = "";
  String email = "";
  bool isLoading = false;
  bool isPasswordVisible = false;

  final _formkey = GlobalKey<FormState>();

  Future<void> login() async {
    if (txtEmail.text.isEmpty || txtPassword.text.isEmpty) {
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
            "Please enter both email and password.",
            style: TextStyle(
              fontSize: 15,
              color: Colors.white,
            ),
          ),
        ),
      );
      return; // Stop execution if fields are empty
    }

    try {
      setState(() {
        isLoading = true;
      });

      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: txtEmail.text.trim(),
        password: txtPassword.text.trim(),
      );
      if (mounted) {
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => const MainTabView()));
      }
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar((SnackBar(
            dismissDirection: DismissDirection.up,
            behavior: SnackBarBehavior.floating,
            duration: const Duration(seconds: 2),
            backgroundColor: TColor.primary,
            content: const Text(
              "Logged In Successfully",
              style: TextStyle(
                fontSize: 20,
              ),
            ))));
      }
    } on FirebaseException catch (e) {
      String errorMessage =
          "Invalid Credentials! Check your email & password again.";

      if (e.code == 'user-not-found') {
        errorMessage = "No user found for that email.";
      } else if (e.code == 'wrong-password') {
        errorMessage = "Wrong password provided by the user.";
      }

      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            dismissDirection: DismissDirection.up,
            behavior: SnackBarBehavior.floating,
            duration: const Duration(seconds: 2),
            backgroundColor: Colors.redAccent,
            content: Text(
              errorMessage,
              style: const TextStyle(
                fontSize: 15,
                color: Colors.white,
              ),
            )));
      }
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

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
          child: Form(
            key: _formkey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Spacer(),
                Text(
                  "Login",
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
                  hintText: "Email",
                  keyboardType: TextInputType.emailAddress,
                ),
                const SizedBox(
                  height: 15,
                ),
                RoundTextField(
                  togglePasswordVisibility: () {
                    setState(() {
                      isPasswordVisible = !isPasswordVisible;
                    });
                  },
                  controller: txtPassword,
                  hintText: "Password",
                  keyboardType: TextInputType.name,
                  obscureText: !isPasswordVisible,
                  right: Container(
                    width: 40,
                    alignment: Alignment.center,
                    child: Image.asset(
                      "assets/img/show.png",
                      color: isPasswordVisible ? TColor.primary : Colors.grey,
                      width: 25,
                      height: 25,
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    "Forgot password?",
                    style: TextStyle(
                        color: TColor.primary,
                        fontSize: 14,
                        fontWeight: FontWeight.w500),
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                RoundButton(
                  title: "Login",
                  isLoading: isLoading,
                  onPressed: () async {
                    if (_formkey.currentState!.validate()) {
                      setState(() {
                        email = txtEmail.text.trim();
                        password = txtPassword.text.trim();
                      });
                    }
                    login();
                  },
                ),
                const Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Don't have an account?",
                      style: TextStyle(
                          color: TColor.secondaryText,
                          fontSize: 14,
                          fontWeight: FontWeight.w500),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Step1View()),
                        );
                      },
                      child: Text(
                        "Sign Up",
                        style: TextStyle(
                            color: TColor.primary,
                            fontSize: 14,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
