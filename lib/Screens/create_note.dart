import 'package:flutter/material.dart';

import '../Service/db_helper.dart';
import '../Style/app_color.dart';
import '../Util/router.dart';

class CreateNote extends StatefulWidget {
  const CreateNote({Key? key}) : super(key: key);

  @override
  State<CreateNote> createState() => _CreateNoteState();
}

class _CreateNoteState extends State<CreateNote> {
  GlobalKey<FormState> key = GlobalKey();
  TextEditingController title = TextEditingController();
  TextEditingController body = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
          backgroundColor: AppColor.primaryColor,
          onPressed: () {
            if (key.currentState!.validate()) {
              ///Save dat to firebase
              DbHelper()
                  .add(title: title.text.trim(), body: body.text.trim())
                  .then((value) {
                ScaffoldMessenger.of(context)
                    .showSnackBar(SnackBar(content: Text(value)));
              });
            }
          },
          label: Text("Save note", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700, color: AppColor.white),)),

      backgroundColor: AppColor.white,

      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColor.white,
        leading: BackButton(color: AppColor.black, ),

        title: Text("Create Note", style: TextStyle(fontWeight: FontWeight.w700, fontSize: 22, color: AppColor.primaryColor),),
      ),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 19, vertical: 20),
              child: Form(
                key: key,
                child: Column(
                  children: [
                    ///Title note
                    TextFormField(

                      controller: title,
                      decoration:  InputDecoration(
                          contentPadding: EdgeInsets.all(8),

                        label: Text('Note title'),
                        labelStyle: TextStyle(fontWeight: FontWeight.w700, fontSize: 16, color: AppColor.black),

                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: AppColor.primaryColor)
                        ),
                        border: OutlineInputBorder(
                            borderSide: BorderSide(color: AppColor.primaryColor)
                        ),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Title is empty';
                        }
                      },
                    ),

                    const SizedBox(height: 30),

                    ///Description
                    ///
                    TextFormField(

                        controller: body,
                        maxLines: 7,
                        minLines: 2,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'body is empty';
                          }
                        },
                        decoration:  InputDecoration(
                          contentPadding: EdgeInsets.all(8),
                            label: const Text('Note body'),
                            labelStyle: TextStyle(fontWeight: FontWeight.w700, fontSize: 16, color: AppColor.black),
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: AppColor.primaryColor)
                            ),
                            border: OutlineInputBorder(
                              borderSide: BorderSide(color: AppColor.primaryColor)
                            ),


                        )
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
