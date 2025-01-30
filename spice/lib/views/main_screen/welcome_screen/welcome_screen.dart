import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spice/views/main_screen/welcome_screen/find_food.dart';
import 'package:spice/views/widget/constant.dart'; 

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: AppColor().bgColor,
      body:Padding(
        padding: const EdgeInsets.all(12.0),
        child: Container(
            width: screenWidth,
          margin: EdgeInsets.only(top: 20.0),

            height: screenHeight,
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
        
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("Welcome!!!",style: TextStyle( fontWeight: FontWeight.bold, fontSize: 28,color: AppColor().primaryColor),),
              ),
              SizedBox(height: 8,),
             // Logo
                Center(
                  child: Image.asset(
                    "assets/imgs/entrance.png",
                    width: screenWidth * 0.7, // 70% of the screen width
                    height: screenHeight * 0.4, // 30% of the screen height
                    fit: BoxFit.contain,
                  ),
                ),
                SizedBox(height: 19.0),
        
                Text(
                  
                style: TextStyle(fontWeight: FontWeight.bold),
                  
                  "Welcome to Spice Safari, where flavors from around the Pakistan await your taste. Begin a food adventure with our diverse menu of spicy delights. Experience the thrill of exotic spices and bold flavors right at your doorstep. Elevate your dining experience with this delight food app that exceed ordinary food into extraordinary food!")
        
,
        SizedBox(height: 8.0,)
                   ,Row(
                    mainAxisAlignment: MainAxisAlignment.end,children: [
                      
                      InkWell(
                        onTap: (){
Get.to(FindFood());
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                          width: 85.0, 
                          height: 30,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.0),
                            color: AppColor().secondaryColor),
                          child: Center(child: Text("Next",style: TextStyle( fontSize: 15, color: AppColor().bgColor),))),
                        ),
                      )],
                   )    
          
            ],),
        
        ),
      ) ,
    );
  }
}