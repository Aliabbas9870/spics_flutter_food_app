import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spice/views/main_screen/menu_items/add_booking_views/add_cart_option_drink.dart';
import 'package:spice/views/widget/menu_tab_items.dart';

class DrinksMenu extends StatelessWidget {
  const DrinksMenu({super.key});

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
                    "Cold Beverages",
                    style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "Water ",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  MenuTabItem(
                    imagePath: "assets/imgs/npwat.png",
                    title: "Nestle & Pakola ",
                    description: "1 bottle",
                    price: "50",
                    onAddPressed: () {

                      Get.to(AddCartOptionDrink(
                           imagePath: "assets/imgs/npwat.png",
                    title: "Nestle & Pakola ",
                    description: "1 bottle",
                    price: "50",
                      ));



                    },


                  ),
                  SizedBox(
                    height: 4,
                  ),
                  MenuTabItem(
                    imagePath: "assets/imgs/cwwat.png",
                    title: "Coconut water",
                    description: "1 glass",
                    price: "190",
                    onAddPressed: () {


            Get.to(AddCartOptionDrink(
                              imagePath: "assets/imgs/cwwat.png",
                    title: "Coconut water",
                    description: "1 glass",
                    price: "190",
                      ));



                    },
                  ),
                  Text(
                    "Lemonade",
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  MenuTabItem(
                    imagePath: "assets/imgs/mmlem.png",
                    title: "Mint Margarita",
                    description: "1 glass",
                    price: "150",
                    onAddPressed: () {





                      
                      //  AddCartOption();
                      Get.to(AddCartOptionDrink(
                      imagePath: "assets/imgs/mmlem.png",
                    title: "Mint Margarita",
                    description: "1 glass",
                    price: "150",
                      ));
                    },
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  MenuTabItem(
                    imagePath: "assets/imgs/slslem.png",
                    title: "Sweet Lime Soda",
                    description: "glass",
                    price: "140",
                    onAddPressed: () {
                          
                      //  AddCartOption();
                      Get.to(AddCartOptionDrink(
                      imagePath: "assets/imgs/slslem.png",
                    title: "Sweet Lime Soda",
                    description: "glass",
                    price: "140",
                      ));
                    },
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  MenuTabItem(
                    imagePath: "assets/imgs/mlem.png",
                    title: "mojito",
                    description: "mojito",
                    price: "200",
                    onAddPressed: () {
                          
                      //  AddCartOption();
                      Get.to(AddCartOptionDrink(
                         imagePath: "assets/imgs/mlem.png",
                    title: "mojito",
                    description: "mojito",
                    price: "200",
                      ));
                    },
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  Text(
                    "Soft Drinks",
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  MenuTabItem(
                    imagePath: "assets/imgs/coc.png",
                    title: "Coca Cola",
                    description: "1.5 liter bottle",
                    price: "200",
                    onAddPressed: () {
                          
                      //  AddCartOption();
                      Get.to(AddCartOptionDrink(
                     imagePath: "assets/imgs/coc.png",
                    title: "Coca Cola",
                    description: "1.5 liter bottle",
                    price: "200",
                      ));
                    },
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  MenuTabItem(
                    imagePath: "assets/imgs/pepe.png",
                    title: "Pepsi",
                    description: "1.5 liter bottle",
                    price: "250",
                    onAddPressed: () {
                      
                                            //  AddCartOption();
                      Get.to(AddCartOptionDrink(
                    imagePath: "assets/imgs/pepe.png",
                    title: "Pepsi",
                    description: "1.5 liter bottle",
                    price: "250",
                      ));

                    },
                  ),
                  ////////////////////
                  ///
                 SizedBox(
                    height: 4,
                  ),
                  Text(
                    "Shakes",
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  MenuTabItem(
                    imagePath: "assets/imgs/mangoshk.png",
                    title: "Mango",
                    description: "1 glass",
                    price: "200",
                    onAddPressed: () {
                                            //  AddCartOption();
                      Get.to(AddCartOptionDrink(
                       imagePath: "assets/imgs/mangoshk.png",
                    title: "Mango",
                    description: "1 glass",
                    price: "200",
                      ));
                    },
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  MenuTabItem(
                    imagePath: "assets/imgs/peachshk.png",
                    title: "Peach",
                    description: "1 glass",
                    price: "350",
                    onAddPressed: () {

                                            //  AddCartOption();
                      Get.to(AddCartOptionDrink(
             imagePath: "assets/imgs/peachshk.png",
                    title: "Peach",
                    description: "1 glass",
                    price: "350",
                      ));
                    },
                  ),
   SizedBox(
                    height: 4,
                  ),
                  MenuTabItem(
                    imagePath: "assets/imgs/banshk.png",
                    title: "Banana",
                    description: "1 glass",
                    price: "150",
                    onAddPressed: () {
                                            //  AddCartOption();
                      Get.to(AddCartOptionDrink(
                     imagePath: "assets/imgs/banshk.png",
                    title: "Banana",
                    description: "1 glass",
                    price: "150",
                      ));
                    },
                  ),



  SizedBox(
                    height: 4,
                  ),
                  Text(
                    "Cold Coffee",
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  MenuTabItem(
                    imagePath: "assets/imgs/icoffee.png",
                    title: "Iced Coffee",
                    description: "1 glass",
                    price: "300",
                    onAddPressed: () {
                                            //  AddCartOption();
                      Get.to(AddCartOptionDrink(
         imagePath: "assets/imgs/icoffee.png",
                    title: "Iced Coffee",
                    description: "1 glass",
                    price: "300",
                      ));
                    },
                  ),



      SizedBox(
                    height: 4,
                  ),
                  MenuTabItem(
                    imagePath: "assets/imgs/iclcoffee.png",
                    title: "Iced Coffee Latte",
                    description: "1 glass",
                    price: "350",
                    onAddPressed: () {
                                            //  AddCartOption();
                      Get.to(AddCartOptionDrink(
                       imagePath: "assets/imgs/iclcoffee.png",
                    title: "Iced Coffee Latte",
                    description: "1 glass",
                    price: "350",
                      ));
                    },
                  ),







  SizedBox(
                    height: 4,
                  ),
                  Text(
                    "Smoothies",
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  MenuTabItem(
                    imagePath: "assets/imgs/sssmoth.png",
                    title: "Strawberry Smoothie ",
                    description: "1 glass",
                    price: "350",
                    onAddPressed: () {
                                            //  AddCartOption();
                      Get.to(AddCartOptionDrink(
                   imagePath: "assets/imgs/sssmoth.png",
                    title: "Strawberry Smoothie ",
                    description: "1 glass",
                    price: "350",
                      ));
                    },
                  ),



      SizedBox(
                    height: 4,
                  ),


  MenuTabItem(
                    imagePath: "assets/imgs/mssmoth.png",
                    title: "Mango Smoothie ",
                    description: "1 glass",
                    price: "350",
                    onAddPressed: () {
                                            //  AddCartOption();
                      Get.to(AddCartOptionDrink(
                        imagePath: "assets/imgs/mssmoth.png",
                    title: "Mango Smoothie ",
                    description: "1 glass",
                    price: "350",
                      ));
                    },
                  ),



      SizedBox(
                    height: 4,
                  ),


  MenuTabItem(
                    imagePath: "assets/imgs/absmth.png",
                    title: "Apple & Beetroot  ",
                    description: "1 glass",
                    price: "400",
                    onAddPressed: () {
                                            //  AddCartOption();
                      Get.to(AddCartOptionDrink(
                      imagePath: "assets/imgs/absmth.png",
                    title: "Apple & Beetroot  ",
                    description: "1 glass",
                    price: "400",
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
