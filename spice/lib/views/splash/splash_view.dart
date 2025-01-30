import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:spice/views/auth/entrance_auth.dart';
import 'package:spice/views/main_screen/home_screen_start.dart';
import 'package:spice/views/widget/constant.dart';

class SplashView extends StatefulWidget {
  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  final AppColor constant = AppColor();

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => AuthChecker()),
      );
    });


  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   Future.delayed(
  //       const Duration(seconds: 3),
  //       () => Navigator.pushReplacement(
  //           context, MaterialPageRoute(builder: (c) => AuthChecker())));
  // }

    return Scaffold(
      backgroundColor: constant.primaryColor,
      body: Center(
        child: Container(
           width: MediaQuery.sizeOf(context).width,
          height: MediaQuery.sizeOf(context).height,
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 120),
                Image.asset("assets/imgs/logo.png"),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class AuthChecker extends StatelessWidget {
  const AuthChecker({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
         return const CircularProgressIndicator();
        }

        if (snapshot.hasData) {
          // User is signed in
          return  HomeScreenStart();
        } else {
          // User is signed out
          return EntranceView();
        }
      },
    );
  }
}