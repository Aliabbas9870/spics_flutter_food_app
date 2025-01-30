import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spice/views/widget/constant.dart';
import 'package:spice/views/widget/my_cart_tab_item.dart';

class CancelOrdersScreen extends StatefulWidget {
  const CancelOrdersScreen({super.key});

  @override
  State<CancelOrdersScreen> createState() => _CancelOrdersScreenState();
}

class _CancelOrdersScreenState extends State<CancelOrdersScreen> {
  List<CartItem> cartItems = [];
  double deliveryCharge = 65.00;
  double totalPrice = 0.00;

  @override
  void initState() {
    super.initState();
    fetchCartData();
  }

  bool isLoading = false;

  Future<void> fetchCartData() async {
    try {
      final currentUser = FirebaseAuth.instance.currentUser;
      if (currentUser == null) {
        Get.snackbar("Error", "No user is currently logged in.",
            backgroundColor: AppColor().primaryColor);
        return;
      }

      final desiFoodSnapshot = await FirebaseFirestore.instance
          .collection('desifood_cart')
          .where('userId', isEqualTo: currentUser.uid)
          .where('status', whereIn: ['cart', 'booked'])
          .get();

      final drinkSnapshot = await FirebaseFirestore.instance
          .collection('drink_other_cart')
          .where('userId', isEqualTo: currentUser.uid)
        .where('status', whereIn: ['cart', 'booked'])
          .get();

      final pizzaSnapshot = await FirebaseFirestore.instance
          .collection('pizza_cart')
          .where('userId', isEqualTo: currentUser.uid)
         .where('status', whereIn: ['cart', 'booked'])
          .get();
                final friesSnapshot = await FirebaseFirestore.instance
          .collection('fries_cart')
          .where('userId', isEqualTo: currentUser.uid)
         .where('status', whereIn: ['cart', 'booked'])
          .get();

      final allItems = [
        ...desiFoodSnapshot.docs.map((doc) => CartItem.fromFirestore(doc)),
        ...drinkSnapshot.docs.map((doc) => CartItem.fromFirestore(doc)),
        ...pizzaSnapshot.docs.map((doc) => CartItem.fromFirestore(doc)),
        ...friesSnapshot.docs.map((doc) => CartItem.fromFirestore(doc)),
      ];

      setState(() {
        cartItems = allItems;
      });
    } catch (e) {
      print(e);
      Get.snackbar("Error", "Failed to fetch cart data",
          backgroundColor: AppColor().primaryColor);
    }
  }

  Future<void> cancelSelectedOrders() async {
    try {
      final selectedItems = cartItems.where((item) => item.isSelected).toList();
      if (selectedItems.isEmpty) {
        Get.snackbar("Error", "No items selected to cancel.",
            backgroundColor: AppColor().primaryColor);
        return;
      }

      for (var item in selectedItems) {
        await FirebaseFirestore.instance
            .collection(item.collectionName)
            .doc(item.id)
            .update({'status': 'canceled'});
      }

      setState(() {
        cartItems.removeWhere((item) => item.isSelected);
      });

      Get.snackbar("Success", "Selected items have been canceled.",
          backgroundColor: AppColor().primaryColor);
    } catch (e) {
      print(e);
      Get.snackbar("Error", "Failed to cancel selected items.",
          backgroundColor: AppColor().primaryColor);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.all(6),
        padding: EdgeInsets.all(6),
        width: MediaQuery.of(context).size.width,
        // height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
                SizedBox(height: 25,),
                InkWell(
                      onTap: () {
                        Get.back();
                      },
                      child: Icon(Icons.arrow_back),
                    ),
          
              SizedBox(height: 20,),
               Center(
                 child: Text(
                  "Cancel Order",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 22.0,
                    fontWeight: FontWeight.bold,
                  ),
                             ),
               ),
              const SizedBox(height: 16.0),
                 Center(
                 child: Text(
                  "Do You want to cancel your order before order confirmation?",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: 17.0,
                    fontWeight: FontWeight.normal,
                  ),
                             ),
               ),
              SingleChildScrollView(
                child: Column(
                  children: cartItems.map((item) {
                    return Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Checkbox(
                            activeColor: AppColor().secondaryColor,
                            checkColor: AppColor().bgColor,
                            value: item.isSelected,
                            onChanged: (value) {
                              setState(() {
                                item.isSelected = value ?? false;
                              });
                            },
                          ),
                          const SizedBox(width: 8.0),
                          Expanded(
                            child: MyCartTabItem(
                              imagePath: item.imagePath,
                              title: item.title,
                              description: item.description,
                              price: item.price.toString(),
                              onAddPressed: () {},
                            ),
                          ),
                        ],
                      ),
                    );
                  }).toList(),
                ),
              ),
              const SizedBox(height: 35),
                 
              const SizedBox(height: 23),
              InkWell(
                onTap: cancelSelectedOrders,
                child: Center(
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
                      child: const Center(
                        child: Text(
                          "Cancel Order",
                          style:
                              TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
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
    );
  }

  Widget priceDetailRow(String label, double amount, {bool isTotal = false}) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(
                fontSize: isTotal ? 18 : 17, fontWeight: FontWeight.bold),
          ),
          Text.rich(TextSpan(children: [
            const TextSpan(text: "RS. "),
            TextSpan(
              text: "${amount.toStringAsFixed(2)}",
              style: TextStyle(
                  fontSize: isTotal ? 22 : 20,
                  fontWeight: FontWeight.bold,
                  color: isTotal ? AppColor().primaryColor : null),
            ),
          ])),
        ],
      ),
    );
  }
}

class CartItem {
  final String id;
  final String collectionName;
  final String imagePath;
  final String title;
  final String description;
  final double price;
  bool isSelected;

  CartItem({
    required this.id,
    required this.collectionName,
    required this.imagePath,
    required this.title,
    required this.description,
    required this.price,
    this.isSelected = false,
  });

factory CartItem.fromFirestore(DocumentSnapshot doc) {
  return CartItem(
    id: doc.id,
    collectionName: doc.reference.parent.id,
    imagePath: doc['imagePath'] ?? '',
    title: doc['title'] ?? '',
    description: doc['description'] ?? '',
    price: double.tryParse(doc['price'].toString()) ?? 0.0,
  );
}

}
