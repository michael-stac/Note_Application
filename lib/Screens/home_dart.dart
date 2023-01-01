import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:notex/Screens/Authentication/google_auth.dart';
import 'package:notex/Screens/create_note.dart';
import 'package:notex/Screens/view_notes.dart';
import 'package:notex/Util/router.dart';

import '../Service/auth_service.dart';
import '../Service/db_helper.dart';
import '../Style/app_color.dart';


class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  CollectionReference dbCollection =
  FirebaseFirestore.instance.collection('Notes');

  User? user = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Note app"),
        actions: [
          IconButton(
              onPressed: () {
                AuthClass().logout().then((value) {
                  if (value == 'Sign out') {
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                            builder: (_) => const GoogleAuthentication()),
                            (route) => false);
                  }
                });
              },
              icon: const Icon(Icons.exit_to_app)),
        ],
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: dbCollection.doc(user!.uid).collection('MyNotes').snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasData) {
            if (snapshot.data!.docs.isEmpty) {
              return const Center(
                child: Text("No note added yet !"),
              );
            } else {
              return ListView(
                children: [
                  ...snapshot.data!.docs.map((data) {
                    String title = data.get('title');
                    final time = data.get('time');
                    String body = data.get('body');

                    String id = data.id;

                    return ListTile(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => ViewNote(
                                title: title,
                                body: body,
                                id : id,
                              ),
                            ),
                          );
                        },
                        title: Text(title),
                        subtitle: Text("$time"),
                        trailing: IconButton(
                            onPressed: () {
                              DbHelper().delete(id: id).then((value) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(content: Text(value)));
                              });
                            },
                            icon: const Icon(Icons.delete)),
                        leading: CircleAvatar(
                          backgroundImage: NetworkImage(
                              FirebaseAuth.instance.currentUser!.photoURL!),
                        ));
                  }),
                  const SizedBox(
                    height: 80,
                  )
                ],
              );
            }
          } else if (snapshot.hasError) {
            return const Center(
              child: Text('Error fetching data'),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: AppColor.primaryColor,
          onPressed: () {
           nextPage(context, page: const CreateNote());
          },
          label: Row(
            children: const [ Text("Add note"),Icon(Icons.add),],
          )),
    );
  }
}