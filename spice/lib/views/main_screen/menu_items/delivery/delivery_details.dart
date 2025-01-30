import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spice/views/widget/constant.dart';

class DeliveryDetails extends StatefulWidget {
  const DeliveryDetails({super.key});

  @override
  State<DeliveryDetails> createState() => _DeliveryDetailsState();
}

class _DeliveryDetailsState extends State<DeliveryDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width * 0.9,
        height: MediaQuery.of(context).size.height,
        margin: EdgeInsets.only(top: 35.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            InkWell(
                onTap: () {
                  Get.back();
                },
                child: Icon(
                  Icons.arrow_back,
                )),
            Row(
              children: [
                Text(
                  "Delivery Details",
                  style: TextStyle(
                    fontSize: 18.0,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              margin: EdgeInsets.only(top: 4, left: 4, right: 4),
              decoration: BoxDecoration(color: AppColor().secondaryColor),
              child: Column(
                children: [
                  Text(
                    "Address",
                    style: TextStyle(
                      fontSize: 18.0,
                    ),
                  ),
                  SizedBox(
                    height: 6,
                  ),
                  Text(
                    "San Francisco, 94107 ",
                    style: TextStyle(
                      fontSize: 18.0,
                    ),
                  ),
                  Text(
                    "511 Grant Avenue, Flat 23B",
                    style: TextStyle(
                      fontSize: 18.0,
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 6,
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              margin: EdgeInsets.only(top: 4, left: 4, right: 4),
              decoration: BoxDecoration(color: AppColor().secondaryColor),
              child: Column(
                children: [
                  SizedBox(
                    height: 6,
                  ),
                  Text(
                    "Contact",
                    style: TextStyle(
                      fontSize: 18.0,
                    ),
                  ),
                  Text(
                    "0300-0000000",
                    style: TextStyle(fontSize: 14.0, color: AppColor().bgColor),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
