import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spice/admin/admin_login.dart';
import 'package:spice/views/auth/logout.dart';
import 'package:spice/views/main_screen/customer_support.dart';
import 'package:spice/views/main_screen/feedback_view.dart';
import 'package:spice/views/main_screen/order_history.dart';
import 'package:spice/views/main_screen/payment/payment_method_view.dart';
import 'package:spice/views/main_screen/user_scree/user_profile.dart';
import 'package:spice/views/widget/constant.dart';

class DrawerWidget extends StatelessWidget {
  DrawerWidget({super.key});
  final AppColor constant = AppColor();

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          // Drawer Header
          DrawerHeader(
            
            decoration: BoxDecoration(
              
              color: constant.bgColor, 
            ),
            child: Center(
              
              child: Image.asset(
                "assets/imgs/entrance.png",
                fit: BoxFit.cover,
              ),
            ),
          ),

          ListTile(
            leading: Icon(Icons.person, color: constant.secondaryColor),
            title: Text('Profile', style: TextStyle(color: constant.secondaryColor)),
            onTap: () {
              // Navigator.pop(context);
              Get.to(UserProfile());
    
            },
          ),

          // ListTile for History
          ListTile(
            leading: Icon(Icons.history, color: constant.secondaryColor),
            title: Text('History', style: TextStyle(color: constant.secondaryColor)),
            onTap: () {
        
              Get.to(OrderHistory());
            },
          ),

            // ListTile for History
          ListTile(
            leading: Icon(Icons.money, color: constant.secondaryColor),
            title: Text('Payment', style: TextStyle(color: constant.secondaryColor)),
            onTap: () {
        
              Get.to(PaymentMethodViw());
            },
          ),




   // ListTile for History
          ListTile(
            leading: Icon(Icons.feedback_rounded, color: constant.secondaryColor),
            title: Text('FeedbackView', style: TextStyle(color: constant.secondaryColor)),
            onTap: () {
        
              Get.to(FeedbackView());
            },
          ),
  
          ListTile(
            leading: Icon(Icons.support_agent, color: constant.secondaryColor),
            title: Text('Customer Support', style: TextStyle(color: constant.secondaryColor)),
            onTap: () {
              Get.to(CustomerSupport());
              
            },
          ),

               ListTile(
            leading: Icon(Icons.person_outlined, color: constant.secondaryColor),
            title: Text('Admin', style: TextStyle(color: constant.secondaryColor)),
            onTap: () {
              Get.to(AdminLogin());
              
            },
          ),



          ListTile(
            leading: Icon(Icons.logout, color: constant.secondaryColor),
            title: Text('Logout', style: TextStyle(color: constant.secondaryColor)),
            onTap: () {

              
              //  Get.replace(Logout());
               Get.to(Logout());
          
            },
          ),

        

        
        ],
      ),
    );
  }
}
