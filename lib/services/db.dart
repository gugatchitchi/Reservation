// import 'package:cloud_firestore/cloud_firestore.dart';
// // import 'package:firebase_auth/firebase_auth.dart';
// import 'dart:async';
// import '../models/models.dart';

// class DatabaseService {
//   final FirebaseFirestore _db = FirebaseFirestore.instance;

//   /// Get a stream of a single document
//   Stream<Category> streamHero(String id) {
//     return _db
//         .collection('heroes')
//         .doc(id)
//         .snapshots()
//         .map((snap) => Category.fromMap(snap.data()));
//   }

//   /// Query a subcollection
//   // Stream<List<Weapon>> streamWeapons(FirebaseUser user) {
//   //   var ref = _db.collection('heroes').document(user.uid).collection('weapons');

//   //   return ref.snapshots().map((list) =>
//   //       list.documents.map((doc) => Weapon.fromFirestore(doc)).toList());

//   // }

//   /// Write data
//   // Future<void> createHero(String heroId) {
//   //   return _db.collection('heroes').document(heroId).setData({ /* some data */ });
//   // }

// }
