import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spice/views/main_screen/menu_items/add_booking_views/add_cart_option_desi.dart';
import 'package:spice/views/widget/menu_tab_items.dart';

class DesiFoodMenu extends StatelessWidget {
  const DesiFoodMenu({super.key});

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
                    "Desi Food",
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
                    imagePath: "assets/imgs/ckdesi.png",
                    title: "Chicken Karahi",
                    description: "Half & Full",
                    price: "450",
                    onAddPressed: () {
                      Get.to(AddCartOptionDesi(
                     imagePath: "assets/imgs/ckdesi.png",
                    title: "Chicken Karahi",
                    description: "Half & Full",
                    price: "450",
                      ));
                    },
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  MenuTabItem(
                    imagePath: "assets/imgs/mkdesi.png",
                    title: "Mutton Karahi",
                    description: "Half & Full",
                    price: "650",
                    onAddPressed: () {
                      Get.to(AddCartOptionDesi(
                    imagePath: "assets/imgs/ckdesi.png",
                    title: "Chicken Karahi",
                    description: "Half & Full",
                    price: "450",
                      ));
                    },
                  ),

                  MenuTabItem(
                    imagePath: "assets/imgs/bkdesi.png",
                    title: "Beef Karahi",
                    description: "Half & Full",
                    price: "550",
                    onAddPressed: () {
                      //  AddCartOption();
                      Get.to(AddCartOptionDesi(
                      imagePath: "assets/imgs/bkdesi.png",
                    title: "Beef Karahi",
                    description: "Half & Full",
                    price: "550",
                      ));
                    },
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  MenuTabItem(
                    imagePath: "assets/imgs/befkdesi.png",
                    title: "Beef Kofta",
                    description: "Half & Full",
                    price: "350",
                    onAddPressed: () {

                          //  AddCartOption();
                      Get.to(AddCartOptionDesi(
                     imagePath: "assets/imgs/befkdesi.png",
                    title: "Beef Kofta",
                    description: "Half & Full",
                    price: "350",
                      ));
                    },
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  // MenuTabItem(
                  //   imagePath: "assets/imgs/mdesi.png",
                  //   title: "mojito",
                  //   description: "mojito",
                  //   price: "200",
                  //   onAddPressed: () {},
                  // ),
                  // SizedBox(
                  //   height: 4,
                  // ),
                  // Text(
                  //   "Soft Drinks",
                  //   style: TextStyle(
                  //     fontSize: 16,
                  //   ),
                  // ),
                  SizedBox(
                    height: 4,
                  ),
                  MenuTabItem(
                    imagePath: "assets/imgs/mqdesi.png",
                    title: "Mutton Qeema",
                    description: "Half & Full",
                    price: "350",
                    onAddPressed: () {

                                  //  AddCartOption();
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
                    imagePath: "assets/imgs/cmdesi.png",
                    title: "Chana Masala",
                    description: "Half & Full",
                    price: "250",
                    onAddPressed: () {
                          Get.to(AddCartOptionDesi(
               imagePath: "assets/imgs/cmdesi.png",
                    title: "Chana Masala",
                    description: "Half & Full",
                    price: "250",
                      ));
                    },
                  ),
                  ////////////////////
                  ///
                  SizedBox(
                    height: 4,
                  ),

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

                  SizedBox(
                    height: 4,
                  ),

                  Text(
                    "Rice",
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  MenuTabItem(
                    imagePath: "assets/imgs/cbric.png",
                    title: "Chicken Biryani ",
                    description: "Half & Full",
                    price: "350",
                    onAddPressed: () {
                                    Get.to(AddCartOptionDesi(
   imagePath: "assets/imgs/cbric.png",
                    title: "Chicken Biryani ",
                    description: "Half & Full",
                    price: "350",
                      ));
                    },
                  ),

                  SizedBox(
                    height: 4,
                  ),

                  Text(
                    "Breads",
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  MenuTabItem(
                    imagePath: "assets/imgs/rnbred.png",
                    title: "Roghni naan ",
                    description: "",
                    price: "100",
                    onAddPressed: () {


                                               Get.to(AddCartOptionDesi(
 imagePath: "assets/imgs/rnbred.png",
                    title: "Roghni naan ",
                    description: "",
                    price: "100",
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
