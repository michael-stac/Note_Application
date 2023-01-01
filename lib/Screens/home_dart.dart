import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:notex/Screens/Authentication/google_auth.dart';
import 'package:notex/Util/router.dart';

import '../Service/auth_service.dart';
import '../Style/app_color.dart';
import 'create_note.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: AppColor.primaryColor,
          onPressed: () {
            nextPage(context, page: const CreateNote());

          }, label: Row(
        children: [
          Text("Add note", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700, color: AppColor.white),),
          SizedBox(width: 6,),
          Icon(Icons.add)
        ],
      )),
      backgroundColor: AppColor.white,
      appBar: AppBar(
        
        automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: AppColor.white,
        title: Text("Welcome Back", style: TextStyle(fontWeight: FontWeight.w700, fontSize: 22, color: AppColor.primaryColor),),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 19),
            child: GestureDetector(
              onTap: () {
                AuthClass().logout().then((value) {
                  if (value == 'Sign out') {
                    nextPageAndRemovePrevious(context, page: const GoogleAuthentication());
                  }
                });

              },
              child: Icon(Icons.logout, size: 30, color: AppColor.black,),
            ),
          )
        ],
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 12),
        child: ListView(
          children: [
            ...List.generate(10, (index) {
              return ListTile(
                title: Text("note title"),
                subtitle: Text("discription"),
                trailing: Icon(Icons.delete, color: AppColor.black,),
                // leading: CircleAvatar(
                //   backgroundImage: NetworkImage(FirebaseAuth.instance.currentUser!.photoURL!),
                // ),
              );
            })
          ],
        ),
      ),
    );
  }
}
