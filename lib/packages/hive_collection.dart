import 'package:hive_flutter/hive_flutter.dart';

// todo: avoid singleton
class HiveStore {
  HiveStore._();
  static final HiveStore _singleton = HiveStore._();
  static HiveStore get instance => _singleton;

  Map<String, Type> collections = {};

  Future<void> initialize() async {
    await Hive.initFlutter();
  }

  // If collection does not exist, it will be created.
  Future<HiveCollectionReference<T>> collection<T extends HiveBaseModel>(
      String collectionName) async {
    final box = await _initialise<T>(collectionName);
    if (!collections.containsKey(collectionName)) {
      collections[collectionName] = T.runtimeType;
    }
    assert(
      collections[collectionName].runtimeType == T.runtimeType,
      'Collection type is not match, previously collection [$collectionName] was saved with [${collections[collectionName].runtimeType}] type, but now is [${T.runtimeType}] type',
    );
    return HiveCollectionReference<T>(collectionName, box);
  }

  Future<Box<T>> _initialise<T>(String collectionName) async {
    return Hive.openBox<T>(collectionName);
  }
}

/// Instead of using [HiveObject] I created [this]
/// Reason is simple, create your own thing to have best control
abstract class HiveBaseModel {
  String get key;
}

/// This is an abstraction Layer on top of Hive [Box]
/// Only expose methods that you need
class HiveCollectionReference<T extends HiveBaseModel> extends HiveQuery<T> {
  final Box<T> _box;

  /// Collection name / identifier
  final String id;

  /// Make sure to call [initialise] after creating this object
  HiveCollectionReference(String collectionName, Box<T> box)
      : id = collectionName,
        _box = box;

  /// Adds new / Overwrites existing.
  Future<HiveDocumentReference<T>> add(T data) async {
    await _box.put(data.key, data);
    return HiveDocumentReference<T>._(_box, data);
  }

  /// convenience method
  Future<Iterable<HiveDocumentReference<T>>> addAll(Iterable<T> data) async {
    await _box.putAll(<String, T>{for (final T t in data) t.key: t});
    // await Future.wait(data.map((e) => _box.put(e.key, e)));
    // await Future.wait([for (final T t in data) _box.put(t.key, t)]);
    return data.map((e) => HiveDocumentReference<T>._(_box, e));
  }

  /// Get Document reference by id
  HiveDocumentReference<T>? doc(String id) {
    final T? data = _box.get(id);
    if (data == null) return null;
    return HiveDocumentReference<T>._(_box, data);
  }

  /// Get Document references
  Iterable<HiveDocumentReference<T>> docs() {
    final Iterable<T> data = _box.values;
    return data.map((e) => HiveDocumentReference<T>._(_box, e));
  }

  bool contains(String id) {
    return _box.containsKey(id);
  }

  // emit list again whenever there is a change in collection
  Stream<Iterable<HiveDocumentReference<T>>> snapshot() {
    return _box.watch().map((event) {
      return docs();
    });
  }

  Iterable<HiveDocumentReference<T>> where(bool Function(T element) test) {
    final values = _box.values.where(test);
    return values.map((e) => HiveDocumentReference<T>._(_box, e));
  }
  // Todo: Late
  // HiveCollectionReference get parent;
  // String get path;
}

/// A Document wrapper around [HiveBaseModel]
/// to provide methods to listen, access and modify data
class HiveDocumentReference<T extends HiveBaseModel> {
  late final Box<T> _box;

  /// document id / hive key
  late final String id;

  HiveDocumentReference._(Box<T> box, T data)
      : id = data.key,
        _box = box;

  /// non nullable when you are sure the document exists
  T get() {
    final data = _box.get(id);
    if (data == null) {
      throw HiveStoreError('Document has been deleted');
    }
    return _box.get(id)!;
  }

  /// Sets data on the document, overwriting any existing data.
  Future<void> set(T data) async {
    return _box.put(data.key, data);
  }

  Future<void> delete() async {
    await _box.delete(id);
  }

  Stream<HiveDocumentReference<T>?> snapshot() {
    return _box.watch(key: id).map((event) {
      if (event.deleted) {
        return null;
      } else {
        return event.value;
      }
    });
  }
  // Todo: later
  // Future<void> update(T data){
  //   final old = _box.get(id);
  //   if(old == null){
  //     throw HiveStoreException('Document does not exist');
  //   }
  //   final newData = old.copywith(data);
  // }

  // HiveCollectionReference collection(String collectionPath);
  // FirebaseFirestore get firestore;
  // HiveCollectionReference get parent;
  // String get path;
  // Stream<HiveDocumentSnapshot> snapshots({bool includeMetadataChanges = false});
}

abstract class HiveQuery<T extends HiveBaseModel> {
  // Iterable<HiveDocumentReference<T>> fetch();
  // HiveQuery<T> where(bool Function(T element) test);

  // HiveDocumentReference<T> doc(String id);
  // Iterable<HiveDocumentReference<T>> docs();
  // Stream<Iterable<HiveDocumentReference<T>>> snapshots();

//   HiveQuery<T> orderBy(Object field, {bool descending = false});
//   HiveQuery<T> limit(int limit);
//   HiveQuery<T> startAfter(List<Object?> values);
//   HiveQuery<T> startAfterDocument(HiveDocumentReference<T> document);
//   HiveQuery<T> startAt(List<Object?> values);
//   HiveQuery<T> startAtDocument(HiveDocumentReference<T> document);
//   HiveQuery<T> endBefore(List<Object?> values);
//   HiveQuery<T> endBeforeDocument(HiveDocumentReference<T> document);
//   HiveQuery<T> endAt(List<Object?> values);
//   HiveQuery<T> endAtDocument(HiveDocumentReference<T> document);
//   HiveQuery<T> limitToLast(int limit);
//   // HiveQuery<T> withConverter<R>(
//   // {FromFirestore<R> fromFirestore, ToFirestore<R> toFirestore});

//   // Future<HiveDocumentReference<T>> get([GetOptions? options]);
//   HiveCollectionReference<T> collection(String collectionPath);
}

class HiveStoreError extends Error {
  final String message;

  HiveStoreError(this.message);

  @override
  String toString() {
    return 'HiveStoreError: $message';
  }
}
