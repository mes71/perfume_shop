import 'package:flutter/material.dart';

/// id : 1
/// title : "Hugo"
/// description : "In the beginning, you’ll instantly fall in love with the notes of gooseberry, wild strawberry, and tropical coconut. A few minute later, your senses will be enchanted with intoxicating violet, fresh honey, exotic orchid, and the clean aroma of milk. In the drydown of the composition, you’ll recognise the warm notes of vanilla combined with the sweetness of caramel, clean and warm sandalwood, patchouli, and amber."
/// image : ""
/// bgColor : ""
/// Gender : "Man"
/// size : 250
/// price : 78.3

class ProductModel {
  ProductModel({
    num? id,
    String? title,
    String? description,
    String? image,
    Color? bgColor,
    String? gender,
    num? size,
    num? price,
  }) {
    _id = id;
    _title = title;
    _description = description;
    _image = image;
    _bgColor = bgColor;
    _gender = gender;
    _size = size;
    _price = price;
  }

  ProductModel.fromJson(dynamic json) {
    _id = json['id'];
    _title = json['title'];
    _description = json['description'];
    _image = json['image'];
    _bgColor = json['bgColor'];
    _gender = json['Gender'];
    _size = json['size'];
    _price = json['price'];
  }

  num? _id;
  String? _title;
  String? _description;
  String? _image;
  Color? _bgColor;
  String? _gender;
  num? _size;
  num? _price;

  ProductModel copyWith({
    num? id,
    String? title,
    String? description,
    String? image,
    Color? bgColor,
    String? gender,
    num? size,
    num? price,
  }) =>
      ProductModel(
        id: id ?? _id,
        title: title ?? _title,
        description: description ?? _description,
        image: image ?? _image,
        bgColor: bgColor ?? _bgColor,
        gender: gender ?? _gender,
        size: size ?? _size,
        price: price ?? _price,
      );

  num? get id => _id;

  String? get title => _title;

  String? get description => _description;

  String? get image => _image;

  Color? get bgColor => _bgColor;

  String? get gender => _gender;

  num? get size => _size;

  num? get price => _price;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['title'] = _title;
    map['description'] = _description;
    map['image'] = _image;
    map['bgColor'] = _bgColor;
    map['Gender'] = _gender;
    map['size'] = _size;
    map['price'] = _price;
    return map;
  }
}
