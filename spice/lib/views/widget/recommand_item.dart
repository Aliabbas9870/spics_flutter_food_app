import 'package:flutter/material.dart';

class RecommandItem extends StatelessWidget {
  final String imageUrl;
  final String title;
  final VoidCallback onTap;

  const RecommandItem({
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
        padding: const EdgeInsets.only(left: 6.0),
        child: Container(
          width: 150,
          height: 126,
          child: Column( 
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
      
              ClipRRect(
                borderRadius: BorderRadius.circular(10.0),
                child: Image.asset(
                  imageUrl, // Use Image.asset instead of Image.network
                  width: 109.0,
                  height: 99.0,
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
