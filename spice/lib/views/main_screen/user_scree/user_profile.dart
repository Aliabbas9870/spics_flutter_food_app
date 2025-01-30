import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart'; // Added for date formatting
import 'package:spice/views/main_screen/order_detail_screen/order_food.dart';
import 'package:spice/views/main_screen/user_scree/edit_profile.dart';

class UserProfile extends StatefulWidget {
  const UserProfile({super.key});

  @override
  State<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  String userName = "";
  String joinDate = "";
  String location = "";

  @override
  void initState() {
    super.initState();
    fetchUserData();
  }

  Future<void> fetchUserData() async {
    try {
      final currentUser = FirebaseAuth.instance.currentUser;
      if (currentUser == null) {
        Get.snackbar("Error", "No user is currently logged in.", backgroundColor: Colors.red);
        return;
      }

      final userSnapshot = await FirebaseFirestore.instance
          .collection('Users')
          .doc(currentUser.uid)
          .get();

      if (userSnapshot.exists) {
        final data = userSnapshot.data()!;
        setState(() {
          userName = data['name'] ?? "Unknown";
          joinDate = _formatTimestamp(data['createdAt']); // Convert and format Timestamp
          location = data['userLocation'] ?? "Not available";
        });
      }
    } catch (e) {
      print(e);
      Get.snackbar("Error", "Failed to fetch user data: $e", backgroundColor: Colors.red);
    }
  }

  String _formatTimestamp(dynamic timestamp) {
    if (timestamp is Timestamp) {
      DateTime dateTime = timestamp.toDate();
      return DateFormat('yyyy-MM-dd').format(dateTime);
    }
    return "Not available";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                // Background image
                Image.asset(
                  "assets/imgs/bguser.png",
                  width: double.infinity,
                  height: 230,
                  fit: BoxFit.cover,
                ),

                // Back arrow
                Positioned(
                  top: 16,
                  left: 16,
                  child: IconButton(
                    icon: const Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                      size: 28,
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ),

                // Edit profile button
                Positioned(
                  bottom: -30,
                  left: MediaQuery.of(context).size.width / 2 - 40,
                  child: InkWell(
                    onTap: () {
                      Get.to(EditProfile());
                    },
                    child: ClipRRect(
                      child: Image.asset("assets/imgs/editUser.png"),
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 45),

            // User name
            Center(
              child: Text(
                userName,
                style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
            ),

            const SizedBox(height: 16),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Join Date
                  Row(
                    children: [
                      const Icon(Icons.calendar_today, color: Colors.grey),
                      const SizedBox(width: 8),
                      Text(
                        "Joined: $joinDate",
                        style: TextStyle(fontSize: 16, color: Colors.grey[700]),
                      ),
                    ],
                  ),

                  const SizedBox(height: 16),

                  // Location
                  Row(
                    children: [
                      const Icon(Icons.location_on, color: Colors.grey),
                      const SizedBox(width: 8),
                      Text(
                        "Location: $location",
                        style: TextStyle(fontSize: 16, color: Colors.grey[700]),
                      ),
                    ],
                  ),

                  const SizedBox(height: 16),

                  // Order Food
                  Row(
                    children: [
                      const Icon(Icons.fastfood, color: Colors.grey),
                      const SizedBox(width: 8),
                      InkWell(
                        onTap: () {
                          Get.to(OrderFood());
                        },
                        child: Text(
                          "Order Food",
                          style: TextStyle(fontSize: 16, color: Colors.grey[700]),
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
    );
  }
}
