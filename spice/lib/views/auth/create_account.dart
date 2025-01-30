import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spice/views/auth/Login_Account.dart';
import 'package:spice/views/main_screen/welcome_screen/location_select.dart';
import 'package:spice/views/widget/constant.dart';

class CreateAccount extends StatefulWidget {
  @override
  State<CreateAccount> createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {
  final AppColor constant = AppColor();

    // TextEditingControllers
  final nameC = TextEditingController();
  final emailC = TextEditingController();
  final passwordC = TextEditingController();
  final phoneC = TextEditingController();

  String nameV = '', emailV = '', phoneV = '', passwordV = '';

  register() async {
    if (nameV != "" && phoneV != "" && emailV != "" && passwordV != "") {
     

if (phoneV.length < 9 || phoneV.length > 14) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      backgroundColor: constant.primaryColor,
      content: const Text(
        "Invalid phone number format!",
        style: TextStyle(
          fontSize: 18,
        ),
      ),
    ),
  );
  return;
}

      
     if (!emailV.contains('@') || !emailV.contains('.') || emailV.length < 5) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      backgroundColor: constant.primaryColor,
      content: const Text(
        "Invalid email format!",
        style: TextStyle(
          fontSize: 18,
        ),
      ),
    ),
  );
  return;
}


      // Validate password strength
      if (passwordV.length < 6) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            backgroundColor: constant.primaryColor,
            content: const Text(
              "Password should be at least 6 characters long!",
              style: TextStyle(
                fontSize: 18,
              ),
            )));
        return;
      }

      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return const Center(child: CircularProgressIndicator());
        },
      );

      try {
        UserCredential userCredential = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(email: emailV, password: passwordV);
        // Add user data to Firestore
        await FirebaseFirestore.instance
            .collection('Users')
            .doc(userCredential.user!.uid)
            .set({
          'name': nameV,
          'email': emailV,
          'phone': phoneV,
          'password': passwordV,
          'uid': userCredential.user!.uid,
          'createdAt': FieldValue.serverTimestamp(),
          'blockUser': false, 
           "isAdmin": false,
          'userImage': userCredential.user?.photoURL ??
              "",
          'userLocation': "",
        });

        Navigator.of(context).pop(); 
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            backgroundColor: constant.primaryColor,
            content: const Text(
              "Register Successfully!",
              style: TextStyle(fontSize: 18),
            )));
        // Get.to(const BottomBarStart());
         Get.off(LocationSelect());
         Get.to(LocationSelect());
      } on FirebaseAuthException catch (e) {
        Navigator.of(context).pop();
        if (e.code == "weak-password") {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              backgroundColor: constant.primaryColor,
              content: const Text(
                "Password is weak!",
                style: TextStyle(
                  fontSize: 18,
                ),
              )));
        } else if (e.code == "email-already-in-use") {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              backgroundColor: constant.primaryColor,
              content: const Text(
                "Account Already Exist!",
                style: TextStyle(
                  fontSize: 18,
                ),
              )));
        }
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          backgroundColor: constant.primaryColor,
          content: const Text(
            "Please fill in all fields!",
            style: TextStyle(
              fontSize: 18,
            ),
          )));
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
              // Logo
              Center(
                child: Image.asset(
                  "assets/imgs/entrance.png",
                  width: screenWidth * 0.7, // 70% of the screen width
                  height: screenHeight * 0.3, // 30% of the screen height
                  fit: BoxFit.contain,
                ),
              ),
              SizedBox(height: 19.0),

              // Buttons section
              Container(
                width: screenWidth * 0.9, // 90% of the screen width
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: TextField(
                        controller:nameC,
                        style: TextStyle(color: AppColor().bgColor),
                        decoration: InputDecoration(
                          hintText: "Name",
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
                        controller:emailC, 
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
                        controller:passwordC, obscureText: true,

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
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: TextField(
                        controller:phoneC,
                      keyboardType: TextInputType.phone,
                        style: TextStyle(color: AppColor().bgColor),
                        decoration: InputDecoration(
                          hintText: "Phone",
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
                    InkWell(
                      onTap: (){
                           if (nameC.text != "" &&
                            phoneC.text != "" &&
                            emailC.text != "" &&
                            passwordC.text != "") {
                          setState(() {
                            nameV = nameC.text;
                            emailV = emailC.text;
                            phoneV = phoneC.text;
                            passwordV = passwordC.text;
                          });
                        }
                        register();
                       
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
                            child: Text("Signup",
                                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: AppColor().secondaryColor)),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(height: 20),

              // Privacy policy and terms
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Already have an account?",
                    style: TextStyle(
                        fontSize: 14, color: AppColor().secondaryColor),
                  ),
                  InkWell(
                    onTap: () {
                      Get.to(LoginAccount());
                    },
                    child: Text(
                      "Login",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: AppColor().primaryColor),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
