import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spice/views/main_screen/menu_items/add_booking_views/add_cart_option_piza.dart';
import 'package:spice/views/widget/menu_tab_items.dart';

class PizzaMenu extends StatelessWidget {
  const PizzaMenu({super.key});

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
                    "Pizza",
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
                    imagePath: "assets/imgs/ctpiz.png",
                    title: "Chicken Tikka",
                    description: "Chicken tikka on pizza crust",
                    price: "850",
                    onAddPressed: () {
                      Get.to(AddCartOptionPiza(
                        imagePath: "assets/imgs/ctpiz.png",
                    title: "Chicken Tikka",
                    description: "Chicken tikka on pizza crust",
                    price: "850",
                      ));
                    },
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  MenuTabItem(
                    imagePath: "assets/imgs/cfpiz.png",
                    title: "Chicken Fajita",
                    description: "Grilled chicken with spices, veggies",
                    price: "950",
                    onAddPressed: () {
                      Get.to(AddCartOptionPiza(
                       imagePath: "assets/imgs/cfpiz.png",
                    title: "Chicken Fajita",
                    description: "Grilled chicken with spices, veggies",
                    price: "950",
                      ));
                    },
                  ),

                  MenuTabItem(
                    imagePath: "assets/imgs/kbpiz.png",
                    title: "Kabab Stuffed",
                    description: "Spiced kebabs, cheese",
                    price: "1050",
                    onAddPressed: () {
                      //  AddCartOption();
                      Get.to(AddCartOptionPiza(
                       imagePath: "assets/imgs/kbpiz.png",
                    title: "Kabab Stuffed",
                    description: "Spiced kebabs, cheese",
                    price: "1050",
                      ));
                    },
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  MenuTabItem(
                    imagePath: "assets/imgs/cbbqpiz.png",
                    title: "Chicken BBQ",
                    description: "Pizza with grilled chicken, cheese",
                    price: "850",
                    onAddPressed: () {
                          Get.to(AddCartOptionPiza(
                     imagePath: "assets/imgs/cbbqpiz.png",
                    title: "Chicken BBQ",
                    description: "Pizza with grilled chicken, cheese",
                    price: "850",
                      ));
                    },
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  MenuTabItem(
                    imagePath: "assets/imgs/ccpiz.png",
                    title: "Crown crust",
                    description: "Crown, stuffed with cheese, flavors",
                    price: "1150",
                    onAddPressed: () {
                      
                                                Get.to(AddCartOptionPiza(
                       imagePath: "assets/imgs/ccpiz.png",
                    title: "Crown crust",
                    description: "Crown, stuffed with cheese, flavors",
                    price: "1150",
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
