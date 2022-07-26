import 'package:drift/drift.dart';

abstract class BaseDao<T extends DataClass> {
  Future addAll(List<T> list);

  Stream<T?> streamById(int id);

  Future<T?> getById(int id);

  Future updateItem(T item);

  Future<List<T>?> getAll();
}
