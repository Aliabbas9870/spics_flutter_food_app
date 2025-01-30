import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spice/views/auth/Login_Account.dart';
import 'package:spice/views/widget/constant.dart';

class Logout extends StatelessWidget {
  const Logout({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(12),
        margin: EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 12,),
              IconButton(onPressed: (){
                  Get.back();
                }, icon: Icon(Icons.arrow_back,size: 33,)),
            SizedBox(height: 22,),
            Center(child: Text("Logout",style: TextStyle(fontSize: 26, color: AppColor().primaryColor, fontWeight: FontWeight.bold  , ),)),
             SizedBox(height: 92,),
            Center(child: Image.asset("assets/imgs/logout.png",height: 259,)),
            SizedBox(height: 92,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                                Center(
                                  child: Container(
                                                    width: 99,
                                                    height: 46,
                                                    decoration: BoxDecoration(
                                                        borderRadius: BorderRadius.circular(12),
                                                        border: Border.all(color: AppColor().secondaryColor)
                                                        ),
                                                    child: Center(
                                                        child: Text("No",
                                                            style: TextStyle(
                                                                fontSize: 15, fontWeight: FontWeight.bold))),
                                                  ),
                                ),

                                SizedBox(width: 42,),
                InkWell(
                  onTap: ()async{

                     try {
                            // Sign out the user from Firebase
                            await FirebaseAuth.instance.signOut();
                            print('User successfully signed out');
                             ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          backgroundColor: AppColor().primaryColor,
          
          content: const Text(
            "User successfully signed out",
            style: TextStyle(
                  fontSize: 16,
              color: Colors.black
            ),
          )));

                            Get.off( LoginAccount());
                          } catch (e) {
                            print('Error signing out: $e');
                            // Optionally, show an error message to the user
                          }
                  },
                  child: Container(
                    width: 99,
                    height: 46,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: AppColor().primaryColor),
                    child: Center(
                        child: Text("Yes",
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.bold))),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
