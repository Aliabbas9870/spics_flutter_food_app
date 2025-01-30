import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:spice/views/widget/constant.dart';

class AddItem extends StatefulWidget {
  const AddItem({super.key});

  @override
  State<AddItem> createState() => _AddItemState();
}

class _AddItemState extends State<AddItem> {
  var itemNameController=TextEditingController();
  var priceController=TextEditingController();
  var detailController=TextEditingController();
  final ImagePicker Piker=  ImagePicker();
  File? slectedImage;

Future imagePick()async{
  var image=await Piker.pickImage(source: ImageSource.gallery);

  slectedImage=File(image!.path);
  setState(() {
    
  });
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor().bgColor,
      appBar: AppBar(
          title: Text(
        "Add Item",
        style: TextStyle(
          color: AppColor().secondaryColor,
        ),
      )),
      body: Container(
        child: Column(
          children: [
            Container(
              child: Column(
                children: [
                  Text("Add item images"),
                  Center(
                    child: Container(
                      width: 88,
                      height: 88,
                      child: Icon(Icons.camera_alt),
                    ),
                  ),

                     Container(child: Column(
              
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
              TextField(
                controller: itemNameController,
                decoration: InputDecoration(
                  hintText: "Item Name",
                  border: OutlineInputBorder()),),SizedBox(height: 8.0,),
            
               TextField(
                controller: priceController,
                
                decoration: InputDecoration(
                  hintText: "Price item.",
                  border: OutlineInputBorder()),),SizedBox(height: 8.0,),
                     TextField(
                      controller: detailController,
                minLines: 3, maxLines: 12,
                decoration: InputDecoration(
                  
                  hintText: "Details",
                  border: OutlineInputBorder()),),SizedBox(height: 12.0,),
     

      
            Center(
              child: Container(
                width: 90, height: 46,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                color: AppColor().primaryColor
              
              ),
              child: Center(child: Text("Submit",style:TextStyle(fontSize: 15,fontWeight: FontWeight.bold))),
              ),
            )
            
            ],),)
                     
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
