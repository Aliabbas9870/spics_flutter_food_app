import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spice/views/auth/create_account.dart';
import 'package:spice/views/db/google_auth.dart';
import 'package:spice/views/main_screen/terms_policy_screen.dart';
import 'package:spice/views/widget/constant.dart';


class EntranceView extends StatelessWidget {
  final AppColor constant = AppColor();

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
              // Logo
              Center(
                child: Image.asset(
                  "assets/imgs/entrance.png",
                  width: screenWidth * 0.7, // 70% of the screen width
                  height: screenHeight * 0.4, // 40% of the screen height
                  fit: BoxFit.contain,
                ),
              ),
              SizedBox(height: 20),

              // Buttons section
              Container(
                width: screenWidth * 0.9, // 90% of the screen width
                child: Column(
                  children: [
                    // Continue with Google
                    InkWell(
                      onTap: () {
                        // Get.to(HomeScreenStart());

                            AuthMethodR().registerOrLoginWithGoogle(context);
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: constant.secondaryColor,
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        margin: EdgeInsets.symmetric(vertical: 8.0),
                        padding: EdgeInsets.symmetric(
                            horizontal: 16.0, vertical: 12.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                          SizedBox(width: 15.0,),

                            Image.asset(
                              "assets/imgs/g.png",
                              width: 24,
                              height: 24,
                              fit: BoxFit.contain,
                            ),
                            SizedBox(width: 15),
                            Text(
                              "Continue with Google",
                              style: TextStyle(
                                color: constant.bgColor,
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                    // Continue with Facebook
                    InkWell(
                      onTap: (){
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
  backgroundColor: AppColor().primaryColor,
  duration: Duration(seconds: 6),
  content: const Text(
    "Facebook login not enabled right now, please choose another method. It will be available soon.",
    style: TextStyle(
      fontSize: 14,
      color: Colors.black,
    ),
  ),
));

                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: constant.secondaryColor,
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        margin: EdgeInsets.symmetric(vertical: 8.0),
                        padding: EdgeInsets.symmetric(
                            horizontal: 16.0, vertical: 12.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(width: 15.0,),
                            Image.asset(
                              "assets/imgs/facebook.png",
                              width: 24,
                              height: 24,
                              fit: BoxFit.contain,
                            ),
                            SizedBox(width: 15),
                            Text(
                              "Continue with Facebook",
                              style: TextStyle(
                                color: constant.bgColor,
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                    
                    InkWell(
                      onTap: (){
                        Get.to(CreateAccount());
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: constant.secondaryColor,
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        margin: EdgeInsets.symmetric(vertical: 8.0),
                        padding: EdgeInsets.symmetric(
                            horizontal: 16.0, vertical: 12.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(width: 15.0,),
                      
                            Image.asset(
                              "assets/imgs/account.png",
                              width: 24,
                              height: 24,
                              fit: BoxFit.contain,
                            ),
                            SizedBox(width: 15),
                            Text(
                              "Create an account",
                              style: TextStyle(
                                color: constant.bgColor,
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 40),

              // Privacy policy and terms
              Text(
                "By continuing you agree to:",
                style: TextStyle(fontSize: 14, color: Colors.black),
              ),
              SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  InkWell(
                    onTap: () {
                      Get.to(TermsPolicyScreen());
                    },
                    child: Text(
                      "Privacy Policy",
                      style: TextStyle(
                        
                        fontSize: 14,
                        color: AppColor().secondaryColor,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Get.to(TermsPolicyScreen());
                    },
                    child: Text(
                      "Terms & Conditions",
                      style: TextStyle(
                        fontSize: 14,
                        color: AppColor().secondaryColor,
                      
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
