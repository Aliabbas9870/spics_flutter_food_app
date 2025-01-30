import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spice/views/main_screen/menu_items/add_booking_views/add_cart_option_drink.dart';
import 'package:spice/views/widget/menu_tab_items.dart';

class BurgerMenu extends StatelessWidget {
  const BurgerMenu({super.key});

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
                    "Burger",
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
                    imagePath: "assets/imgs/zbburg.png",
                    title: "Zinger Burger",
                    description: "crispy &spicy chicken fillet ",
                    price: "450",
                    onAddPressed: () {
                      Get.to(AddCartOptionDrink(
             imagePath: "assets/imgs/zbburg.png",
                    title: "Zinger Burger",
                    description: "crispy &spicy chicken fillet ",
                    price: "450",
                      ));
                    },
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  MenuTabItem(
                    imagePath: "assets/imgs/ccbburg.png",
                    title: "Classic Cheese Burger ",
                    description: "Grilled chicken with spices, veggies ",
                    price: "950",
                    onAddPressed: () {
                      Get.to(AddCartOptionDrink(
                      imagePath: "assets/imgs/ccbburg.png",
                    title: "Classic Cheese Burger ",
                    description: "Grilled chicken with spices, veggies ",
                    price: "950",
                      ));
                    },
                  ),

                  MenuTabItem(
                    imagePath: "assets/imgs/dtburg.png",
                    title: "Double Trouble",
                    description: "Two chicken patties with toppings ",
                    price: "550",
                    onAddPressed: () {
                      //  AddCartOption();
                      Get.to(AddCartOptionDrink(
                  imagePath: "assets/imgs/dtburg.png",
                    title: "Double Trouble",
                    description: "Two chicken patties with toppings ",
                    price: "550",
                      ));
                    },
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  MenuTabItem(
                    imagePath: "assets/imgs/cebburg.png",
                    title: "Classic egg burger",
                    description: "Egg burger with traditional spices ",
                    price: "350",
                    onAddPressed: () {
                               Get.to(AddCartOptionDrink(
                  imagePath: "assets/imgs/cebburg.png",
                    title: "Classic egg burger",
                    description: "Egg burger with traditional spices ",
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
