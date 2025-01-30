import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spice/views/main_screen/menu_items/add_booking_views/add_cart_option_drink.dart';
import 'package:spice/views/widget/menu_tab_items.dart';

class DessertMenu extends StatelessWidget {
  const DessertMenu({super.key});

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
                    "Dessert",
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
                    imagePath: "assets/imgs/faludes.png",
                    title: "Faluda",
                    description: "1 plate",
                    price: "250",
                    onAddPressed: () {
                      Get.to(AddCartOptionDrink(
                          imagePath: "assets/imgs/faludes.png",
                    title: "Faluda",
                    description: "1 plate",
                    price: "250",
                      ));
                    },
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  MenuTabItem(
                    imagePath: "assets/imgs/kheerdes.png",
                    title: "Kheer",
                    description: "1 plate",
                    price: "300",
                    onAddPressed: () {
                      Get.to(AddCartOptionDrink(
                    imagePath: "assets/imgs/kheerdes.png",
                    title: "Kheer",
                    description: "1 plate",
                    price: "300",
                      ));
                    },
                  ),

                  MenuTabItem(
                    imagePath: "assets/imgs/bdes.png",
                    title: "Brownies",
                    description: "2 piece",
                    price: "200",
                    onAddPressed: () {
                      //  AddCartOption();
                      Get.to(AddCartOptionDrink(
                       imagePath: "assets/imgs/bdes.png",
                    title: "Brownies",
                    description: "2 piece",
                    price: "200",
                      ));
                    },
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  MenuTabItem(
                    imagePath: "assets/imgs/sicdes.png",
                    title: "Strawberry Ice Cream",
                    description: "3 scoops",
                    price: "250",
                    onAddPressed: () {
                         Get.to(AddCartOptionDrink(
                         imagePath: "assets/imgs/sicdes.png",
                    title: "Strawberry Ice Cream",
                    description: "3 scoops",
                    price: "250",
                      ));
                    },
                  ),
                  SizedBox(
                    height: 4,
                  ),
                 
                       MenuTabItem(
                    imagePath: "assets/imgs/cicdes.png",
                    title: "Chocolate Ice Cream",
                    description: "3 scoops",
                    price: "350",
                    onAddPressed: () {
                         Get.to(AddCartOptionDrink(
                         imagePath: "assets/imgs/cicdes.png",
                    title: "Chocolate Ice Cream",
                    description: "3 scoops",
                    price: "350",
                      ));
                    },
                  ),
                  SizedBox(
                    height: 4,
                  ),      MenuTabItem(
                    imagePath: "assets/imgs/kicdes.png",
                    title: "Kulfa Ice Cream",
                    description: "3 scoops",
                    price: "150",
                    onAddPressed: () {
                         Get.to(AddCartOptionDrink(
                   imagePath: "assets/imgs/kicdes.png",
                    title: "Kulfa Ice Cream",
                    description: "3 scoops",
                    price: "150",
                      ));
                    },
                  ),
                  SizedBox(
                    height: 4,
                  ),      MenuTabItem(
                    imagePath: "assets/imgs/micdes.png",
                    title: "Mango Ice Cream",
                    description: "3 scoops",
                    price: "200",
                    onAddPressed: () {
                         Get.to(AddCartOptionDrink(
                  imagePath: "assets/imgs/micdes.png",
                    title: "Mango Ice Cream",
                    description: "3 scoops",
                    price: "200",
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
