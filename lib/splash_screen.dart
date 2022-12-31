import 'package:flutter/material.dart';
import 'package:notex/Screens/Authentication/google_auth.dart';
import 'package:notex/Util/router.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override

 void initState() {
    super.initState();
    navigate();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FlutterLogo( size: 100,),
      ),
    );
  }

  void navigate() {
    Future.delayed(Duration(seconds: 4), () {
      nextPage(context, page: const GoogleAuthentication());

    } );

  }
}
