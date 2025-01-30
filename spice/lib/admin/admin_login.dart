import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spice/admin/admin_desboard.dart';
import 'package:spice/views/widget/constant.dart';

class AdminLogin extends StatefulWidget {
  @override
  State<AdminLogin> createState() => _AdminLoginState();
}

class _AdminLoginState extends State<AdminLogin> {
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

    // Check if fields are not empty
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
  // Sign
  UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);

  
  DocumentSnapshot userDoc = await FirebaseFirestore.instance.collection('Users').doc(userCredential.user?.uid).get();

  // Check adm
  bool isAdmin = userDoc['isAdmin'] ?? false;

  if (isAdmin) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      backgroundColor: constant.primaryColor,
      content: const Text(
        "Welcome Admin!",
        style: TextStyle(fontSize: 17, color: Colors.black),
      ),
    ));
    Get.off(AdminDashboard()); // Navigate to Admin
  } else {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      backgroundColor: constant.primaryColor,
      content: const Text(
        "Welcome back!",
        style: TextStyle(fontSize: 17, color: Colors.black),
      ),
    ));
    Get.off(AdminDashboard());
  }
} on FirebaseAuthException catch (e) {
  String errorMessage;
  switch (e.code) {
    case "user-not-found":
      errorMessage = "User Not Found";
      break;
    case "wrong-password":
      errorMessage = "Wrong Password!";
      break;
    case "invalid-email":
      errorMessage = "Invalid Email Format!";
      break;
    default:
    print('Error: $e'); // ab test krna 
      errorMessage = "Error! Please enter a valid email and password!";
  }

  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    backgroundColor: constant.primaryColor,
    content: Text(
      errorMessage,
      style: const TextStyle(fontSize: 16, color: Colors.black),
    ),
  ));
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
                    SizedBox(height: 4.0),
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: TextField(
                        controller: passControl,
                        obscureText: obscurePass,
                        style: TextStyle(color: AppColor().bgColor),
                        decoration: InputDecoration(
                          hintText: "Password",
                          hintStyle: TextStyle(color: AppColor().bgColor),
                          filled: true,
                          fillColor: AppColor().secondaryColor,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          suffixIcon: IconButton(
                            icon: Icon(obscurePass ? Icons.visibility : Icons.visibility_off),
                            onPressed: () {
                              setState(() {
                                obscurePass = !obscurePass;
                              });
                            },
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 18.0),
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
                       
                      ],
                    ),
                    SizedBox(height: 19.0),
                    InkWell(
                      onTap: () {
                        if (emailControl.text != "" && passControl.text != "") {
                          setState(() {
                            email = emailControl.text;
                            password = passControl.text;
                          });
                        }
                        userLogin();
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          width: screenWidth * 0.4, // 40% of the screen width
                          height: screenHeight * 0.1 - 30,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16.0),
                            color: AppColor().primaryColor,
                          ),
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
