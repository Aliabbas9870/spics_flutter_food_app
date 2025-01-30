import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spice/views/main_screen/menu_items/delivery/add_address.dart';
import 'package:spice/views/main_screen/order_detail_screen/cancel_orders_screen.dart';
import 'package:spice/views/main_screen/order_detail_screen/confirm_order_place.dart';
import 'package:spice/views/widget/constant.dart';

class OrderFood extends StatelessWidget {
  const OrderFood({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(top: 28),
        padding: EdgeInsets.all(12),
        child: Column
        (
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
           
                SizedBox(height: 20,),
              InkWell(
                    onTap: () {
                      Get.back();
                    },
                    child: Icon(Icons.arrow_back),
                  ),
            Center(
                child: Text(
              "Order Food",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            )),
            SizedBox(
              height: 60,
            ),
            InkWell(
                       onTap: () {
                Get.to(ConfirmOrdersPlace());
              },
              child: Container(
                height: 57,
                decoration: BoxDecoration(
                  color: AppColor().secondaryColor,
                  borderRadius: BorderRadius.circular(13),
                  border: Border.all(),
                ),
                padding:
                    const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
                child: Row(
                  children: [
                    InkWell(
                
                      child: Text(
                        "Place order",
                        style: TextStyle(fontSize: 18, color: AppColor().bgColor),
                      ),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            InkWell(
              onTap: () {
                Get.to(CancelOrdersScreen());
              },
              child: Container(
                height: 57,
                decoration: BoxDecoration(
                  color: AppColor().secondaryColor,
                  borderRadius: BorderRadius.circular(13),
                  border: Border.all(),
                ),
                padding:
                    const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
                child: Row(
                  children: [
                    Text(
                      "Cancel order",
                      style: TextStyle(fontSize: 18, color: AppColor().bgColor),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            InkWell(
              onTap: () {
                Get.to(AddAddress());
              },
              child: Container(
                height: 57,
                decoration: BoxDecoration(
                  color: AppColor().secondaryColor,
                  borderRadius: BorderRadius.circular(13),
                  border: Border.all(),
                ),
                padding:
                    const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
                child: Row(
                  children: [
                    Text(
                      "Delivery details",
                      style: TextStyle(fontSize: 18, color: AppColor().bgColor),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
