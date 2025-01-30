import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spice/views/main_screen/menu_items/burger_menu.dart';
import 'package:spice/views/main_screen/menu_items/desi_food_menu.dart';
import 'package:spice/views/main_screen/menu_items/dessert_menu.dart';
import 'package:spice/views/main_screen/menu_items/wrap_menu.dart';
import 'package:spice/views/main_screen/user_scree/user_profile.dart';
import 'package:spice/views/widget/constant.dart';
import 'package:spice/views/widget/drawer.dart';
import 'package:spice/views/widget/popular_item.dart';

class HomeTab extends StatefulWidget {
  @override
  State<HomeTab> createState() => _HomeTabState();
}



class _HomeTabState extends State<HomeTab> {
  final AppColor constant = AppColor();
  final TextEditingController _searchController = TextEditingController();
  bool isSearching = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerWidget(),
      appBar: AppBar(
        backgroundColor: AppColor().bgColor,
        automaticallyImplyLeading: false,
        leading: Builder(
          builder: (context) {
            return IconButton(
              icon: Icon(
                Icons.more_vert,
                size: 31,
              ),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            );
          },
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.account_circle_outlined,
              size: 35,
            ),
            onPressed: () {
              Get.to(UserProfile());
            },
          ),
        ],
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 13,vertical:6),
                child: Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: 'Get Your Best \n',
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: constant.secondaryColor,
                        ),
                      ),
                      TextSpan(
                        text: 'Food ',
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: constant.primaryColor,
                        ),
                      ),
                      TextSpan(
                        text: 'Around You',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: constant.secondaryColor,
                        ),
                      ),
                    ],
                  ),
                  textAlign: TextAlign.left,
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 15.0, vertical: 8.0),
                child: TextField(
                  controller: _searchController,
                  style: TextStyle(color: AppColor().bgColor),
                  decoration: InputDecoration(
                    fillColor: AppColor().secondaryColor,
                    filled: true,
                    hintText: "Search",
                    hintStyle: TextStyle(color: AppColor().bgColor),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8)),
                  ),
                  onChanged: (value) {
                    setState(() {
                      isSearching = value.isNotEmpty;
                    });
                  },
                ),
              ),
              if (!isSearching) // Show 
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 655,
                    child: Column(
                      children: [
                        Container(
                          child: Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Popular",
                                  style: TextStyle(
                                      fontSize: 25,
                                      color: constant.secondaryColor,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  " ",
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: constant.primaryColor,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: PopularItem(
                                imageUrl: 'assets/imgs/RVC.png',
                                title: 'Red velvet cake',
                                onTap: () {
                                  Get.to(DessertMenu());
                                },
                              ),
                            ),
                            Expanded(
                              child: PopularItem(
                                imageUrl: 'assets/imgs/CS.png',
                                title: 'Chicken shawarma',
                                onTap: () {
                                  Get.to(WrapMenu());
                                },
                              ),
                            ),
                            Expanded(
                              child: PopularItem(
                                imageUrl: 'assets/imgs/BB.png',
                                title: 'Beef Biryani',
                                onTap: () {
                                  Get.to(DesiFoodMenu());
                                },
                              ),
                            ),
                          ],
                        ),
                        


                           SizedBox(
                          height: 2,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                                child: PopularItem(
                              imageUrl: 'assets/imgs/SC.png',
                              title: 'spicy chicken',
                              onTap: () {
                                Get.to(DesiFoodMenu());
                              },
                            )),
                            Expanded(
                                child: PopularItem(
                              imageUrl: 'assets/imgs/VC.png',
                              title: 'veg chowmein',
                              onTap: () {
                                Get.to(DesiFoodMenu());
                              },
                            )),
                            Expanded(
                                child: PopularItem(
                              imageUrl: 'assets/imgs/MK.png',
                              title: 'Mutton kabab',
                              onTap: () {
                                Get.to(DesiFoodMenu());
                              },
                            )),
                          ],
                        ),
                        Container(
                          child: Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Special offers",
                                      style: TextStyle(
                                          fontSize: 22,
                                          color: constant.secondaryColor,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      "",
                                      style: TextStyle(
                                          fontSize: 16,
                                          color: constant.primaryColor,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 8,),
                                InkWell(
                                  onTap: (){
                                    Get.to(BurgerMenu());
                                  },
                                  child: Container(
                                    width: MediaQuery.of(context).size.width - 10,
                                    height:112,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(12),
                                        image: DecorationImage(
                                            image: AssetImage(
                                              "assets/imgs/special.png",
                                            ),
                                            fit: BoxFit.cover)),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "15% ",
                                            style: TextStyle(
                                                color: AppColor().primaryColor,
                                                fontSize: 19,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          SizedBox(height: 2,),
                                          Text(
                                              "4 Zinger burger & 1.5 liter cold drink \n"
                                              "1 pack regular fries", style: TextStyle(color: AppColor().bgColor,fontSize: 13),),
                                          
                                              Text.rich(TextSpan(children: [
                                                TextSpan(text: "RS" , style: TextStyle(color: AppColor().bgColor, fontSize: 13)),
                                                TextSpan(text: " 1500", style: TextStyle(color: AppColor().secondaryColor,fontSize: 16))
                                              ]))                                    ],
                                      ),
                                    ),
                                  ),
                                )
                            ,
        
                              SizedBox(height: 8,),
                                InkWell(
                                  onTap: (){
                                    Get.to(BurgerMenu());

                                  },
                                  child: Container(
                                    width: MediaQuery.of(context).size.width - 10,
                                    height:112,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(12),
                                        image: DecorationImage(
                                            image: AssetImage(
                                              "assets/imgs/special.png",
                                            ),
                                            fit: BoxFit.cover)),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "25% ",
                                            style: TextStyle(
                                                color: AppColor().primaryColor,
                                                fontSize: 19,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          SizedBox(height: 2,),
                                          Text(
                                              "3 Zinger burger & 1.5 liter cold drink \n"
                                              "1 pack regular fries", style: TextStyle(color: AppColor().bgColor,fontSize: 13),),
                                          
                                              Text.rich(TextSpan(children: [
                                                TextSpan(text: "RS" , style: TextStyle(color: AppColor().bgColor, fontSize: 13)),
                                                TextSpan(text: " 1200", style: TextStyle(color: AppColor().secondaryColor,fontSize: 16))
                                              ]))                                    ],
                                      ),
                                    ),
                                  ),
                                )
                            ,SizedBox(height: 20,)
                            
                              ],
                            ),
                          ),
                        ),
                     
                     
                      ],
                    ),
                  ),
                )
                    
            ],
          ),
        ),
      ),
    );
  }
}






