import 'dart:async';
import 'dart:convert';

import 'package:flutter/services.dart';

class Place {
  final String name;
  final double rating;
  final String address;

  Place.fromJson(Map jsonMap) : 
    name = jsonMap['name'],
    rating = jsonMap['rating']?.toDouble() ?? -1.0,
    address = jsonMap['vicinity'];

  String toString() => 'Club: $name';
}

Future<Stream<Place>> getPlaces() async {
  return new Stream.fromFuture(rootBundle.loadString('assets/places.json'))
    .transform(json.decoder)
    .expand((jsonBody) => (jsonBody as Map)['results'])
    .map((jsonPlace) => new Place.fromJson(jsonPlace));
}
