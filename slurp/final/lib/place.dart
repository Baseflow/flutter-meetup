import 'package:flutter/foundation.dart';

@immutable
class Place {
  Place._(this.name, this.address, this.rating);

  final String name;
  final String address;
  final double rating;

  Place.fromJson(Map<String, dynamic> json) :
    name = json['name'],
    address = json['vicinity'],
    rating = json['rating']?.toDouble() ?? -1.0;
}