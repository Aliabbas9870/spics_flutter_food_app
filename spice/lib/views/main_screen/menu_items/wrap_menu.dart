import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spice/views/main_screen/menu_items/add_booking_views/add_cart_option_drink.dart';
import 'package:spice/views/widget/menu_tab_items.dart';

class WrapMenu extends StatelessWidget {
  const WrapMenu({super.key});

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
                    "Wrap",
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
                    title: "Paratha roll",
                    description: "crispy &spicy chicken fillet ",
                    price: "250",
                    onAddPressed: () {
                      Get.to(AddCartOptionDrink(
                             imagePath: "assets/imgs/prwrp.png",
                    title: "Paratha roll",
                    description: "crispy &spicy chicken fillet ",
                    price: "250",
                      ));
                    },
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  MenuTabItem(
                    imagePath: "assets/imgs/ccwwrp.png",
                    title: "Chicken cheese wrap ",
                    description: "Chicken  with delicious flavor ",
                    price: "300",
                    onAddPressed: () {
                      Get.to(AddCartOptionDrink(
                     imagePath: "assets/imgs/ccwwrp.png",
                    title: "Chicken cheese wrap ",
                    description: "Chicken  with delicious flavor ",
                    price: "300",
                      ));
                    },
                  ),

                  MenuTabItem(
                    imagePath: "assets/imgs/cswrp.png",
                    title: "Chicken Shawarma",
                    description: "Tender chicken",
                    price: "200",
                    onAddPressed: () {
                      //  AddCartOption();
                      Get.to(AddCartOptionDrink(
                   imagePath: "assets/imgs/cswrp.png",
                    title: "Chicken Shawarma",
                    description: "Tender chicken",
                    price: "200",
                      ));
                    },
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  MenuTabItem(
                    imagePath: "assets/imgs/cprwrp.png",
                    title: "Cheese Paratha Roll",
                    description: "Roll with rich cheese ",
                    price: "350",
                    onAddPressed: () {
                         Get.to(AddCartOptionDrink(
                         imagePath: "assets/imgs/cprwrp.png",
                    title: "Cheese Paratha Roll",
                    description: "Roll with rich cheese ",
                    price: "350",
                      ));
                    },
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
