import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spice/views/widget/constant.dart';

class CustomerSupport extends StatefulWidget {
  const CustomerSupport({super.key});

  @override
  State<CustomerSupport> createState() => _CustomerSupportState();
}

class _CustomerSupportState extends State<CustomerSupport> {
  // TextEditingControllers
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final messageController = TextEditingController();
  final phoneController = TextEditingController();

  // Function to submit data to Firestore
  Future<void> _submitData() async {
    try {
      final uid = FirebaseAuth.instance.currentUser?.uid;
      if (uid == null) {
        Get.snackbar("Error", "User not logged in.");
        return;
      }

      await FirebaseFirestore.instance.collection('customerSupport').add({
        'uid': uid,
        'name': nameController.text.trim(),
        'phone': phoneController.text.trim(),
        'email': emailController.text.trim(),
        'message': messageController.text.trim(),
        'date': DateTime.now(),
      });

      Get.snackbar("Success", "Your query has been submitted successfully.");

      // Clear the fields after submission
      nameController.clear();
      phoneController.clear();
      emailController.clear();
      messageController.clear();
    } catch (e) {
      Get.snackbar("Error", e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor().bgColor,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          margin: EdgeInsets.only(top: 12.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 8),
                IconButton(
                  onPressed: () {
                    Get.back();
                  },
                  icon: Icon(Icons.arrow_back),
                ),
                SizedBox(height: 53),
                Center(child: Image.asset("assets/imgs/question.png")),
                SizedBox(height: 16),
                Center(
                  child: Text(
                    "How can we help you?",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(height: 13),
                Text(
                  "If you need any help please submit the form below and send us your queries.",
                  style: TextStyle(fontSize: 15),
                ),
                SizedBox(height: 18),
                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextField(
                        controller: nameController,
                        decoration: InputDecoration(
                            hintText: "First Name",
                            border: OutlineInputBorder()),
                      ),
                      SizedBox(height: 8.0),
                      TextField(
                        
                        keyboardType: TextInputType.phone,
                        controller: phoneController,
                        decoration: InputDecoration(
                          
                            hintText: "Phone no.",
                            border: OutlineInputBorder()),
                      ),
                      SizedBox(height: 8.0),
                      TextField(
                        keyboardType: TextInputType.emailAddress,
                        controller: emailController,
                        decoration: InputDecoration(
                            hintText: "Email",
                            border: OutlineInputBorder()),
                      ),
                      SizedBox(height: 12.0),
                      Text("I Need help with:"),
                      SizedBox(height: 12),
                      TextField(
                        controller: messageController,
                        minLines: 3,
                        maxLines: 12,
                        decoration: InputDecoration(
                            hintText: "Write your Message here...",
                            border: OutlineInputBorder()),
                      ),
                      SizedBox(height: 24.0),
                      Center(
                        child: GestureDetector(
                          onTap: _submitData,
                          child: Container(
                            width: 90,
                            height: 46,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: AppColor().primaryColor,
                            ),
                            child: Center(
                              child: Text(
                                "Submit",
                                style: TextStyle(
                                    fontSize: 15, fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
