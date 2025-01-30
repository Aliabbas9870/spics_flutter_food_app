import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spice/views/main_screen/menu_items/add_booking_views/add_cart_option_fries.dart';
import 'package:spice/views/widget/menu_tab_items.dart';

class FriesMenu extends StatelessWidget {
  const FriesMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(5.0),
        margin: EdgeInsets.only(top: 15.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      Get.back();
                    },
                    child: Icon(Icons.arrow_back),
                  ),
                  Text(
                    "Menu",
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  Text("")
                ],
              ),
              Container(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Fries",
                    style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  MenuTabItem(
                    imagePath: "assets/imgs/prwrp.png",
                    title: "Classic Fries",
                    description: "Golden crispy fries with a hint of salt.",
                    price: "150",
                    onAddPressed: () {
                      Get.to(AddCartOptionFries(
                        imagePath: "assets/imgs/prwrp.png",
                       title: "Classic Fries",
  description: "Golden crispy fries with a hint of salt.",
  price: "150",
                      ));
                    },
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  MenuTabItem(
                    imagePath: "assets/imgs/ccwwrp.png",
                   title: "Classic Fries",
  description: "Golden crispy fries with a hint of salt.",
  price: "150",
                    onAddPressed: () {
                      Get.to(AddCartOptionFries(
                        imagePath: "assets/imgs/ccwwrp.png",
                         title: "Classic Fries",
  description: "Golden crispy fries with a hint of salt.",
  price: "150",
                      ));
                    },
                  ),
                  MenuTabItem(
                    imagePath: "assets/imgs/cswrp.png",
                  title: "Classic Fries",
  description: "Golden crispy fries with a hint of salt.",
  price: "150",
                    onAddPressed: () {
                      //  AddCartOption();
                      Get.to(AddCartOptionFries(
                        imagePath: "assets/imgs/cswrp.png",
                   title: "Classic Fries",
  description: "Golden crispy fries with a hint of salt.",
  price: "150",
                      ));
                    },
                  ),
                  SizedBox(
                    height: 4,
                  ),
              
              
                  SizedBox(
                    height: 4,
                  ),
                ],
              ))
            ],
          ),
        ),
      ),
    );
  }
}
