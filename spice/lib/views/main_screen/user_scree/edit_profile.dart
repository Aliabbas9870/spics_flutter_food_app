// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:spice/views/widget/constant.dart';

// class EditProfile extends StatefulWidget {
//   const EditProfile({super.key});

//   @override
//   State<EditProfile> createState() => _EditProfileState();
// }

// class _EditProfileState extends State<EditProfile> {
//   final ImagePicker _picker = ImagePicker(); 

//   Future<void> _pickImageFromGallery() async {
//     final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
//     if (image != null) {
//       print("Gallery Image Path: ${image.path}");
    
//     }
//   }

//   Future<void> _captureImageFromCamera() async {
//     final XFile? image = await _picker.pickImage(source: ImageSource.camera);
//     if (image != null) {
//       print("Camera Image Path: ${image.path}");
      
//     }
//   }
//   void _showImageSourceDialog() {
//     showDialog(
//       context: context,
//       builder: (context) {
//         return AlertDialog(
//           title: const Text("Select Image Source"),
//           content: Column(
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               ListTile(
//                 leading: const Icon(Icons.photo_library),
//                 title: const Text("Gallery"),
//                 onTap: () {
//                   Navigator.pop(context);
//                   _pickImageFromGallery(); // Open gallery
//                 },
//               ),
//               ListTile(
//                 leading: const Icon(Icons.camera_alt),
//                 title: const Text("Camera"),
//                 onTap: () {
//                   Navigator.pop(context);
//                   _captureImageFromCamera(); // Open camera
//                 },
//               ),
//             ],
//           ),
//         );
//       },
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: SingleChildScrollView(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.start,
//             children: [
//               InkWell(
//                 onTap: (){
//                   Get.back();
//                 },
//                 child: Icon(Icons.arrow_back_rounded,color: AppColor().secondaryColor,)),
//               const SizedBox(height: 80),
//               Center(
//                 child: InkWell(
//                   onTap: _showImageSourceDialog, // Open dialog on tap
//                   child: Image.asset("assets/imgs/editprof.png"),
//                 ),
//               ),
//               const SizedBox(height: 12),
//              Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 8.0),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     const Text("Name"),
//                     const TextField(),
//                     const SizedBox(height: 5),
//                     const Text("Email"),
//                     const TextField(),
//                     const SizedBox(height: 5),
//                     const Text("Phone"),
//                     const TextField(),
//                     const SizedBox(height: 5),
//                     const Text("Password"),
//                     const TextField(),
//                     const SizedBox(height: 50),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         Container(
//                           width: 130,
//                           height: 45,
//                           decoration: BoxDecoration(
//                             borderRadius: BorderRadius.circular(12),
//                             border: Border.all(color: AppColor().secondaryColor),
//                           ),
//                           child: Center(
//                             child: Text(
//                               "Cancel",
//                               style: TextStyle(
//                                 fontSize: 22,
//                                 color: AppColor().secondaryColor,
//                               ),
//                             ),
//                           ),
//                         ),
//                         const SizedBox(width: 12),
//                         Container(
//                           width: 130,
//                           height: 45,
//                           decoration: BoxDecoration(
//                             borderRadius: BorderRadius.circular(12),
//                             color: AppColor().primaryColor,
//                           ),
//                           child: Center(
//                             child: Text(
//                               "Save",
//                               style: TextStyle(
//                                 fontSize: 22,
//                                 color: AppColor().secondaryColor,
//                               ),
//                             ),
//                           ),
//                         )
//                       ],
//                     ),
//                   ],
//                 ),
//               )
         
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }


import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:spice/views/widget/constant.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  final ImagePicker _picker = ImagePicker();
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Text controllers for user inputs
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _locationController = TextEditingController();

  String? _userImage; // Stores user image path

  Future<void> _pickImageFromGallery() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      setState(() {
        _userImage = image.path;
      });
    }
  }

  Future<void> _captureImageFromCamera() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.camera);
    if (image != null) {
      setState(() {
        _userImage = image.path;
      });
    }
  }

  void _showImageSourceDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Select Image Source"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                leading: const Icon(Icons.photo_library),
                title: const Text("Gallery"),
                onTap: () {
                  Navigator.pop(context);
                  _pickImageFromGallery();
                },
              ),
              ListTile(
                leading: const Icon(Icons.camera_alt),
                title: const Text("Camera"),
                onTap: () {
                  Navigator.pop(context);
                  _captureImageFromCamera();
                },
              ),
            ],
          ),
        );
      },
    );
  }

  Future<void> _loadUserData() async {
    final user = _auth.currentUser;
    if (user != null) {
      final DocumentSnapshot userDoc =
          await _firestore.collection('Users').doc(user.uid).get();

      if (userDoc.exists) {
        setState(() {
          _nameController.text = userDoc['name'] ?? '';
          _emailController.text = userDoc['email'] ?? '';
          _phoneController.text = userDoc['phone'] ?? '';
          _passwordController.text = userDoc['password'] ?? '';
          _locationController.text = userDoc['userLocation'] ?? '';
          _userImage = userDoc['userImage'] ?? '';
        });
      }
    }
  }

  Future<void> _saveUserData() async {
    final user = _auth.currentUser;
    if (user != null) {
      try {
        await _firestore.collection('Users').doc(user.uid).update({
          'name': _nameController.text,
          'email': _emailController.text,
          'phone': _phoneController.text,
          'password': _passwordController.text,
          'userLocation': _locationController.text,
          'userImage': _userImage ?? '',
        });
        Get.snackbar('Success', 'Profile updated successfully!',
            backgroundColor: Colors.green, colorText: Colors.white);
      } catch (e) {
        Get.snackbar('Error', 'Failed to update profile: $e',
            backgroundColor: Colors.red, colorText: Colors.white);
      }
    }
  }

  @override
  void initState() {
    super.initState();
    _loadUserData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              InkWell(
                onTap: () {
                  Get.back();
                },
                child: Icon(
                  Icons.arrow_back_rounded,
                  color: AppColor().secondaryColor,
                ),
              ),
              const SizedBox(height: 40),
              Center(
                child: InkWell(
                  onTap: _showImageSourceDialog,
                  child: _userImage != null
                      ? CircleAvatar(
                          radius: 50,
                          backgroundImage: AssetImage(_userImage!),
                        )
                      : Image.asset("assets/imgs/editprof.png"),
                ),
              ),
              const SizedBox(height: 12),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("Name"),
                    TextField(controller: _nameController),
                    const SizedBox(height: 5),
                    const Text("Email"),
                    TextField(controller: _emailController),
                    const SizedBox(height: 5),
                    const Text("Phone"),
                    TextField(controller: _phoneController),
                    const SizedBox(height: 5),
                    const Text("Password"),
                    TextField(controller: _passwordController),
                    const SizedBox(height: 5),
                    const Text("Location"),
                    TextField(controller: _locationController),
                    const SizedBox(height: 50),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Get.back();
                          },
                          child: Container(
                            width: 130,
                            height: 45,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(color: AppColor().secondaryColor),
                            ),
                            child: Center(
                              child: Text(
                                "Cancel",
                                style: TextStyle(
                                  fontSize: 22,
                                  color: AppColor().secondaryColor,
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 12),
                        GestureDetector(
                          onTap: _saveUserData,
                          child: Container(
                            width: 130,
                            height: 45,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: AppColor().primaryColor,
                            ),
                            child: Center(
                              child: Text(
                                "Save",
                                style: TextStyle(
                                  fontSize: 22,
                                  color: AppColor().secondaryColor,
                                ),
                              ),
                            ),
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