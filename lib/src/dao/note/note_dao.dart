import 'package:flutternote/src/dao/note/note.dart';
import 'package:flutternote/src/util/database/database_connection.dart';
import 'package:sembast/sembast.dart';

class NoteDao {
  static const String NOTE_STORE_NAME = 'notes';

  final _noteStore = intMapStoreFactory.store(NOTE_STORE_NAME);

  Future<Database> get _db async => await DatabaseConnection.instance.database;

  // Create Note
  Future insert(Note note) async {
    await _noteStore.add(await _db, note.toMap());
  }

  // Get All Notes
  Future<List<Note>> getAll() async {
    final finder = Finder(sortOrders: [SortOrder('createdAt')]);

    final recordSnapshots = await _noteStore.find(await _db, finder: finder);

    return recordSnapshots.map((snapshot) {
      return Note.fromMap(snapshot.value);
    }).toList();
  }
}
