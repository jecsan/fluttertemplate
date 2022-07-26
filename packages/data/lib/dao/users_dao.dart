import 'package:drift/drift.dart';

import '../schema.dart';
import 'base_dao.dart';

part 'users_dao.g.dart';

@DriftAccessor(tables: [Users])
class UsersDao extends DatabaseAccessor<MyDatabase>
    with _$UsersDaoMixin, BaseDao<User> {
  UsersDao(MyDatabase attachedDatabase) : super(attachedDatabase);

  @override
  Future addAll(List<User> list) async {
    return await batch((b) {
      b.insertAll(users, list, mode: InsertMode.insertOrReplace);
    });
  }

  @override
  Future<List<User>> getAll() {
    return (select(users)
          ..orderBy([(t) => OrderingTerm(expression: t.fullName)]))
        .get();
  }

  @override
  Future<User?> getById(int id) {
    return (select(users)..where((t) => t.id.equals(id))).getSingleOrNull();
  }

  @override
  Stream<User> streamById(int id) {
    return (select(users)..where((t) => t.id.equals(id))).watchSingle();
  }

  @override
  Future updateItem(User item) {
    return update(users).replace(item);
  }
}
