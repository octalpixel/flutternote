import 'dart:async';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sembast/sembast.dart';
import 'package:sembast/sembast_io.dart';

class DatabaseConnection {
  // Private Constructor
  DatabaseConnection._();

  // Singleton Instance
  static final DatabaseConnection _singletonInstance = DatabaseConnection._();

  // Public Getter for the DatabaseConnection
  static DatabaseConnection get instance => _singletonInstance;

  // Convert synchronous code to asynchronous code
  Completer<Database> _dbOpenCompleter;

  // Sembast Databse Object
  Database _database;

  Future _openDatabase() async {
    final appDocumentDir = await getApplicationDocumentsDirectory();

    final dbPath = join(appDocumentDir.path, 'flutternote.db');

    final database = await databaseFactoryIo.openDatabase(dbPath);

    _dbOpenCompleter.complete(database);
  }

  Future<Database> get database async {
    if (_dbOpenCompleter == null) {
      _dbOpenCompleter = Completer();

      _openDatabase();
    }

    return _dbOpenCompleter.future;
  }
}
