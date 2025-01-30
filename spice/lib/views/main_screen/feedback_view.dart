import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spice/views/widget/constant.dart';

class FeedbackView extends StatefulWidget {
  const FeedbackView({super.key});

  @override
  _FeedbackViewState createState() => _FeedbackViewState();
}

class _FeedbackViewState extends State<FeedbackView> {
  final feedbackController = TextEditingController();

  int _selectedEmojiIndex = -1;

  final List<String> emojis = [
    "🙁", // Sad
    "😐", // Neutral
    "🙂", // Slightly Happy
    "😊", // Happy
    "😍" // Very Happy
  ];

  Future<void> _submitFeedback() async {
    try {
      // Get the current user
      User? user = FirebaseAuth.instance.currentUser;

      if (user == null) {
        Get.snackbar('Error', 'User not logged in');
        return;
      }

      // Validate input
      if (_selectedEmojiIndex == -1 || feedbackController.text.isEmpty) {
        Get.snackbar('Error', 'Please complete all fields before submitting');
        return;
      }

      // Prepare feedback data
      final feedbackData = {
        'uid': user.uid,
        'username': user.displayName ?? 'Anonymous',
        'emoji': emojis[_selectedEmojiIndex],
        'feedback': feedbackController.text.trim(),
        'date': Timestamp.now(),
      };

      // Save to Firestore
      await FirebaseFirestore.instance
          .collection('userfeedback')
          .add(feedbackData);

      // Clear inputs
      feedbackController.clear();
      setState(() {
        _selectedEmojiIndex = -1;
      });

      Get.snackbar('Success', 'Feedback submitted successfully',backgroundColor: AppColor().primaryColor);
    } catch (e) {
      Get.snackbar('Error', 'Failed to submit feedback: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(top: 16),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      InkWell(
                        onTap: () {
                          Get.back();
                        },
                        child: CircleAvatar(
                          backgroundColor: Colors.amber,
                          child: Icon(
                            Icons.arrow_back,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Center(
                        child: Container(
                          height: 132,
                          decoration: BoxDecoration(),
                          child: Image.asset(
                            "assets/imgs/feedbacki.png",
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 32,
                      ),
                      Text(
                        "How is your experience with Spice Safari?",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 18),
                      Text(
                        "We would love to know your experience and suggestions to improve Spice Safari.",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.normal,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 24),

                      // Emoji Feedback Row
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: List.generate(emojis.length, (index) {
                          return GestureDetector(
                            onTap: () {
                              setState(() {
                                _selectedEmojiIndex = index;
                              });
                            },
                            child: Column(
                              children: [
                                Text(
                                  emojis[index],
                                  style: TextStyle(
                                    fontSize: 26,
                                    color: _selectedEmojiIndex == index
                                        ? AppColor().primaryColor
                                        : Colors.grey,
                                  ),
                                ),
                              ],
                            ),
                          );
                        }),
                      ),

                      SizedBox(height: 44),

                      TextField(
                        controller: feedbackController,
                        minLines: 4,
                        maxLines: 12,
                        decoration: InputDecoration(
                          hintText: "Write your experience here...",
                          border: OutlineInputBorder(),
                        ),
                      ),
                      SizedBox(height: 33.0),

                      // Submit Button
                      Center(
                        child: GestureDetector(
                          onTap: _submitFeedback,
                          child: Container(
                            width: 156,
                            height: 59,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              color: AppColor().primaryColor,
                            ),
                            child: Center(
                              child: Text(
                                "Submit",
                                style: TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
