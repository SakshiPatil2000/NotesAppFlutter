import 'package:flutter/material.dart';
import 'package:to_do/models/note_model.dart';

class CreateNote extends StatefulWidget {
  const CreateNote({super.key, required this.onNewNoteCreated});

  final Function(Note) onNewNoteCreated;

  @override
  State<CreateNote> createState() => _CreateNoteState();
}

class _CreateNoteState extends State<CreateNote> {

  final titleController =TextEditingController();
  final descController =TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const Text('New Note'),
      ),
    body: Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextFormField(
            controller: titleController,
            style: const TextStyle(
            fontSize: 28

            ),
            decoration: const InputDecoration(
              border: InputBorder.none,
              hintText: 'Title'
            ),
          ),
          const SizedBox(height: 11,),
          TextFormField(
            controller: descController,
            style: const TextStyle(
              fontSize: 18

            ),
            decoration: const InputDecoration(
              border: InputBorder.none,
              hintText: 'Description',
            ),

          ),
          const SizedBox(height: 11,),
        ],
      ),
    ),

      floatingActionButton: FloatingActionButton(
        onPressed: (){
          if(titleController.text.isEmpty){
            return ;
          }
          if(descController.text.isEmpty){
            return ;
          }

          final note= Note(
            desc : descController.text,
            title: titleController.text,

          );

          widget.onNewNoteCreated(note);
          Navigator.of(context).pop();

        },child:const Icon(Icons.save),
      ),

    );
  }
}
