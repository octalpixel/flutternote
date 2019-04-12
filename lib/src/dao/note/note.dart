import 'package:meta/meta.dart';

class Note {
  // Note Properties
  String noteId;
  String noteTitle;
  String noteContent;

  Note(
      {@required this.noteId,
      @required this.noteTitle,
      @required this.noteContent});

  Map<String, dynamic> toMap() {
    return {
      'noteId': noteId,
      'noteTitle': noteTitle,
      'noteContent': noteContent
    };
  }
}
