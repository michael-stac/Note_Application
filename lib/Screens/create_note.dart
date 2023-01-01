import 'package:flutter/material.dart';

import '../Style/app_color.dart';

class CreateNote extends StatefulWidget {
  const CreateNote({Key? key}) : super(key: key);

  @override
  State<CreateNote> createState() => _CreateNoteState();
}

class _CreateNoteState extends State<CreateNote> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.white,

      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColor.white,
        leading: BackButton(color: AppColor.black, ),

        title: Text("Create Note", style: TextStyle(fontWeight: FontWeight.w700, fontSize: 22, color: AppColor.primaryColor),),
      ),
    );
  }
}
