import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spice/views/main_screen/order_detail_screen/order_food.dart';
import 'package:spice/views/main_screen/payment/payment_method_view.dart';
import 'package:spice/views/widget/constant.dart';
import 'package:spice/views/widget/my_cart_tab_item.dart';

class CartTabScreen extends StatefulWidget {
  const CartTabScreen({super.key});

  @override
  State<CartTabScreen> createState() => _CartTabScreenState();
}

class _CartTabScreenState extends State<CartTabScreen> {
 
  // Declare the controller
  final TextEditingController _addressController = TextEditingController();

  double deliveryCharge = 45.00;
  double totalPrice = 0.00;
  bool isLoading = false; // Loader state 
 List<CartItem> cartItems = [];
  @override
  void initState() {
    super.initState();
    fetchCartData();
    _fetchOnlyAddress();
  }

  Future<void> fetchCartData() async {
    try {
      final currentUser = FirebaseAuth.instance.currentUser;

      if (currentUser == null) {
        Get.snackbar("Error", "No user is currently logged in.",
            backgroundColor: AppColor().primaryColor);
        return;
      }

      // Fetch data from Firebase collections with filters
      final desiFoodSnapshot = await FirebaseFirestore.instance
          .collection('desifood_cart')
          .where('userId', isEqualTo: currentUser.uid)
          .where('status', isEqualTo: 'cart')
          .get();

      final drinkSnapshot = await FirebaseFirestore.instance
          .collection('drink_other_cart')
          .where('userId', isEqualTo: currentUser.uid)
          .where('status', isEqualTo: 'cart')
          .get();

          final friesSnapshot = await FirebaseFirestore.instance
          .collection('fries_cart')
          .where('userId', isEqualTo: currentUser.uid)
          .where('status', isEqualTo: 'cart')
          .get();


      final pizzaSnapshot = await FirebaseFirestore.instance
          .collection('pizza_cart')
          .where('userId', isEqualTo: currentUser.uid)
          .where('status', isEqualTo: 'cart')
          .get();

      // Combine all data into cartItems
      final allItems = [
        ...desiFoodSnapshot.docs.map((doc) => CartItem.fromFirestore(doc)),
        ...drinkSnapshot.docs.map((doc) => CartItem.fromFirestore(doc)),
        ...pizzaSnapshot.docs.map((doc) => CartItem.fromFirestore(doc)),
         ...friesSnapshot.docs.map((doc) => CartItem.fromFirestore(doc)),
      ];

      setState(() {
        cartItems = allItems;
        calculateTotalPrice();
      });
    } catch (e) {
      print(e);

      // Get.snackbar("Error", "Failed to fetch cart data",
      //     backgroundColor: AppColor().primaryColor);
    }
  }


  Future<void> _fetchOnlyAddress() async {
    try {
      final user = FirebaseAuth.instance.currentUser;
      if (user == null) {
        Get.snackbar("Error", "No user is logged in");
        return;
      }

      final doc = await FirebaseFirestore.instance
          .collection("Users")
          .doc(user.uid)
          .get(); 
      if (doc.exists) {
        final data = doc.data();
        _addressController.text =
            data?['userLocation'] ?? ''; 
      } else {
        Get.snackbar("Info", "No address found for this user",backgroundColor: AppColor().primaryColor);
      }
    } catch (e) {
      print(e);
      // Get.snackbar("Error", e.toString());
    }
  }

