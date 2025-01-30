import 'package:flutter/material.dart';
import 'package:spice/views/widget/constant.dart';

class MyCartTabItem extends StatelessWidget {
  final String imagePath;
  final String title;
  final String description;
  final String price;
  final VoidCallback onAddPressed;

  const MyCartTabItem({
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
              const SizedBox(width: 5.0),
              Expanded(
                flex: 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          title,
                          style: TextStyle(
                            fontSize: 15,
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
                                  fontSize: 13,
                                  color: AppColor().bgColor,
                                ),
                              ),
                              TextSpan(
                                text: price,
                                style: TextStyle(
                                  fontSize: 16,
                                  color: AppColor().primaryColor,
                                ),
                              ),
                            ],
                          ),
                        ),
                        // Padding(
                        //   padding: const EdgeInsets.all(8.0),
                        //   child: Container(
                        //     width: 65,
                        //     child: Row(
                        //       children: [
                        //         Container(
                        //           margin: EdgeInsets.only(right: 4),
                        //           decoration: BoxDecoration(),
                        //           child: InkWell(
                        //             onTap: onAddPressed,
                        //             child: Icon(Icons.add,
                        //                 size: 17, color: AppColor().bgColor),
                        //           ),  
                        //         ),
                        //         SizedBox(width: 9),
                        //         // Text("1",style: TextStyle(color: AppColor().bgColor,fontSize:17)),
                                                  
                        //         // SizedBox(width: 13,),
                                                  
                        //         // Container(
                        //         //     margin: EdgeInsets.only(right: 4),
                        //         //     decoration: BoxDecoration(),
                        //         //     child: InkWell(
                        //         //       onTap: onAddPressed,
                        //         //       child: Text("-"  ,style: TextStyle(color: AppColor().bgColor , fontSize:27))
                        //         //     ))
                        //       ],
                        //     ),
                        //   ),
                        // ),
                      
                      
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
