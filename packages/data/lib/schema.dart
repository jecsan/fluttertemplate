import 'dart:io';
import 'package:drift/drift.dart';
import 'package:path/path.dart' as p;
import 'package:drift/native.dart';

import 'package:path_provider/path_provider.dart';

part 'schema.g.dart'; //Specify the generated Dart Code Name

class Users extends Table {
  IntColumn get id => integer()();
  TextColumn get fullName => text()();
  TextColumn get mobileNumber => text()();
  TextColumn get email => text()();

  DateTimeColumn get birthDate => dateTime().nullable()();

  Set<Column> get primaryKey => {id};
}

LazyDatabase _openConnection() {
  // the LazyDatabase util lets us find the right location for the file async.
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'db.sqlite'));
    return NativeDatabase(file);
  });
}

//Use 'flutter pub run build_runner build --delete-conflicting-outputs' to generate the DB
@DriftDatabase(tables: [Users])
class MyDatabase extends _$MyDatabase {
  MyDatabase() : super(_openConnection());
  // you should bump this number whenever you change or add a table definition. Migrations
  // are covered later in this readme.
  @override
  int get schemaVersion => 1;
}