  void calculateTotalPrice() {
    totalPrice = 0.00;
    for (var item in cartItems) {
      if (item.isSelected) {
        totalPrice += item.price;
      }
    }
    totalPrice += deliveryCharge;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              // Padding(
              //   padding: const EdgeInsets.all(8.0),
              //   child: Row(
              //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //     // crossAxisAlignment: CrossAxisAlignment.center,
              //     children: [
              //       Expanded(
              //         flex: 4,
              //         child: Padding(
              //           padding: const EdgeInsets.only(bottom: 4.0),
              //           child: Container(
              //             height: 43,
              //             child: TextField(
              //               textAlign:TextAlign.left,
              //               controller:
              //                   _addressController, 
              //               style: TextStyle(color: AppColor().bgColor),
              //               decoration: InputDecoration(
              //                 prefixIcon: const Icon(Icons.location_on_outlined,
              //                     color: Colors.white),
              //                 hintText: null,
              //                 fillColor: AppColor().secondaryColor,
              //                 filled: true,
              //                 border: OutlineInputBorder(
              //                   borderSide: BorderSide(color: AppColor().bgColor),
              //                 ),
              //               ),
              //               readOnly: true,
              //             ),
              //           ),
               
               
               
              //         ),
              //       ),


                    
              //       const SizedBox(width: 4.0),
              //       Expanded(
              //         child: TextButton(
              //           onPressed: () {
              //             setState(() {});
              //             Get.snackbar("Cart", "Cart cleared successfully.");
              //           },
              //           child: Text(
              //             "Delete",
              //             style: TextStyle(
              //               fontWeight: FontWeight.bold,
              //               fontSize: 14,
              //               color: AppColor().primaryColor,
              //             ),
              //           ),
              //         ),
              //       ),
              //     ],
              //   ),
              // ),
          
          

                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        
                    children: [
                      Expanded(
                        flex: 2,
                        child:  TextField(
                              textAlign:TextAlign.left,
                              
                              controller:
                                  _addressController, 

                              style: TextStyle(color: AppColor().bgColor,fontSize: 14),
                              decoration: InputDecoration(
                                
                                prefixIcon: const Icon(Icons.location_on_outlined,
                                    color: Colors.white),
                                hintText: null,
                                fillColor: AppColor().secondaryColor,
                                filled: true,
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(color: AppColor().bgColor),
                                ),
                              ),
                              readOnly: true,
                            ),
                        
                                   
                                   
                                   
                        ),
                      
                    
                    
                                    
                    
                    
                    
                      const SizedBox(width: 4.0),
                      Expanded(

                        child: TextButton(
                          onPressed: () {
                            Get.to(OrderFood());
                            setState(() {});
                            // Get.snackbar("Cart", "Cart cleared successfully.",backgroundColor: AppColor().primaryColor);
                          },
                          child: Text(
                            "Order Food",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 17,
                              color: AppColor().primaryColor,
                            ),
                          ),
                        ),
                      ),
                    ],
                                    ),
                  ),
            
          
          
              const SizedBox(height: 16.0),
              const Text(
                "My Cart",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 22.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16.0),
              // Cart Items
              Column(
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
                              calculateTotalPrice();
                            });
                          },
                        ),
                        const SizedBox(width: 8.0),
                        Expanded(
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              MyCartTabItem(
                                imagePath: item.imagePath,
                                title: item.title,
                                description: item.description,
                                price: item.price.toString(),
                                onAddPressed: () async {
                                  setState(() {
                                    isLoading = true;
                                  });
                                  await Future.delayed(
                                      const Duration(seconds: 2));
                                  setState(() {
                                    isLoading = false;
                                  });
                                },
                              ),
                              if (isLoading)
                                Positioned.fill(
                                  child: Container(
                                    color: Colors.black.withOpacity(0.5),
                                    child: const Center(
                                      child: CircularProgressIndicator(),
                                    ),
                                  ),
                                ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                }).toList(),
              ),
              const SizedBox(height: 15),
          
          
              const Divider(),
              const SizedBox(height: 15),
              // Price Details
              priceDetailRow("Items Price:", totalPrice - deliveryCharge),
              priceDetailRow("Delivery Charges:", deliveryCharge),
              priceDetailRow("Total:", totalPrice, isTotal: true),
              const SizedBox(height: 23),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  InkWell(
                    onTap: () {
                      Get.to(PaymentMethodViw());
                    },
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
                            "Check out",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18),
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
  final String title;
  final String description;
  final String imagePath;
  final double price;
  bool isSelected;

  CartItem({
    required this.title,
    required this.description,
    required this.imagePath,
    required this.price,
    this.isSelected = false,
  });

  factory CartItem.fromFirestore(QueryDocumentSnapshot doc) {
    return CartItem(
      title: doc['title'] ?? 'Unknown',
      description: doc['description'] ?? '',
      imagePath: doc['imagePath'] ?? 'assets/imgs/default.png',
      price: double.tryParse(doc['price'].toString()) ?? 0.0,
    );
  }
}
