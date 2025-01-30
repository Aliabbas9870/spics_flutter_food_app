import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:spice/views/widget/constant.dart';

class ForgetPassword extends StatefulWidget {
  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  final AppColor constant = AppColor();
  var emailController = TextEditingController();

  String email = "";
  final formKey = GlobalKey<FormState>();

  resetPassword() async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        backgroundColor: constant.primaryColor,
        content: const Text(
          "Password reset email sent!",
          style: TextStyle(
            fontSize: 18,
          ),
        ),
      ));
    } on FirebaseException catch (e) {
      if (e.code == 'user-not-found') {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: constant.primaryColor,
            content: const Text(
              "User not found for that email",
              style: TextStyle(
                fontSize: 18,
              ),
            ),
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: constant.bgColor,
      body: SingleChildScrollView(
        child: Container(
          width: screenWidth,
          height: screenHeight,
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 62,),
              // Logo
              Center(child: Text("Reset Password", style: TextStyle(
          fontSize: 38,
        ),)),
              SizedBox(height: 39.0),
              Text("Please enter your email Address", style: TextStyle(
          fontSize: 18,
        ),),

              // Buttons section
              Form(
                key:formKey ,
                child: Container(
                  width: screenWidth * 0.9,
                  child: Column(
                    children: [
                      Text("Email"),
                      SizedBox(
                        height: 6,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: TextField(
                          controller: emailController,
                          keyboardType: TextInputType.emailAddress,
                          style: TextStyle(color: AppColor().bgColor),
                          decoration: InputDecoration(
                            hintText: "Email",
                            hintStyle: TextStyle(color: AppColor().bgColor),
                            filled: true,
                            fillColor: AppColor().secondaryColor,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 4.0,
                      ),
                      // Checkboxes Section
                
                      SizedBox(
                        height: 19.0,
                      ),
                      InkWell(
                        onTap: () {

                          if(formKey.currentState!.validate()){
                            setState((){
                                 email=emailController.text;
                            });
                            resetPassword();
                          }
                          // Get.to(HomeScreenStart());
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            width: screenWidth * 0.4, // 40% of the screen width
                            height: screenHeight * 0.1 - 30,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16.0),
                                color: AppColor().primaryColor),
                
                            child: Center(
                              child: Text("Send Email",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                      color: AppColor().secondaryColor)),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
