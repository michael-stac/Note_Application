import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:notex/Screens/Authentication/google_auth.dart';
import 'package:notex/Screens/home_dart.dart';
import 'package:notex/Util/router.dart';

class SplashScreen extends StatelessWidget {
  SplashScreen({Key? key}) : super(key: key);
  // User? user = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 2), () {
      // nextPageAndRemovePrevious(context, page: const GoogleAuthentication());
      nextPageAndRemovePrevious(context, page: const HomePage());

    });

    return const Scaffold(
      body: Center(
        child: FlutterLogo(
          size: 100,
        ),
      ),
    );
  }
}
