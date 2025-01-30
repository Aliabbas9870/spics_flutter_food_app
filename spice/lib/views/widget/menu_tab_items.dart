import 'package:flutter/material.dart';
import 'package:spice/views/widget/constant.dart';

class MenuTabItem extends StatelessWidget {
  final String imagePath;
  final String title;
  final String description;
  final String price;
  final VoidCallback onAddPressed;

  const MenuTabItem({
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
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          title,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: AppColor().bgColor,
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(right: 4),
                          decoration: BoxDecoration(
                            color: AppColor().primaryColor,
                            borderRadius: BorderRadius.circular(16)),
                          child: InkWell(
                            
                            onTap: onAddPressed,
                            child:  Icon(Icons.add,size: 28, color:AppColor().bgColor ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 5.0),
                    Text(
                      description,
                      style: TextStyle(
                        fontSize: 12,
                        color: AppColor().bgColor,
                      ),
                    ),
 const SizedBox(height: 8.0),

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
                                  fontSize: 19,
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
            ],
          ),
        ),
      ),
    );
  }
}
