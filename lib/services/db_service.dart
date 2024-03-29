import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'dart:async';
import 'package:rxdart/rxdart.dart';
import 'global_service.dart';

class Document<T> {
  final FirebaseFirestore _db = FirebaseFirestore.instance;
  final String path;
  late DocumentReference ref;

  Document({required this.path}) {
    ref = _db.doc(path);
  }

  Future<T> getData() {
    return ref.get().then((v) => GlobalService.models[T](v.data) as T);
  }

  Stream<T> streamData() {
    return ref.snapshots().map((v) => GlobalService.models[T](v.data) as T);
  }

  Future<void> upsert(Map data) {
    return ref.set(Map<String, dynamic>.from(data), SetOptions(merge: true));
  }
}

class Collection<T> {
  final FirebaseFirestore _db = FirebaseFirestore.instance;
  final String path;
  late CollectionReference ref;

  Collection({required this.path}) {
    ref = _db.collection(path);
  }

  Future<List<T>> getData() async {
    var snapshots = await ref.get().then(
          (snapshot) => snapshot.docs
              .map((doc) => GlobalService.models[T](doc.data()) as T)
              .toList(),
        );
    return snapshots;
  }

  Stream<List<T>> streamData() {
    return ref.snapshots().map(
          (list) => list.docs
              .map((doc) => GlobalService.models[T](doc.data()) as T)
              .toList(),
        );
  }
}

class UserData<T> {
  final FirebaseFirestore _db = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final String collection;

  UserData({required this.collection});

  Stream<T?> get documentStream {
    return _auth.authStateChanges().switchMap((user) {
      if (user != null) {
        Document<T> doc = Document<T>(path: '$collection/${user.uid}');
        return doc.streamData();
      } else {
        return Stream<T?>.value(null);
      }
    });
  }

  Future<T?> getDocument() async {
    User? user = _auth.currentUser;

    if (user != null) {
      Document doc = Document<T>(path: '$collection/${user.uid}');
      return doc.getData() as T;
    } else {
      return null;
    }
  }

  Future<void> upsert(Map data) async {
    User? user = _auth.currentUser;
    if (user != null) {
      Document<T> ref = Document(path: '$collection/${user.uid}');
      return ref.upsert(data);
    }
  }
}
