import 'package:flutter/material.dart';
import 'package:flutternote/src/dao/note/note.dart';
import 'package:flutternote/src/dao/note/note_dao.dart';

class CreateNoteScreen extends StatefulWidget {
  _CreateNoteScreen createState() => _CreateNoteScreen();
}

class _CreateNoteScreen extends State<CreateNoteScreen> {
  NoteDao noteDao = NoteDao();

  int noteCount = 0 ;

  @override
  void initState() {
    
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController titleController = TextEditingController();
    TextEditingController contentController = TextEditingController();

    // Note tile
    final noteTitle = TextField(
      autofocus: true,
      decoration: InputDecoration(hintText: 'Note Title'),
      onChanged: (title) {
        print('Note title Entered => $title');
      },
      controller: titleController,
    );
    final noteContent = TextField(
      decoration: InputDecoration(hintText: 'Note Content'),
      onChanged: (content) {
        print('Note  Content Entered =>  $content');
      },
      controller: contentController,
    );

    addNote() async {
      Note note = Note(
          noteTitle: titleController.value.toString(),
          noteContent: contentController.value.toString());
      await noteDao.insert(note);
    
    List<Note> notes = await noteDao.getAll();
    this.setState((){
      this.noteCount =notes.length;
    });
      
     
    }

    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(top: 24),
        child: Column(
          children: <Widget>[
            noteTitle,
            noteContent,
            new RaisedButton(
              color: Colors.blue,
              textColor: Colors.white,
              child: Text('Add note'),
              onPressed: () {
                print('This was excuted on press');
                addNote();
              },
            ),
            Text('Numbers of notes :  $noteCount')
          ],
        ),
      ),
    );
  }
}
