import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spice/views/auth/forget_password.dart';
import 'package:spice/views/main_screen/home_screen_start.dart';
import 'package:spice/views/widget/constant.dart';


class LoginAccount extends StatefulWidget {
  @override
  State<LoginAccount> createState() => _LoginAccountState();
}

class _LoginAccountState extends State<LoginAccount> {
  final AppColor constant = AppColor();
  bool _rememberme = false;
 
   var emailControl = TextEditingController();
  var passControl = TextEditingController();
  String email = '', password = '';




userLogin() async {
  setState(() {
    email = emailControl.text;
    password = passControl.text;
  });

  // Check 
  if (email.isEmpty || password.isEmpty) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      backgroundColor: constant.primaryColor,
      content: const Text(
        "Please enter the email and password!",
        style: TextStyle(
          fontSize: 18,
        ),
      ),
    ));
    return;
  }

  try {
    // Check 
    var userDoc = await FirebaseFirestore.instance.collection('Users').doc(email).get();

    if (userDoc.exists && userDoc.data()?['blockUser'] == true) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        backgroundColor: constant.primaryColor,
        content: const Text(
          "Your account is blocked. Please contact our support team!",
          style: TextStyle(
            fontSize: 16,
            color: Colors.black,
          ),
        ),
      ));
      return; 
    }

    await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        backgroundColor: constant.primaryColor,
        content: const Text(
          "Welcome back!",
          style: TextStyle(
            fontSize: 17,
            color: Colors.black,
          ),
        )));
    Get.off(HomeScreenStart());

  } on FirebaseAuthException catch (e) {
    if (e.code == "user-not-found") {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          backgroundColor: constant.primaryColor,
          content: const Text(
            "User Not Found",
            style: TextStyle(
              fontSize: 16,
              color: Colors.black,
            ),
          )));
    } else if (e.code == "wrong-password") {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          backgroundColor: constant.primaryColor,
          content: const Text(
            "Wrong Password!",
            style: TextStyle(
              fontSize: 16,
              color: Colors.black,
            ),
          )));
    } else if (e.code == "invalid-email") {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          backgroundColor: constant.primaryColor,
          content: const Text(
            "Invalid Email Format!",
            style: TextStyle(
              fontSize: 16,
              color: Colors.black,
            ),
          )));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          backgroundColor: constant.primaryColor,
          content: const Text(
            "Wrong! Please enter the valid email and password!",
            style: TextStyle(
              fontSize: 16,
              color: Colors.black,
            ),
          )));
    }
  }
}
  bool obscurePass = true;

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
                  height: screenHeight * 0.4, // 30% of the screen height
                  fit: BoxFit.contain,
                ),
              ),
              SizedBox(height: 19.0),

              
              Container(
                width: screenWidth * 0.9, // 90% of the screen width
                child: Column(
                  children: [
                 
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: TextField(
                        controller: emailControl,
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
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: TextField(
                        controller: passControl,
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
                      height: 18.0,
                    ),
                             // Checkboxes Section
           

      Column(
                  children: [
                    Row(
                      children: [
                        Checkbox(
                             activeColor: AppColor().secondaryColor, 
                          checkColor: AppColor().bgColor,
                          value: _rememberme,
                          onChanged: (value) {
                            setState(() {
                              _rememberme = value ?? false;
                            });
                          },
                        ),
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                _rememberme = !_rememberme;
                              });
                            },
                            child: Text(
                              "Remember me.",
                              style: TextStyle(fontSize: 14),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(children: [
                        Icon(Icons.lock,color: AppColor().secondaryColor,),SizedBox(width: 13.0,),
                        InkWell(
                          onTap: (){
                            Get.to(ForgetPassword());
                          },
                          child: Text("Forget password?",style: TextStyle(color: AppColor().secondaryColor,fontSize: 15),))
                      ],),
                    )
                 
                  ],
                ),

SizedBox(height: 19.0,)
,                  
                    InkWell(
                      onTap: (){


                           if (emailControl.text != "" && passControl.text != "") {
                          setState(() {
                            email = emailControl.text;
                            password = passControl.text;
                          });
                        }
                        userLogin();
                        // Get.to(HomeScreenStart());
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
                            child: Text("Login",
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
