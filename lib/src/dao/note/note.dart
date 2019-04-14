import 'package:meta/meta.dart';
import 'package:uuid/uuid.dart';

class Note {
  // Note Properties
  String noteId;
  String noteTitle;
  String noteContent;
  int createdAt;
  int modifiedAt;

  static var uuid = new Uuid();

  Note(
      {this.noteId,
      @required this.noteTitle,
      @required this.noteContent,
      this.createdAt,
      this.modifiedAt}) {
    // Set up default values

    if (noteId == null) {
      noteId = uuid.v4();
    }

    if (createdAt == null) {
      this.createdAt = DateTime.now().millisecondsSinceEpoch;
    }

    if (modifiedAt == null) {
      this.modifiedAt = DateTime.now().millisecondsSinceEpoch;
    }
  }

  Map<String, dynamic> toMap() {
    return {
      'noteId': noteId,
      'noteTitle': noteTitle,
      'noteContent': noteContent,
      'createdAt': this.createdAt
    };
  }

  static Note fromMap(Map<String, dynamic> map) {
    return Note(
        noteId: map['noteId'],
        noteTitle: map['noteTitle'],
        noteContent: map['content'],
        createdAt: map['createdAt'],
        modifiedAt: map['modifiedAt']);
  }
}
