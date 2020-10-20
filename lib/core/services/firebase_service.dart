// firebas
import 'package:cloud_firestore/cloud_firestore.dart';
// models
import '../models/restaurant_category.dart';

// ======================================
// This class contains all the streaams
// from the firebase
// ======================================
class FirebaseService {
  // Stream of categories
  static Stream<List<RestaurantCategory>> get streamOfRestaurantCategories {
    var ref = FirebaseFirestore.instance.collection('categories');
    return ref.snapshots().map((list) =>
        list.docs.map((doc) => RestaurantCategory.fromFirestore(doc)).toList());
  }
}
