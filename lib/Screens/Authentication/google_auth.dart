import 'package:flutter/material.dart';
import 'package:notex/Util/router.dart';

import '../../Service/auth_service.dart';
import '../../Widgets/custom_scoail_button.dart';
import '../home_dart.dart';

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

                onTap: () {
                  AuthClass().signInWithGoogle().then((value) => {
                    if(value == 'Success') {
                      nextPageAndRemovePrevious(context, page: const HomePage())
                    } else {
                      showBottomSheet(context: context, builder: (context) {
                        return const Text("Error Occupied");
                      },)
                    }
                  });
                },

                text: 'Continue with google',
                icon: Image(image: AssetImage("assets/images/google.png"),))
          ],
        ),
      ),
    );
  }
}
