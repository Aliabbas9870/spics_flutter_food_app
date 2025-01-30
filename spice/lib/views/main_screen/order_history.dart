import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spice/views/widget/constant.dart';
import 'package:spice/views/widget/order_history_item.dart';

class OrderHistory extends StatefulWidget {
  const OrderHistory({super.key});

  @override
  _OrderHistoryState createState() => _OrderHistoryState();
}

class _OrderHistoryState extends State<OrderHistory> {
  List<Map<String, dynamic>> cartItems = [];
  List<Map<String, dynamic>> bookedItems = [];
  List<Map<String, dynamic>> canceledItems = [];
  bool isLoading = true; // To track the loading state

  @override
  void initState() {
    super.initState();
    fetchOrderData();
  }

  Future<void> fetchOrderData() async {
    try {
      final currentUser = FirebaseAuth.instance.currentUser;

      if (currentUser == null) {
        Get.snackbar("Error", "No user is currently logged in.",
            backgroundColor: AppColor().primaryColor);
        return;
      }

      final collections = [
        'desifood_cart',
        'drink_other_cart',
        'fries_cart',
        'pizza_cart',
      ];

      List<Map<String, dynamic>> tempCartItems = [];
      List<Map<String, dynamic>> tempBookedItems = [];
      List<Map<String, dynamic>> tempCanceledItems = [];

      for (String collection in collections) {
        final cartSnapshot = await FirebaseFirestore.instance
            .collection(collection)
            .where('userId', isEqualTo: currentUser.uid)
            .where('status', isEqualTo: 'cart')
            .get();

        final bookedSnapshot = await FirebaseFirestore.instance
            .collection(collection)
            .where('userId', isEqualTo: currentUser.uid)
            .where('status', isEqualTo: 'booked')
            .get();

        final canceledSnapshot = await FirebaseFirestore.instance
            .collection(collection)
            .where('userId', isEqualTo: currentUser.uid)
            .where('status', isEqualTo: 'canceled')
            .get();

        tempCartItems.addAll(cartSnapshot.docs.map((doc) => doc.data()));
        tempBookedItems.addAll(bookedSnapshot.docs.map((doc) => doc.data()));
        tempCanceledItems.addAll(canceledSnapshot.docs.map((doc) => doc.data()));
      }

      setState(() {
        cartItems = tempCartItems;
        bookedItems = tempBookedItems;
        canceledItems = tempCanceledItems;
        isLoading = false; // Data load completed
      });
    } catch (e) {
      print(e);
      // Get.snackbar("Error", "Failed to fetch order data",
      //     backgroundColor: AppColor().primaryColor);
      setState(() {
        isLoading = false; // Hide loader even if there's an error
      });
    }
  }

  Widget buildOrderSection(String title, List<Map<String, dynamic>> items) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (items.isNotEmpty)
          Text(
            title,
            style: const TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
          ),
        const SizedBox(height: 12),
        if (items.isNotEmpty)
          ...items.map((item) {
            return OrderHistoryItem(
              imagePath: item['imagePath'] ?? "assets/imgs/placeholder.png",
              title: item['title'] ?? "No title",
              description: item['description'] ?? "No description",
              price: item['price']?.toString() ?? "0",
              onAddPressed: () {
                print("Added ${item['title']} to order history.");
              },
            );
          }).toList(),
        const SizedBox(height: 20),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Container(
          margin: const EdgeInsets.only(top: 13),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const SizedBox(height: 12),
              CircleAvatar(
                backgroundColor: AppColor().primaryColor,
                child: IconButton(
                  onPressed: () {
                    Get.back();
                  },
                  icon: const Icon(Icons.arrow_back),
                ),
              ),
              const SizedBox(height: 12),
              const Center(
                child: Text(
                  "Order History",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 30),
              isLoading
                  ? const Center(
                      child: Text(
                        "Please wait, loading data...",
                        style: TextStyle(fontSize: 16),
                      ),
                    )
                  : Expanded(
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            buildOrderSection("All - Cart", cartItems),
                            buildOrderSection("All - Booked", bookedItems),
                            buildOrderSection("All - Canceled", canceledItems),
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
