import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spice/views/widget/constant.dart';

class PaymentMethodViw extends StatelessWidget {
  const PaymentMethodViw({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(top: 28),
        padding: EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 20,
            ),
            CircleAvatar(
              backgroundColor: AppColor().primaryColor,
              child: IconButton(
                  onPressed: () {
                    Get.back();
                  },
                  icon: Icon(Icons.arrow_back)),
            ),
            SizedBox(
              height: 12,
            ),
            Center(
                child: Text(
              "Choose Payment Option",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            )),
            SizedBox(
              height: 60,
            ),
            InkWell(
              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  backgroundColor: AppColor().primaryColor,
                  duration: Duration(seconds: 6),
                  content: const Text(
                    "Jazz Cash not enabled right now, please choose another method. It will be available soon.",
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.black,
                    ),
                  ),
                ));
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
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Jazz Cash",
                      style: TextStyle(fontSize: 18, color: AppColor().bgColor),
                    ),
                    Icon(
                      Icons.payment_outlined,
                      color: AppColor().primaryColor,
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            InkWell(
              // Get.to(PaymentSuceessNotification());
              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  backgroundColor: AppColor().primaryColor,
                  duration: Duration(seconds: 6),
                  content: const Text(
                    "Easy Paisa not enabled right now, please choose another method. It will be available soon.",
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.black,
                    ),
                  ),
                ));
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
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Easy Paisa",
                      style: TextStyle(fontSize: 18, color: AppColor().bgColor),
                    ),
                    Icon(
                      Icons.payment_outlined,
                      color: AppColor().primaryColor,
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              height: 57,
              decoration: BoxDecoration(
                color: AppColor().secondaryColor,
                borderRadius: BorderRadius.circular(13),
                border: Border.all(),
              ),
              padding:
                  const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Cash on Delivery",
                    style: TextStyle(fontSize: 18, color: AppColor().bgColor),
                  ),
                  Icon(
                    Icons.payment_outlined,
                    color: AppColor().primaryColor,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
