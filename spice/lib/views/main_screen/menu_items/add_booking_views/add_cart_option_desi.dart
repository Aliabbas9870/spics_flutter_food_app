import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:spice/views/widget/constant.dart';

class AddCartOptionDesi extends StatefulWidget {
  final String imagePath;
  final String title;
  final String description;
  final String price;

  const AddCartOptionDesi({
    Key? key,
    required this.imagePath,
    required this.title,
    required this.description,
    required this.price,
  }) : super(key: key);

  @override
  State<AddCartOptionDesi> createState() => _AddCartOptionDesiState();
}

class _AddCartOptionDesiState extends State<AddCartOptionDesi> {
  int quantity = 1;
  bool _half = false;
  bool _full = false;

  Future<void> addToCart() async {
    try {
      User? currentUser = FirebaseAuth.instance.currentUser;
      if (currentUser == null) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("User not logged in!", style: TextStyle(fontWeight: FontWeight.bold)),
            backgroundColor: Colors.red,
          ),
        );
        return;
      }

      String userId = currentUser.uid;
      String userName = "Unknown User";

      DocumentSnapshot userDoc = await FirebaseFirestore.instance.collection('Users').doc(userId).get();
      if (userDoc.exists) {
        userName = userDoc['name'] ?? "Unknown User";
      }

      await FirebaseFirestore.instance.collection('desifood_cart').add({
        'userId': userId,
        'userName': userName,
        'imagePath': widget.imagePath,
        'quantity': quantity,
        'title': widget.title,
        'description': widget.description,
        'price': widget.price,
        'halfPlate': _half,
        'fullPlate': _full,
        'status': "cart",
        'addedAt': DateTime.now(),
      });

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            "Item added to cart",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: AppColor().secondaryColor,
            ),
          ),
          backgroundColor: Colors.yellow,
        ),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Failed to add to cart: $e", style: const TextStyle(fontWeight: FontWeight.bold)),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.3,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                bottomRight: Radius.circular(10),
                bottomLeft: Radius.circular(10),
              ),
              image: DecorationImage(
                image: AssetImage(widget.imagePath),
                fit: BoxFit.cover,
              ),
            ),
            child: Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: const EdgeInsets.only(top: 40.0, left: 16.0),
                child: GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: CircleAvatar(
                    backgroundColor: Colors.black.withOpacity(0.5),
                    child: const Icon(Icons.arrow_back, color: Colors.white),
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: AppColor().bgColor,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(14),
                  topRight: Radius.circular(14),
                ),
              ),
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.title,
                      style: const TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(height: 15),
                    Text(
                      widget.description,
                      style: const TextStyle(fontSize: 16, color: Colors.black54),
                    ),
                    const SizedBox(height: 22),
                    Column(
                      children: [
                        Row(
                          children: [
                            Checkbox(
                              activeColor: AppColor().secondaryColor,
                              checkColor: AppColor().bgColor,
                              value: _half,
                              onChanged: (value) {
                                setState(() {
                                  _half = value ?? false;
                                });
                              },
                            ),
                            GestureDetector(
                              onTap: () => setState(() => _half = !_half),
                              child: const Text("Half Plate.", style: TextStyle(fontSize: 14)),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Checkbox(
                              activeColor: AppColor().secondaryColor,
                              checkColor: AppColor().bgColor,
                              value: _full,
                              onChanged: (value) {
                                setState(() {
                                  _full = value ?? false;
                                });
                              },
                            ),
                            GestureDetector(
                              onTap: () => setState(() => _full = !_full),
                              child: const Text("Full Plate", style: TextStyle(fontSize: 14)),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        IconButton(
                          onPressed: () {
                            if (quantity > 1) {
                              setState(() => quantity--);
                            }
                          },
                          icon: const Icon(Icons.remove, color: Colors.red),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 8),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Text(
                            '$quantity',
                            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                        ),
                        IconButton(
                          onPressed: () => setState(() => quantity++),
                          icon: const Icon(Icons.add, color: Colors.green),
                        ),
                      ],
                    ),
                    const SizedBox(height: 30),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        RichText(
                          text: TextSpan(
                            children: [
                              const TextSpan(
                                text: "RS. ",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                              TextSpan(
                                // text: widget.price,
                                 text: (double.parse(widget.price) * quantity).toStringAsFixed(2),
                                style: TextStyle(
                                  color: AppColor().primaryColor,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 30,
                                ),
                              ),
                            ],
                          ),
                        ),
                        InkWell(
                          onTap: addToCart,
                          child: Material(
                            color: AppColor().primaryColor,
                            borderRadius: BorderRadius.circular(12),
                            elevation: 2,
                            child: Container(
                              width: 145,
                              height: 43,
                              decoration: BoxDecoration(
                                color: AppColor().primaryColor,
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: const Center(
                                child: Text(
                                  "Add to Cart",
                                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
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
            ),
          ),
        ],
      ),
    );
  }
}