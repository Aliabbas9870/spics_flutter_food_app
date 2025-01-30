import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spice/views/main_screen/welcome_screen/welcome_screen.dart';
import 'package:spice/views/widget/constant.dart';

class LocationSelect extends StatefulWidget {
  const LocationSelect({super.key});

  @override
  State<LocationSelect> createState() => _LocationSelectState();
}

class _LocationSelectState extends State<LocationSelect> {
  // List of locations in Sahiwal
  final List<String> _locations = [
    "Habib Town",
    "Farid Town",
    "Civil Lines",
    "Gulshan-e-Hayat",
    "Jinnah Town",
    "Sahiwal Bypass",
    "Pakpattan Chowk",
    "Gulberg Town",
    "Chak No. 86/6-R",
    "Chak No. 87/6-R",
    "Chak No. 88/6-R",
    "Chak No. 89/6-R",
    "Chak No. 90/6-R",
    "Chak No. 91/6-R",
    "Canal Colony",
    "People’s Colony",
    "Harappa Town",
    "Kameer",
    "Noor Shah",
    "Ghalla Mandi",
    "Liaqat Chowk",
    "Jhall Road",
    "Mall Mandi",
    "Chak No. 108/9-L",
    "Chak No. 109/9-L",
    "Chak No. 110/9-L",
    "Chak No. 111/9-L",
    "Yousafwala",
    "Kot Khadim Ali Shah",
    "Manzoor Colony",
    "Sahiwal City Center",
    "Chak No. 42/GD",
    "Chak No. 43/GD",
    "Chak No. 45/GD",
    "Chak No. 50/GD",
    "College Chowk",
    "Gulshan Noor Colony",
    "Shaheen Chowk",
    "Kacha Pakka Noor Shah Road",
    "Old Harappa"
  ];

  String _selectedLocation = "Habib Town";

  Future<void> _saveUserLocation(String location) async {
    try {
    
        final currentUser = FirebaseAuth.instance.currentUser;

      if (currentUser != null) {
        String userId = currentUser.uid;

      

      await FirebaseFirestore.instance.collection("Users").doc(userId).set(
        {"userLocation": location},
        SetOptions(merge: true),
      );}
      print("Location saved successfully!");
    } catch (e) {
      print("Error saving location: $e");
    }
  }
  



  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: AppColor().bgColor,
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Container(
          width: screenWidth,
          margin: const EdgeInsets.only(top: 20.0),
          height: screenHeight,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 8),
              // Logo
              Center(
                child: Image.asset(
                  "assets/imgs/entrance.png",
                  width: screenWidth * 0.7, // 70%
                  height: screenHeight * 0.4, // 40%
                  fit: BoxFit.contain,
                ),
              ),
              const SizedBox(height: 19.0),
              Center(
                child: Text(
                  "Please select your area",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 18.0),
              Container(
                decoration: BoxDecoration(
                  color: AppColor().secondaryColor,
                  borderRadius: BorderRadius.circular(13),
                  border: Border.all(),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
                child: DropdownButton<String>(
                  dropdownColor: AppColor().secondaryColor,
                  icon: Icon(Icons.arrow_drop_down_sharp, color: AppColor().bgColor),
                  underline: const SizedBox(),
                  borderRadius: BorderRadius.circular(6),
                  value: _selectedLocation,
                  items: _locations
                      .map((location) => DropdownMenuItem<String>(
                            value: location,
                            child: Text(
                              location,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, color: AppColor().bgColor),
                            ),
                          ))
                      .toList(),
                  onChanged: (value) {
                    setState(() {
                      _selectedLocation = value!;
                    });
                  },
                ),
              ),
              const SizedBox(height: 38.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () async {
                      await _saveUserLocation(_selectedLocation);
                      Get.to(WelcomeScreen());
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Material(
                        borderRadius: BorderRadius.circular(8.0),
                        color: AppColor().primaryColor,
                        elevation: 2,
                        child: Container(
                          width: 155.0,
                          height: 45,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.0),
                            color: AppColor().primaryColor,
                          ),
                          child: Center(
                            child: Text(
                              "Confirm",
                              style: TextStyle(
                                fontSize: 19,
                                fontWeight: FontWeight.bold,
                                color: AppColor().secondaryColor,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
