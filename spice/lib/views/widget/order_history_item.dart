import 'package:flutter/material.dart';
import 'package:spice/views/widget/constant.dart';

class OrderHistoryItem extends StatelessWidget {
  final String imagePath;
  final String title;
  final String description;
  final String price;
  final VoidCallback onAddPressed;

  const OrderHistoryItem({
    Key? key,
    required this.imagePath,
    required this.title,
    required this.description,
    required this.price,
    required this.onAddPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Container(
        width: MediaQuery.sizeOf(context).height * 0.9,
        height: 115,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4.0),
          color: AppColor().secondaryColor,
        ),
        child: Padding(
          padding: const EdgeInsets.all(3.0),
          child: Row(
            children: [
              Expanded(

                child: Image.asset(imagePath),
              ),
              const SizedBox(width: 3.0),
              Expanded(
                flex: 2,
                child: Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                        SizedBox(height: 9,),
                      Row(
                        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                  
                          Text(
                            title,
                            style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                              color: AppColor().bgColor,
                            ),
                          ),
                                 
                        ],
                      ),
                      const SizedBox(height: 5.0),
                      Text(
                        description,
                        style: TextStyle(
                          fontSize: 11,
                          color: AppColor().bgColor,
                        ),
                      ),
                   const SizedBox(height: 4.0),
                  
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text.rich(
                            TextSpan(
                              children: [
                                TextSpan(
                                  text: "Rs. ",
                                  style: TextStyle(
                                    fontSize: 15,
                                    color: AppColor().bgColor,
                                  ),
                                ),
                                TextSpan(
                                  text: price,
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: AppColor().primaryColor,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