// class _HomeTabState extends State<HomeTab> {
//   final AppColor constant = AppColor();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       drawer: DrawerWidget(),
//       appBar: AppBar(
//         backgroundColor: AppColor().bgColor,
//         automaticallyImplyLeading: false, 

//         leading: Builder(
//           builder: (context) {
//             return IconButton(
//               icon: Icon(
//                 Icons.more_vert,
//                 size: 31,
//               ), 
//               onPressed: () {
//                 Scaffold.of(context).openDrawer(); 
//               },
//             );
//           },
//         ),
//         actions: [
//           IconButton(
//             icon: Icon(
//               Icons.account_circle_outlined,
//               size: 35,
//             ),
//             onPressed: () {
//               Get.to(UserProfile());
//             },
//           ),
//         ],
//       ),
//       body:  Container(
//           child: SingleChildScrollView(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Padding(
//                   padding: EdgeInsets.only(left: 8.0),
//                   child: Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: Text.rich(
//                       TextSpan(
//                         children: [
//                           TextSpan(
//                             text: 'Get Your Best \n', // First half text
//                             style: TextStyle(
//                               fontSize: 25,
//                               fontWeight: FontWeight.bold,
        
//                               color: constant.secondaryColor, // Black color
//                             ),
//                           ),
//                           TextSpan(
//                             text: 'Food ', // Second half text
//                             style: TextStyle(
//                               fontSize: 25,
//                               fontWeight: FontWeight.bold,
//                               color: constant.primaryColor, // Yellow color
//                             ),
//                           ),
//                           TextSpan(
//                             text: 'Around You', // Second half text
//                             style: TextStyle(
//                               fontSize: 24,
//                               fontWeight: FontWeight.bold,
//                               color: constant.secondaryColor, // Yellow color
//                             ),
//                           ),
//                         ],
//                       ),
//                       textAlign: TextAlign.left,
//                     ),
//                   ),
//                 ),
//                 Container(
//                   margin: EdgeInsets.symmetric(horizontal: 15.0, vertical: 8.0),
//                   // decoration: BoxDecoration(borderRadius: BorderRadius.circular(8.0)),
//                   child: TextField(
//                     style: TextStyle(color: AppColor().bgColor),
//                     decoration: InputDecoration(
//                         fillColor: AppColor().secondaryColor,
//                         filled: true,
//                         hintText: "Search",
//                         hintStyle: TextStyle(color: AppColor().bgColor),
//                         border: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(8))),
//                   ),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: Container(
//                     height: 655,
//                     child: Column(
//                       children: [
//                         Container(
//                           child: Padding(
//                             padding: const EdgeInsets.all(4.0),
//                             child: Row(
//                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                               children: [
//                                 Text(
//                                   "Popular",
//                                   style: TextStyle(
//                                       fontSize: 25,
//                                       color: constant.secondaryColor,
//                                       fontWeight: FontWeight.bold),
//                                 ),
//                                 Text(
//                                   " ",
//                                   style: TextStyle(
//                                       fontSize: 16,
//                                       color: constant.primaryColor,
//                                       fontWeight: FontWeight.bold),
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ),
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                             Expanded(
//                                 child: PopularItem(
//                               imageUrl: 'assets/imgs/RVC.png',
//                               title: 'Red velvet cake',
//                               onTap: () {
//                                 Get.to(DessertMenu());
//                               },
//                             )),
//                             Expanded(
//                                 child: PopularItem(
//                               imageUrl: 'assets/imgs/CS.png',
//                               title: 'Chicken shawarma',
//                               onTap: () {
//                                 Get.to(WrapMenu());
//                               },
//                             )),
//                             Expanded(
//                                 child: PopularItem(
//                               imageUrl: 'assets/imgs/BB.png',
//                               title: 'Beef Biryani',
//                               onTap: () {
//                                 Get.to(DesiFoodMenu());
//                               },
//                             )),
//                           ],
//                         ),
//                         SizedBox(
//                           height: 2,
//                         ),
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                             Expanded(
//                                 child: PopularItem(
//                               imageUrl: 'assets/imgs/SC.png',
//                               title: 'spicy chicken',
//                               onTap: () {
//                                 Get.to(DesiFoodMenu());
//                               },
//                             )),
//                             Expanded(
//                                 child: PopularItem(
//                               imageUrl: 'assets/imgs/VC.png',
//                               title: 'veg chowmein',
//                               onTap: () {
//                                 Get.to(DesiFoodMenu());
//                               },
//                             )),
//                             Expanded(
//                                 child: PopularItem(
//                               imageUrl: 'assets/imgs/MK.png',
//                               title: 'Mutton kabab',
//                               onTap: () {
//                                 Get.to(DesiFoodMenu());
//                               },
//                             )),
//                           ],
//                         ),
//                         Container(
//                           child: Padding(
//                             padding: const EdgeInsets.all(4.0),
//                             child: Column(
//                               children: [
//                                 Row(
//                                   mainAxisAlignment:
//                                       MainAxisAlignment.spaceBetween,
//                                   children: [
//                                     Text(
//                                       "Special offers",
//                                       style: TextStyle(
//                                           fontSize: 22,
//                                           color: constant.secondaryColor,
//                                           fontWeight: FontWeight.bold),
//                                     ),
//                                     Text(
//                                       "see all ",
//                                       style: TextStyle(
//                                           fontSize: 16,
//                                           color: constant.primaryColor,
//                                           fontWeight: FontWeight.bold),
//                                     ),
//                                   ],
//                                 ),
//                                 SizedBox(height: 8,),
//                                 Container(
//                                   width: MediaQuery.of(context).size.width - 10,
//                                   height:112,
//                                   decoration: BoxDecoration(
//                                       borderRadius: BorderRadius.circular(12),
//                                       image: DecorationImage(
//                                           image: AssetImage(
//                                             "assets/imgs/special.png",
//                                           ),
//                                           fit: BoxFit.cover)),
//                                   child: Padding(
//                                     padding: const EdgeInsets.all(8.0),
//                                     child: Column(
//                                       crossAxisAlignment:
//                                           CrossAxisAlignment.start,
//                                       children: [
//                                         Text(
//                                           "15% ",
//                                           style: TextStyle(
//                                               color: AppColor().primaryColor,
//                                               fontSize: 19,
//                                               fontWeight: FontWeight.bold),
//                                         ),
//                                         SizedBox(height: 2,),
//                                         Text(
//                                             "4 Zinger burger & 1.5 liter cold drink \n"
//                                             "1 pack regular fries", style: TextStyle(color: AppColor().bgColor,fontSize: 13),),
        
//                                             Text.rich(TextSpan(children: [
//                                               TextSpan(text: "RS" , style: TextStyle(color: AppColor().bgColor, fontSize: 13)),
//                                               TextSpan(text: " 1500", style: TextStyle(color: AppColor().secondaryColor,fontSize: 16))
//                                             ]))                                    ],
//                                     ),
//                                   ),
//                                 )
//                             ,
        
//                               SizedBox(height: 8,),
//                                 Container(
//                                   width: MediaQuery.of(context).size.width - 10,
//                                   height:112,
//                                   decoration: BoxDecoration(
//                                       borderRadius: BorderRadius.circular(12),
//                                       image: DecorationImage(
//                                           image: AssetImage(
//                                             "assets/imgs/special.png",
//                                           ),
//                                           fit: BoxFit.cover)),
//                                   child: Padding(
//                                     padding: const EdgeInsets.all(8.0),
//                                     child: Column(
//                                       crossAxisAlignment:
//                                           CrossAxisAlignment.start,
//                                       children: [
//                                         Text(
//                                           "25% ",
//                                           style: TextStyle(
//                                               color: AppColor().primaryColor,
//                                               fontSize: 19,
//                                               fontWeight: FontWeight.bold),
//                                         ),
//                                         SizedBox(height: 2,),
//                                         Text(
//                                             "3 Zinger burger & 1.5 liter cold drink \n"
//                                             "1 pack regular fries", style: TextStyle(color: AppColor().bgColor,fontSize: 13),),
        
//                                             Text.rich(TextSpan(children: [
//                                               TextSpan(text: "RS" , style: TextStyle(color: AppColor().bgColor, fontSize: 13)),
//                                               TextSpan(text: " 1200", style: TextStyle(color: AppColor().secondaryColor,fontSize: 16))
//                                             ]))                                    ],
//                                     ),
//                                   ),
//                                 )
//                             ,SizedBox(height: 20,)
                            
//                               ],
//                             ),
//                           ),
//                         ),
                     
                     
//                       ],
//                     ),
//                   ),
//                 )
//               ],
//             ),
//           ),
//         ),
      
//     );
//   }
// }
