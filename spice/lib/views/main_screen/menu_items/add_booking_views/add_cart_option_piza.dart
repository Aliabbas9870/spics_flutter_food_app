import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:spice/views/widget/constant.dart';

class AddCartOptionPiza extends StatefulWidget {
  final String imagePath;
  final String title;
  final String description;
  final String price;

  const AddCartOptionPiza({
    Key? key,
    required this.imagePath,
    required this.title,
    required this.description,
    required this.price,
  }) : super(key: key);

  @override
  State<AddCartOptionPiza> createState() => _AddCartOptionPizaState();
}

class _AddCartOptionPizaState extends State<AddCartOptionPiza> {
  int quantity = 1;
  late int currentPrice;
  bool _small = false;
  bool _medium = false;
  bool _larg = false;

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

  void addToCart() async {
    try {
      final currentUser = FirebaseAuth.instance.currentUser;
      if (currentUser == null) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: Colors.red,
            content: Text(
              "You need to log in to add items to the cart.",
              style: TextStyle(color: Colors.white),
            ),
          ),
        );
        return;
      }

      String selectedSize = '';
      if (_small) selectedSize = 'Small';
      if (_medium) selectedSize = 'Medium';
      if (_larg) selectedSize = 'Large';

      if (selectedSize.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: Colors.red,
            content: Text(
              "Please select a size before adding to the cart.",
              style: TextStyle(color: Colors.white),
            ),
          ),
        );
        return;
      }

      String userId = currentUser.uid;
      String userName = "Unknown User";

      DocumentSnapshot userDoc = await FirebaseFirestore.instance
          .collection('Users')
          .doc(userId)
          .get();

      if (userDoc.exists && userDoc.data() != null) {
        userName = userDoc['name'] ?? "Unknown User";
      }

      await FirebaseFirestore.instance.collection('pizza_cart').add({
        'userId': userId,
        'title': widget.title,
        'description': widget.description,
        'price': currentPrice,
        'userName': userName,
        'quantity': quantity,
        'size': selectedSize,
        'imagePath': widget.imagePath,
        "status": "cart",
        'timestamp': FieldValue.serverTimestamp(),
      });

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.yellow,
          content: Text(
            "Item added to cart successfully.",
            style: TextStyle(color: Colors.black),
          ),
        ),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.red,
          content: Text(
            "Failed to add item to cart: $e",
            style: TextStyle(color: Colors.white),
          ),
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
                  bottomLeft: Radius.circular(10)),
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
                      SizedBox(height: 15),
                      Text(
                        widget.description,
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.black54,
                        ),
                      ),
                      SizedBox(height: 33),
                      Column(
                        children: [
                          Row(
                            children: [
                              Checkbox(
                                value: _small,
                                onChanged: (value) {
                                  setState(() {
                                    _small = value ?? false;
                                  });
                                },
                              ),
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    _small = !_small;
                                  });
                                },
                                child: Text("Small."),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Checkbox(
                                value: _medium,
                                onChanged: (value) {
                                  setState(() {
                                    _medium = value ?? false;
                                  });
                                },
                              ),
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    _medium = !_medium;
                                  });
                                },
                                child: Text("Medium"),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Checkbox(
                                value: _larg,
                                onChanged: (value) {
                                  setState(() {
                                    _larg = value ?? false;
                                  });
                                },
                              ),
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    _larg = !_larg;
                                  });
                                },
                                child: Text("Large"),
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
                      SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text.rich(
                            TextSpan(children: [
                              TextSpan(
                                  text: "RS. ",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16)),
                              TextSpan(
                                  // text: "$currentPrice",
                                   text: (double.parse(widget.price) * quantity).toStringAsFixed(2),
                                  style: TextStyle(
                                      color: AppColor().primaryColor,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 30))
                            ]),
                          ),
                          InkWell(
                            onTap: addToCart,
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
                                        borderRadius: BorderRadius.circular(12)),
                                    child: Center(
                                        child: Text(
                                      "Add to Cart",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18),
                                    ))),
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
