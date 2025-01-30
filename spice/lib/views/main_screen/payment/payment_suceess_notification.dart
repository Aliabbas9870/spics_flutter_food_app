import 'package:flutter/material.dart';

class PaymentSuceessNotification extends StatelessWidget {
  const PaymentSuceessNotification({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width - 10,
        margin: EdgeInsets.only(top: 22),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              SizedBox(
                height: 92,
              ),
              Container(
                  height: 166, child: Image.asset("assets/imgs/sucess.png")),
              SizedBox(
                height: 42,
              ),
              Text(
                "Payment Successful",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 22,
              ),
              Text("Your payment has been successfully\n submitted",
                  textAlign: TextAlign.center,
                  style:
                      TextStyle(fontSize: 17, fontWeight: FontWeight.normal)),
            ],
          ),
        ),
      ),
    );
  }
}
