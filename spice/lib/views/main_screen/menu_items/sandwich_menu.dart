

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spice/views/main_screen/menu_items/add_booking_views/add_cart_option_drink.dart';
import 'package:spice/views/widget/menu_tab_items.dart';

class SandwichMenu extends StatelessWidget {
  const SandwichMenu({super.key});

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
                    "Sandwich",
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
                    imagePath: "assets/imgs/cssand.png",
                    title: "Club Sandwich",
                    description: "4 pieces ",
                    price: "250",
                    onAddPressed: () {
                      Get.to(AddCartOptionDrink(
                        imagePath: "assets/imgs/cssand.png",
                    title: "Club Sandwich",
                    description: "4 pieces ",
                    price: "250",
                      ));
                    },
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  MenuTabItem(
                    imagePath: "assets/imgs/ccssand.png",
                    title: "Grilled Cheese sandwich",
                    description: "Chicken  with delicious flavor ",
                    price: "300",
                    onAddPressed: () {
                      Get.to(AddCartOptionDrink(
                                 imagePath: "assets/imgs/ccssand.png",
                    title: "Grilled Cheese sandwich",
                    description: "Chicken  with delicious flavor ",
                    price: "300",
                      ));
                    },
                  ),

                
                  SizedBox(
                    height: 4,
                  ),
                  MenuTabItem(
                    imagePath: "assets/imgs/ccssand1.png",
                    title: "Classic chicken sandwich",
                    description: "Tender chicken ",
                    price: "200",
                    onAddPressed: () {
                          Get.to(AddCartOptionDrink(
             imagePath: "assets/imgs/ccssand1.png",
                    title: "Classic chicken sandwich",
                    description: "Tender chicken ",
                    price: "200",
                      ));
                    },
                  ),
                  SizedBox(
                    height: 4,
                  ),
                 


  MenuTabItem(
                    imagePath: "assets/imgs/essand.png",
                    title: "Egg sandwich ",
                    description: "Roll with rich cheese ",
                    price: "350",
                    onAddPressed: () {
                          Get.to(AddCartOptionDrink(
                   imagePath: "assets/imgs/essand.png",
                    title: "Egg sandwich ",
                    description: "Roll with rich cheese ",
                    price: "350",
                      ));
                    },
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
