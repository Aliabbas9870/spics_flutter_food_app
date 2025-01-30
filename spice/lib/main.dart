import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:spice/views/splash/splash_view.dart';
import 'package:spice/views/widget/constant.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final AppColor constant = AppColor();
  @override
  Widget build(BuildContext context) {
    
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Spice',
      theme: ThemeData(
       
      
        colorScheme: ColorScheme.fromSeed(seedColor: constant.secondaryColor),
        useMaterial3: true,
         fontFamily: 'InriaSerif',
      ),
      home: SplashView(),
    );
  }
}
