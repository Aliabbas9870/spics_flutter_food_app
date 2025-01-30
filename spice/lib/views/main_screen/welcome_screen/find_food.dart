import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spice/views/main_screen/home_screen_start.dart';
import 'package:spice/views/widget/constant.dart'; 

class FindFood extends StatelessWidget {
  const FindFood({super.key});

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: AppColor().bgColor,
      body:Padding(
        padding: const EdgeInsets.all(12.0),
        child: Container(
          margin: EdgeInsets.only(top: 20.0),
            width: screenWidth,
            height: screenHeight,
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
        
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("Find food you love!!!",style: TextStyle( fontWeight: FontWeight.bold,  fontSize: 28,color: AppColor().primaryColor),),
              ),
              SizedBox(height: 8,),
             // Logo
                Center(
                  child: Image.asset(
                    "assets/imgs/welff.png",
                    width: screenWidth * 0.7, // 70% of the screen width
                    height: screenHeight * 0.4, // 30% of the screen height
                    fit: BoxFit.contain,
                  ),
                ),
                SizedBox(height: 19.0),
                Text("Pamper yourself with delight flavor of our cookery masterpiece chunk of juicy grilled chicken, settled  on a bed of perfectly seasoned quinoa and garnished with a blend of vibrant roasted vegetables. Discover the flavors you crave with just a few taps. Explore a variety of food traditions and find the perfect meal  for every craving.",
                style: TextStyle(fontWeight: FontWeight.bold),
                
                ) ,
        SizedBox(height: 8.0,)      
                   ,Row(
                    mainAxisAlignment: MainAxisAlignment.end,children: [
                      InkWell(
                        onTap: (){
                          
                          Get.to(HomeScreenStart());

                          
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