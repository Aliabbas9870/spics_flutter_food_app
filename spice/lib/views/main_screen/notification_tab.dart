import 'package:flutter/material.dart';
import 'package:spice/views/widget/constant.dart'; 

class NotificationTab extends StatelessWidget {
   NotificationTab({super.key});

  final AppColor constant = AppColor();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Container(
         width: MediaQuery.sizeOf(context).height * 0.9,
         height: MediaQuery.sizeOf(context).height,
        margin: EdgeInsets.only(top: 15.0),
        padding: EdgeInsets.all(6),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          
          children: [
            SizedBox(height: 25,),
            
            Text("Notifications"  ,style: TextStyle(
                                  fontSize: 18,
                                  color: constant.secondaryColor,
                                  fontWeight: FontWeight.bold),),SizedBox(height: 30,),
          Image.asset("assets/imgs/notification.png",height: 292,),SizedBox(height: 12,),
          Text("No Notification Found",style: TextStyle(
                                  fontSize: 14,
                                  color: constant.secondaryColor,
                                  fontWeight: FontWeight.bold)),SizedBox(height: 12,),
          Text("Keep Exploring Spice Safari and Contributing",style: TextStyle(
                                  fontSize: 12,
                                  color: constant.secondaryColor,
                                  ))
          ],),
      ) ,
    );
  }
}