import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spice/views/main_screen/home_screen_start.dart';
import 'package:spice/views/widget/constant.dart';

class ChangePassword extends StatefulWidget {
  @override
  State<ChangePassword> createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  final AppColor constant = AppColor();
  bool _rememberme = false;


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
                child: Text("Create a new password")
              ),
              SizedBox(height: 19.0),
              Text("Please enter your new password to get your account access"),

              // Buttons section
              Container(
                width: screenWidth * 0.9, 
                child: Column(
                  children: [
                 Text("Password"),
                 SizedBox(height: 6,),
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: TextField(
                        style: TextStyle(color: AppColor().bgColor),
                        decoration: InputDecoration(
                          hintText: "Password",
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
                    Text("Confirm password"),
                      SizedBox(height: 6,),
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: TextField(
                        style: TextStyle(color: AppColor().bgColor),
                        decoration: InputDecoration(
                          hintText: "Confirm Password",
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
                      height: 18.0,
                    ),
                             // Checkboxes Section
           

 
SizedBox(height: 19.0,)
,                  
                    InkWell(
                      onTap: (){
                        Get.to(HomeScreenStart());
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          width: screenWidth * 0.4, // 40% of the screen width
                          height: screenHeight * 0.1-30,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16.0),
                            color: AppColor().primaryColor),
                        
                          child: Center(
                            child: Text("Submit",
                                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: AppColor().secondaryColor)),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
           
          
            ],
          ),
        ),
      ),
    );
  }
}
