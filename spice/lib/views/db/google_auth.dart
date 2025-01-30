

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:http/http.dart' as http;
import 'package:spice/views/main_screen/welcome_screen/location_select.dart';

class AuthMethodR {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Register or login a user with Google
  Future<void> registerOrLoginWithGoogle(BuildContext context) async {
    _showLoadingDialog(context);

    try {
      final GoogleSignIn googleSignIn = GoogleSignIn();
      final GoogleSignInAccount? googleUser = await googleSignIn.signIn();

      if (googleUser != null) {
        final GoogleSignInAuthentication googleAuth =
            await googleUser.authentication;

        final AuthCredential credential = GoogleAuthProvider.credential(
          idToken: googleAuth.idToken,
          accessToken: googleAuth.accessToken,
        );

        UserCredential userCredential =
            await _auth.signInWithCredential(credential);
        User? user = userCredential.user;

        if (user != null) {
          DocumentSnapshot userDoc = await FirebaseFirestore.instance
              .collection("Users")
              .doc(user.uid)
              .get();

          if (!userDoc.exists) {
            // New user: Register and upload profile image if available
            String imageUrl = user.photoURL != null
                ? await _uploadUserImage(user.photoURL!)
                : "";

            Map<String, dynamic> userInfo = {
              "email": user.email,
              "name": user.displayName,
              "password": "", 
              "imageUrl": imageUrl,
              "id": user.uid,
              "createdAt": FieldValue.serverTimestamp(),
              "blockUser": false,
               "isAdmin": false,
              "userImage": imageUrl,
              "userLocation": "",
            };

            await DataBaseMethod().addUser(user.uid, userInfo);
          }

          // User is logged in successfully
          _closeLoadingDialog(context);
          Get.snackbar(
            "Success",
            "Welcome to the app!",
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.green,
            colorText: Colors.white,
          );
          Get.off(() => LocationSelect());
        }
      } else {
        _closeLoadingDialog(context);
        Get.snackbar(
          "Error",
          "Google sign-in was canceled.",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
      }
    } catch (e) {
      _closeLoadingDialog(context);
      Get.snackbar(
        "Error",
        "Operation failed. Please try again.",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
      print("Error during Google authentication: $e");
    }
  }

// Helper function to show loading dialog and auto-dismiss after 1 second
void _showLoadingDialog(BuildContext context) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (context) => Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CircularProgressIndicator(),
            SizedBox(height: 20),
            Text(
              "Please wait...",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    ),
  );

  // Automatically close
  Future.delayed(Duration(seconds: 1), () {
    _closeLoadingDialog(context);
  });
}

// Helper function
void _closeLoadingDialog(BuildContext context) {
  if (Navigator.of(context, rootNavigator: true).canPop()) {
    Navigator.of(context, rootNavigator: true).pop();
  }
}



  // Upload user
  Future<String> _uploadUserImage(String photoUrl) async {
    try {
      final response = await http.get(Uri.parse(photoUrl));
      if (response.statusCode == 200) {
        final String fileName =
            "user_images/${DateTime.now().millisecondsSinceEpoch}.jpg";
        final storageRef = FirebaseStorage.instance.ref().child(fileName);
        final uploadTask = await storageRef.putData(response.bodyBytes);
        return await uploadTask.ref.getDownloadURL();
      } else {
        throw Exception("Failed to load image");
      }
    } catch (e) {
      print("Error uploading user image: $e");
      return "";
    }
  }
}

class DataBaseMethod {
  // Method to add user
  Future<void> addUser(String userId, Map<String, dynamic> userInfoMap) {
    return FirebaseFirestore.instance
        .collection("Users")
        .doc(userId)
        .set(userInfoMap);
  }
}