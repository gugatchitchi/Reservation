import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:code/configs/palette.dart';
import 'package:flutter/material.dart';

class Category {
  String id;
  String name;
  String img;
  Color color;

  Category({this.id, this.name, this.img, this.color});

  Category.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        img = json['img'],
        color =
            json['red'] != null && json['green'] != null && json['blue'] != null
                ? Color.fromRGBO(json['red'], json['green'], json['blue'], 1)
                : Palette.accent;

  // Map<String, dynamic> toJson() => {
  //       'name': name,
  //       'img': img,
  //     };

  factory Category.fromFirestore(DocumentSnapshot documentSnapshot) {
    Category category = Category.fromJson(documentSnapshot.data());
    category.id = documentSnapshot.id;
    return category;
  }
}
