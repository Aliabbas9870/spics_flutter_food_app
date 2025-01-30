import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spice/views/widget/constant.dart';

class EditAddress extends StatefulWidget {
  const EditAddress({super.key});

  @override
  State<EditAddress> createState() => _EditAddressState();
}

class _EditAddressState extends State<EditAddress> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Text controllers
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _fetchUserAddress();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _phoneController.dispose();
    _addressController.dispose();
    super.dispose();
  }

  // Fetch user address from Firestore
  Future<void> _fetchUserAddress() async {
    try {
      final user = _auth.currentUser;
      if (user == null) {
        _showMessage("No user is logged in", isError: true);
        return;
      }

      final doc = await _firestore.collection("userdeliveryaddress").doc(user.uid).get();
      if (doc.exists) {
        final data = doc.data();
        _nameController.text = data?['name'] ?? '';
        _phoneController.text = data?['phone'] ?? '';
        _addressController.text = data?['address'] ?? '';
      } else {
        _showMessage("No address found for this user", isError: false);
      }
    } catch (e) {
      _showMessage(e.toString(), isError: true);
    }
  }

  // Update user address in Firestore
  Future<void> _updateAddress() async {
    try {
      final user = _auth.currentUser;
      if (user == null) {
        _showMessage("No user is logged in", isError: true);
        return;
      }

      final Map<String, dynamic> updatedData = {
        "name": _nameController.text.trim(),
        "phone": _phoneController.text.trim(),
        "address": _addressController.text.trim(),
        "timestamp": FieldValue.serverTimestamp(),
      };

      await _firestore.collection("userdeliveryaddress").doc(user.uid).update(updatedData);

               ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            "Address updated successfully!",
            style: TextStyle(fontWeight: FontWeight.bold, color:  AppColor().secondaryColor),
          ),
          backgroundColor: AppColor().primaryColor,
        ),
      );


      Get.snackbar(
        "Success",
        "Address updated successfully!",
        backgroundColor: AppColor().primaryColor,
        colorText: AppColor().secondaryColor,
        snackPosition: SnackPosition.TOP,
      );
      Get.back();
    } catch (e) {
      _showMessage(e.toString(), isError: true);
    }
  }

  // Delete user address from Firestore and clear text fields
  Future<void> _deleteAddress() async {
    try {
      final user = _auth.currentUser;
      if (user == null) {
        _showMessage("No user is logged in", isError: true);
        return;
      }

      await _firestore.collection("userdeliveryaddress").doc(user.uid).delete();

      // Clear text fields
      _nameController.clear();
      _phoneController.clear();
      _addressController.clear();

         ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            "Address deleted successfully!",
            style: TextStyle(fontWeight: FontWeight.bold, color:  AppColor().secondaryColor),
          ),
          backgroundColor: AppColor().primaryColor,
        ),
      );

      // Show success snackbar
      Get.snackbar(
        "Success",
        "Address deleted successfully!",
        backgroundColor: AppColor().primaryColor,
        colorText: AppColor().secondaryColor,
        snackPosition: SnackPosition.TOP,
      );
    } catch (e) {
      _showMessage(e.toString(), isError: true);
    }
  }

  void _showMessage(String message, {required bool isError}) {
    if (Get.isSnackbarOpen) {
      Get.closeCurrentSnackbar();
    }
    Get.snackbar(
      isError ? "Error" : "Success",
      message,
      backgroundColor: isError ? Colors.red : AppColor().primaryColor,
      colorText: Colors.white,
      snackPosition: SnackPosition.TOP,
      margin: const EdgeInsets.all(10),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: InkWell(
                  onTap: () {
                    Get.back();
                  },
                  child: Icon(
                    Icons.arrow_back_rounded,
                    color: AppColor().secondaryColor,
                  ),
                ),
              ),
              const SizedBox(height: 40),
              Center(
                child: Text(
                  "Edit Address",
                  style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 12),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("Name"),
                    TextField(controller: _nameController),
                    const SizedBox(height: 5),
                    const Text("Phone"),
                    TextField(controller: _phoneController),
                    const SizedBox(height: 5),
                    const Text("Address"),
                    TextField(controller: _addressController),
                    const SizedBox(height: 50),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: _deleteAddress,
                          child: Container(
                            width: 130,
                            height: 45,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: Colors.red,
                            ),
                            child: const Center(
                              child: Text(
                                "Delete",
                                style: TextStyle(
                                  fontSize: 22,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 12),
                        InkWell(
                          onTap: _updateAddress,
                          child: Container(
                            width: 130,
                            height: 45,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: AppColor().primaryColor,
                            ),
                            child: Center(
                              child: Text(
                                "Save",
                                style: TextStyle(
                                  fontSize: 22,
                                  color: AppColor().secondaryColor,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
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
