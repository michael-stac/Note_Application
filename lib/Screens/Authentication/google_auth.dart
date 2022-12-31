import 'package:flutter/material.dart';

import '../../Widgets/custom_scoail_button.dart';

class GoogleAuthentication extends StatefulWidget {
  const GoogleAuthentication({Key? key}) : super(key: key);

  @override
  State<GoogleAuthentication> createState() => _GoogleAuthenticationState();
}

class _GoogleAuthenticationState extends State<GoogleAuthentication> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body:   Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SocialButton(

                onTap: () {},

                text: 'Continue with google',
                icon: Image(image: AssetImage("assets/images/google.png"),))
          ],
        ),
      ),
    );
  }
}
