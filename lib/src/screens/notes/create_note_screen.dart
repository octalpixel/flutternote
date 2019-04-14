import 'package:flutter/material.dart';
import 'package:flutternote/src/dao/note/note.dart';
import 'package:flutternote/src/dao/note/note_dao.dart';
import 'package:zefyr/zefyr.dart';

class CreateNoteScreen extends StatefulWidget {
  _CreateNoteScreen createState() => _CreateNoteScreen();
}

class _CreateNoteScreen extends State<CreateNoteScreen> {
  NoteDao noteDao = NoteDao();

  int noteCount = 0;

  ZefyrController _controller;
  FocusNode _focusNode;

  @override
  void initState() {
    final document = new NotusDocument();
    _controller = new ZefyrController(document);
    _focusNode = new FocusNode();
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController titleController = TextEditingController();
    // ZefyrController contentController = ZefyrController();

    // Note tile
    final noteTitle = TextField(
      autofocus: true,
      decoration: InputDecoration(hintText: 'Note Title'),
      onChanged: (title) {
        print('Note title Entered => $title');
      },
      controller: titleController,
    );

    final noteContent = ZefyrField(
      height: 100.0,
      decoration: InputDecoration(hintText: 'Description'),
      controller: _controller,
      focusNode: _focusNode,
      autofocus: false,
      physics: ClampingScrollPhysics(),
    );

    addNote() async {
      Note note = Note(
          noteTitle: titleController.value.toString(),
          noteContent: _controller.document.toJson().toString());
      // await noteDao.insert(note);

    print(note);
      List<Note> notes = await noteDao.getAll();
      print(notes);
      this.setState(() {
        this.noteCount = notes.length;
      });
    }
    return Scaffold(
      appBar: AppBar(title: Text('Example Form')),
      body: ZefyrScaffold(
        child: Container(
          child:Column(
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
            ],
          ) ,
        ),
      ),
    );
  }
}
