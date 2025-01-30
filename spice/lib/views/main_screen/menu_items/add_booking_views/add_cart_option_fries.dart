import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:spice/views/widget/constant.dart';

class AddCartOptionFries extends StatefulWidget {
  final String imagePath;
  final String title;
  final String description;
  final String price;

  const AddCartOptionFries({
    Key? key,
    required this.imagePath,
    required this.title,
    required this.description,
    required this.price,
  }) : super(key: key);

  @override
  _AddCartOptionFriesState createState() => _AddCartOptionFriesState();
}

class _AddCartOptionFriesState extends State<AddCartOptionFries> {
  int quantity = 1; 
  late int currentPrice;

  @override
  void initState() {
    super.initState();
    currentPrice = int.parse(widget.price); 
  }

  void updatePrice() {
    setState(() {
      currentPrice = int.parse(widget.price) * quantity;
    });
  }

  Future<void> addToCart(BuildContext context) async {
    try {
      User? currentUser = FirebaseAuth.instance.currentUser;
      if (currentUser == null) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              "User not logged in!",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            backgroundColor: Colors.red,
          ),
        );
        return;
      }
    String userId = currentUser.uid;
    String userName = "Unknown User"; // Default name

    // Fetch userName from Firestore
    DocumentSnapshot userDoc = await FirebaseFirestore.instance
        .collection('Users')
        .doc(userId)
        .get();

    if (userDoc.exists && userDoc.data() != null) {
      userName = userDoc['name'] ?? "Unknown User";
    }
      

      await FirebaseFirestore.instance.collection('fries_cart').add({
        'userId': userId,
        'userName': userName,
        'imagePath': widget.imagePath,
        'title': widget.title,
        'description': widget.description,
        'price': currentPrice.toString(),
        'quantity': quantity,
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
          backgroundColor: AppColor().primaryColor,
        ),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            "Failed to add to cart: $e",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.3,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
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
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: CircleAvatar(
                    backgroundColor: Colors.black.withOpacity(0.5),
                    child: Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: AppColor().bgColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(14),
                  topRight: Radius.circular(14),
                ),
              ),
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.title,
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(height: 15),
                      Text(
                        widget.description,
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.black54,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 18),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          IconButton(
                            onPressed: () {
                              if (quantity > 1) {
                                setState(() {
                                  quantity--;
                                  updatePrice();
                                });
                              }
                            },
                            icon: Icon(Icons.remove, color: Colors.red),
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 30, vertical: 8),
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Text(
                              '$quantity',
                              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                          ),
                          IconButton(
                            onPressed: () {
                              setState(() {
                                quantity++;
                                updatePrice();
                              });
                            },
                            icon: Icon(Icons.add, color: Colors.green),
                          ),
                        ],
                      ),
                      SizedBox(height: MediaQuery.sizeOf(context).height * 0.4),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text.rich(
                            TextSpan(
                              children: [
                                TextSpan(
                                  text: "RS. ",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                ),
                                TextSpan(
                                  text: "$currentPrice",
                                  style: TextStyle(
                                    color: AppColor().primaryColor,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 30,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(width: 20),
                          InkWell(
                            onTap: () => addToCart(context),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
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
                                  child: Center(
                                    child: Text(
                                      "Add to Cart",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
