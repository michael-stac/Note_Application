import 'package:flutter/material.dart';
import 'package:notex/Screens/update_note.dart';

class ViewNote extends StatefulWidget {
  ViewNote({Key? key, this.title, this.body, this.id}) : super(key: key);
  String? id;
  String? title;
  String? body;

  @override
  _ViewNoteState createState() => _ViewNoteState();
}

class _ViewNoteState extends State<ViewNote> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('View note'),
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: ListView(
          children: [
            Text(
              widget.title!,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 35),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              widget.body!,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => UpdateNotePage(
                  title: widget.title,
                  body: widget.body,
                  id: widget.id,
                ),
              ),
            );
          },
          label: Row(
            children: const [Text("Edit note"),Icon(Icons.edit), ],
          )),
    );
  }
}