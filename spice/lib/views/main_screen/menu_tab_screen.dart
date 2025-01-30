import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spice/views/main_screen/menu_items/add_booking_views/add_cart_option_desi.dart';
import 'package:spice/views/main_screen/menu_items/burger_menu.dart';
import 'package:spice/views/main_screen/menu_items/desi_food_menu.dart';
import 'package:spice/views/main_screen/menu_items/dessert_menu.dart';
import 'package:spice/views/main_screen/menu_items/drinks_menu.dart';
import 'package:spice/views/main_screen/menu_items/fries_menu.dart';
import 'package:spice/views/main_screen/menu_items/pizza_menu.dart';
import 'package:spice/views/main_screen/menu_items/sandwich_menu.dart';
import 'package:spice/views/main_screen/menu_items/wrap_menu.dart';
import 'package:spice/views/widget/constant.dart';
import 'package:spice/views/widget/menu_item.dart';
import 'package:spice/views/widget/menu_tab_items.dart';
import 'package:spice/views/widget/recommand_item.dart';

class MenuTab extends StatelessWidget {
  @override
  final AppColor constant = AppColor();

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor().bgColor,
      body: Padding(
        padding: const EdgeInsets.only(left: 8.0, top: 35.0, right: 8.0),
        child: Container(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: 'Choose \n', // First half text
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,

                          color: constant.primaryColor, // Black color
                        ),
                      ),
                      TextSpan(
                        text: 'Your Favorite ', // Second half text
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: constant.secondaryColor, // Yellow color
                        ),
                      ),
                      TextSpan(
                        text: 'Food', // Second half text
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: constant.primaryColor, // Yellow color
                        ),
                      ),
                    ],
                  ),
                  textAlign: TextAlign.left,
                ),
                SizedBox(
                  height:5,
                ),
                Container(
                  height: 150,
                  width: MediaQuery.sizeOf(context).height * 0.9,
                  child: ClipRRect(
                    child: Image.asset(
                      "assets/imgs/burgerm.png",
                      width: MediaQuery.sizeOf(context).height * 0.9,
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Container(
                  width: MediaQuery.sizeOf(context).height * 0.9,
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          MenuItem(
                            imageUrl: 'assets/imgs/drink.png',
                            title: 'Drinks',
                            onTap: () {
                              Get.to(DrinksMenu());
                            },
                          ),
                          MenuItem(
                            imageUrl: 'assets/imgs/desifood.png',
                            title: 'Desi Food',
                            onTap: () {

                                  Get.to(DesiFoodMenu());
                            },
                          ),
                          MenuItem(
                            imageUrl: 'assets/imgs/piza.png',
                            title: 'Pizza',
                            onTap: () {

                               Get.to(PizzaMenu());
                            },
                          ),
                          MenuItem(
                            imageUrl: 'assets/imgs/burger.png',
                            title: 'Burger',
                            onTap: () {
                                Get.to( BurgerMenu());
                             
                            },
                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          MenuItem(
                            imageUrl: 'assets/imgs/desert.png',
                            title: 'Dessert',
                            onTap: () {


                              Get.to(DessertMenu());
                            },
                          ),
                          MenuItem(
                            imageUrl: 'assets/imgs/sandwich.png',
                            title: 'Sandwich',
                            onTap: () {
                               Get.to( SandwichMenu());
                            },
                          ),
                          MenuItem(
                            imageUrl: 'assets/imgs/fries.png',
                            title: 'Fries',
                            onTap: () {
                                      Get.to( FriesMenu());
                            },
                          ),
                          MenuItem(
                            imageUrl: 'assets/imgs/wrap.png',
                            title: 'Wrap',
                            onTap: () {
                                 Get.to( WrapMenu());
                            },
                          )
                        ],
                      )
                    ],
                  ),
                ),

                 SizedBox(height: 5.0,),
                Container(
                  child: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Recommended For You",
                              style: TextStyle(
                                  fontSize: 22,
                                  color: constant.secondaryColor,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              " ",
                              style: TextStyle(
                                  fontSize: 14,
                                  color: constant.primaryColor,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                         SizedBox(height: 5.0,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                                child: RecommandItem(
                              imageUrl: 'assets/imgs/RVC.png',
                              title: 'Red velvet cake',
                              onTap: () {
                                Get.to(DessertMenu());
                              },
                            )),
                            Expanded(
                                child: RecommandItem(
                              imageUrl: 'assets/imgs/CS.png',
                              title: 'Chicken shawarma',
                              onTap: () {
                                Get.to(WrapMenu());
                              },
                            )),
                            Expanded(
                                child: RecommandItem(
                              imageUrl: 'assets/imgs/BB.png',
                              title: 'Beef Biryani',
                              onTap: () {
                                Get.to(DesiFoodMenu());
                              },
                            )),
                          ],
                        ),
                        SizedBox(
                          height: 2,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                                child: RecommandItem(
                              imageUrl: 'assets/imgs/SC.png',
                              title: 'spicy chicken',
                              onTap: () {
                                Get.to(DesiFoodMenu());
                              },
                            )),
                            Expanded(
                                child: RecommandItem(
                              imageUrl: 'assets/imgs/VC.png',
                              title: 'veg chowmein',
                              onTap: () {
                                 Get.to(DesiFoodMenu());
                              },
                            )),
                            Expanded(
                                child: RecommandItem(
                              imageUrl: 'assets/imgs/MK.png',
                              title: 'Mutton kabab',
                              onTap: () {

                                 Get.to(DesiFoodMenu());
                              },
                            )),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "For Breakfast",
                              style: TextStyle(
                                  fontSize: 22,
                                  color: constant.secondaryColor,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              " ",
                              style: TextStyle(
                                  fontSize: 14,
                                  color: constant.primaryColor,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
  SizedBox(height: 5.0,),



                    


                             MenuTabItem(
                    imagePath: "assets/imgs/mqdesi.png",
                    title: "Mutton Qeema",
                    description: "Half & Full",
                    price: "350",
                    onAddPressed: () {
                             Get.to(AddCartOptionDesi(
              imagePath: "assets/imgs/mqdesi.png",
                    title: "Mutton Qeema",
                    description: "Half & Full",
                    price: "350",
                      ));
                    },
                  ),
              
                  SizedBox(
                    height: 4,
                  ),
                  MenuTabItem(
                    imagePath: "assets/imgs/ckdesi.png",
                    title: "Chicken Korma",
                    description: "Half & Full",
                    price: "350",
                    onAddPressed: () {
                                       Get.to(AddCartOptionDesi(
 imagePath: "assets/imgs/ckdesi.png",
                    title: "Chicken Korma",
                    description: "Half & Full",
                    price: "350",
                      ));
                    },
                  ),
                        
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
