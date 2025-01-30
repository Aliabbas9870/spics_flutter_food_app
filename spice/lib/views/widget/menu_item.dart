import 'package:flutter/material.dart';

class MenuItem extends StatelessWidget {
  final String imageUrl;
  final String title;
  final VoidCallback onTap;

  const MenuItem({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(left: 2.0),
        child: Container(
          width: 80,
          height: 95,
          child: Column( 
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start, 
            children: [
          
              
                 ClipRRect(
                  borderRadius: BorderRadius.circular(10.0),
                  child: Image.asset(
                    imageUrl, 
                    width: 69.0,
                    height: 59.0,
                    fit: BoxFit.cover,
                  ),
                
              ),
                Center(
                  child: Text(
                  title,
                  style: TextStyle(fontSize: 12),
                              ),
                ),
            
            ],
          ),
        ),
      ),
    );
  }
}
