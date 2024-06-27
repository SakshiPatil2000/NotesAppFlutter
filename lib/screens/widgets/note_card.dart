import 'package:flutter/material.dart';
import 'package:to_do/screens/notes_view.dart';

import '../../models/note_model.dart';

class NoteCard extends StatelessWidget {
  const NoteCard({super.key, required this.note, required this.index, required this.onNoteDeleted});

  final Note note;
  final int index;
   final Function(int) onNoteDeleted;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
            Navigator.of(context).push(MaterialPageRoute(builder: (context) => NotesView(note:note, index: index,onNoteDeleted: onNoteDeleted,)));
      },
      child: Card(
        child: Padding(

          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                note.title,
                style: const TextStyle(
                  fontSize: 20,
                ),

              ),
              const SizedBox(height: 11,),
              Text(
                note.desc,
                style: const TextStyle(
                    fontSize: 20
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 11,),
            ],
          ),

        ),
      ),
    );
  }
}
