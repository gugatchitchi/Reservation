import 'package:cloud_firestore/cloud_firestore.dart';

class Category {
  String id;
  String name;
  String img;

  Category({this.id, this.name, this.img});

  Category.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        img = json['img'];

  Map<String, dynamic> toJson() => {
        'name': name,
        'img': img,
      };

  factory Category.fromFirestore(DocumentSnapshot documentSnapshot) {
    Category category = Category.fromJson(documentSnapshot.data());
    category.id = documentSnapshot.id;
    return category;
  }
}
