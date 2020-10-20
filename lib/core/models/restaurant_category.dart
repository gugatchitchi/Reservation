// imported package
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
// class containing colors
import '../configs/palette.dart';

// ==================================================
// This is the class for restaurant categories
// used in the welcome page. it contains initiation
// of the class and desirialisation of firebase
// snapshot data
// ==================================================
class RestaurantCategory {
  String id;
  String name;
  String img;
  Color color;

  RestaurantCategory({this.id, this.name, this.img, this.color});

  // =========================================
  // Desirialisation of firebase snapshot data.
  // It takes firebase snapshot and returns
  // restaurant category object
  // =========================================
  factory RestaurantCategory.fromFirestore(DocumentSnapshot documentSnapshot) {
    RestaurantCategory category =
        RestaurantCategory.fromJson(documentSnapshot.data());
    category.id = documentSnapshot.id;
    return category;
  }

  // =========================================
  // This helps the code above
  // NOTE: if this object or data structure is changed change this part Also
  // =========================================
  RestaurantCategory.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        img = json['img'],
        color =
            json['red'] != null && json['green'] != null && json['blue'] != null
                ? Color.fromRGBO(json['red'], json['green'], json['blue'], 1)
                : Palette.accent;
}
