import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spice/views/main_screen/home_screen_start.dart';
import 'package:spice/views/widget/constant.dart';

class TermsPolicyScreen extends StatefulWidget {
  @override
  _TermsPolicyScreenState createState() => _TermsPolicyScreenState();
}

class _TermsPolicyScreenState extends State<TermsPolicyScreen> {
  bool _acceptTerms = false;
  bool _acceptPrivacy = false;

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Text(
                    "Privacy Policy and\nTerms & Conditions",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(height: 16),

                // Description Section
                Container(
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "For us, privacy is very important. This privacy statement describes the sorts of personal data that we receive, gather, and use to manage your account. "
                          "We guarantee that the information you give to us will be treated securely according to our privacy policy. By logging into our app, you agree to the following terms and conditions stated below:",
                          style: TextStyle(fontSize: 14, height: 1.5),
                        ),
                        SizedBox(height: 8),
                        Text(
                          "1. Acceptance of Terms: Clearly state that by using our food app or services, users agree to be bound by these terms and conditions.",
                          style: TextStyle(fontSize: 14, height: 1.5),
                        ),
                        SizedBox(height: 8),
                        Text(
                          "2. Ordering and Delivery Process: Minimum order amount is already described. The order is delivered to the customer within the estimated delivery times, but certain conditions (e.g., weather conditions) may affect delivery.",
                          style: TextStyle(fontSize: 14, height: 1.5),
                        ),
                        SizedBox(height: 8),
                        Text(
                          "3. User Responsibilities: Outline what users are and are not allowed to do while using your website or service.",
                          style: TextStyle(fontSize: 14, height: 1.5),
                        ),
                        SizedBox(height: 8),
                        Text(
                          "4. Payment Terms: Order accepted payment methods include credit card, debit card, or cash on delivery. Delivery charges apply as described.",
                          style: TextStyle(fontSize: 14, height: 1.5),
                        ),
                        SizedBox(height: 8),
                        Text(
                          "5. Cancellation and Refund Policy: Users can cancel their order before staff order confirmation. Cash refund policy is implemented before staff order confirmation, otherwise not.",
                          style: TextStyle(fontSize: 14, height: 1.5),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 16),

                // Checkbox Section
                Column(
                  children: [
                    Row(
                      children: [
                        Checkbox(
                          activeColor: AppColor().secondaryColor,
                          checkColor: AppColor().bgColor,
                          value: _acceptTerms,
                          onChanged: (value) {
                            setState(() {
                              _acceptTerms = value ?? false;
                            });
                          },
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              _acceptTerms = !_acceptTerms;
                            });
                          },
                          child: Text(
                            "I accept the terms of use.",
                            style: TextStyle(fontSize: 14),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Checkbox(
                          activeColor: AppColor().secondaryColor,
                          checkColor: AppColor().bgColor,
                          value: _acceptPrivacy,
                          onChanged: (value) {
                            setState(() {
                              _acceptPrivacy = value ?? false;
                            });
                          },
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              _acceptPrivacy = !_acceptPrivacy;
                            });
                          },
                          child: Text(
                            "I accept the privacy policy.",
                            style: TextStyle(fontSize: 14),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              
              
              
                SizedBox(height: 16),

                // Buttons Section
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        
                        padding: EdgeInsets.symmetric(
                          horizontal: screenWidth * 0.1,
                          vertical: 12,
                        ),
                      ),
                      onPressed: () {
                        // Handle cancel action
                      },
                      child: Text(
                        "Cancel",
                        style: TextStyle(color: AppColor().secondaryColor,  fontSize: 17,
                          fontWeight: FontWeight.bold,),
                      ),
                    ),

   ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColor().primaryColor,
                        
                        padding: EdgeInsets.symmetric(

                          horizontal: screenWidth * 0.1,
                          vertical: 12,
                        ),
                      ),
                      onPressed: () {
                      Get.to(HomeScreenStart());
                      Get.snackbar(
                        duration: Duration(seconds: 4),
                        
                        backgroundColor: AppColor().primaryColor,
                        "Success", "terms and condition submit successfully");
                      },
                      child: Text(
                        "Accept",
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                          color: AppColor().secondaryColor),
                      ),
                    ),


                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
