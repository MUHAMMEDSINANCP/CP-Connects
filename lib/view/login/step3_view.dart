import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cp_connects/view/login/step4_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../../common/color_extension.dart';
import '../../common_widget/round_button.dart';
import '../../common_widget/round_textfield.dart';

class Step3View extends StatefulWidget {
  final String email;
  final String firstName;
  final String lastName;
  const Step3View({
    Key? key,
    required this.email,
    required this.firstName,
    required this.lastName,
  }) : super(key: key);

  @override
  State<Step3View> createState() => _Step3ViewState();
}

class _Step3ViewState extends State<Step3View> {
  String name = "";
  String lastName = "";
  String email = "";

  String password = "";
  String confirmPassword = "";
  bool isLoading = false;

  TextEditingController txtPassword = TextEditingController();
  TextEditingController txtConfirmPassword = TextEditingController();
  final GlobalKey<FormState> _formkeysignup = GlobalKey<FormState>();

  Future<void> registerUser() async {
    String name = widget.firstName;
    String lastName = widget.lastName;
    String email = widget.email;
    try {
      setState(() {
        isLoading = true;
      });
      if (txtPassword.text != txtConfirmPassword.text) {
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
              "Passwords does not match.",
              style: TextStyle(
                fontSize: 15,
                color: Colors.white,
              ),
            ),
          ),
        );
        return;
      }

      if (txtPassword.text.isEmpty && txtConfirmPassword.text.isEmpty) {
        showSnackBar(context, "Please enter a password.");
      }

      UserCredential userCredential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: widget.email,
        password: txtPassword.text.trim(),
      );
      // Save user details including name to Firebase or your database
      await FirebaseFirestore.instance
          .collection('users')
          .doc(userCredential.user!.uid)
          .set({
        'name': name,
        'last_name': lastName,
        'email': email,

        // Add other user details if needed
      });

      if (mounted) {
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => const Step4View()));
      }
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar((SnackBar(
            dismissDirection: DismissDirection.up,
            behavior: SnackBarBehavior.floating,
            duration: const Duration(seconds: 2),
            backgroundColor: TColor.primary,
            content: const Text(
              "Registered Successfully",
              style: TextStyle(
                fontSize: 20,
              ),
            ))));
      }
    } on FirebaseException catch (e) {
      switch (e.code) {
        case 'weak-password':
          if (context.mounted) {
            showSnackBar(context, "Password provided is too weak");
          }
          break;
        case 'email-already-in-use':
          if (context.mounted) {
            showSnackBar(context, "Account already exists!");
          }
          break;
        case 'invalid-email':
          if (context.mounted) {
            showSnackBar(context, " email address is not valid.");
          }
          break;
        case 'operation-not-allowed':
          if (context.mounted) {
            showSnackBar(context,
                "Enable email/password accounts in the Firebase Console, under the Auth tab.");
          }

        default:
          break;
      }
    } finally {
      if (mounted) {
        setState(() {
          isLoading = false;
        });
      }
    }
  }

  bool isPasswordVisible1 = true;
  bool isPasswordVisible2 = true;

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
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
            key: _formkeysignup,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Create a password",
                  style: TextStyle(
                    color: TColor.primaryText,
                    fontSize: 25,
                    fontWeight: FontWeight.w700,
                  ),
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
                  controller: txtPassword,
                  hintText: "Password",
                  keyboardType: TextInputType.name,
                  obscureText: isPasswordVisible1,
                  right: GestureDetector(
                    onTap: () {
                      setState(() {
                        isPasswordVisible1 = !isPasswordVisible1;
                      });
                    },
                    child: Icon(
                        isPasswordVisible1
                            ? Icons.visibility_off
                            : Icons.visibility,
                        color:
                            isPasswordVisible1 ? Colors.black : TColor.primary
                        // Change to the appropriate color
                        ),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                RoundTextField(
                  controller: txtConfirmPassword,
                  hintText: "Re-Type Password",
                  keyboardType: TextInputType.name,
                  obscureText: isPasswordVisible2,
                  right: GestureDetector(
                    onTap: () {
                      setState(() {
                        isPasswordVisible2 = !isPasswordVisible2;
                      });
                    },
                    child: Icon(
                        isPasswordVisible2
                            ? Icons.visibility_off
                            : Icons.visibility,
                        color:
                            isPasswordVisible2 ? Colors.black : TColor.primary
                        // Change to the appropriate color
                        ),
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                RoundButton(
                  isLoading: isLoading,
                  title: "Sign Up",
                  onPressed: () async {
                    if (_formkeysignup.currentState!.validate()) {
                      setState(() {
                        password = txtPassword.text.trim();
                        confirmPassword = txtConfirmPassword.text.trim();
                      });
                    }
                    registerUser();
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

void showSnackBar(BuildContext context, String message) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      dismissDirection: DismissDirection.up,
      behavior: SnackBarBehavior.floating,
      // margin: EdgeInsets.only(
      //     bottom: MediaQuery.of(context).size.width * 1.91,
      //     left: 20,
      //     right: 20),
      duration: const Duration(seconds: 1),
      backgroundColor: Colors.redAccent,
      content: Text(
        message,
        style: const TextStyle(
          fontSize: 18,
        ),
      ),
    ),
  );
}
