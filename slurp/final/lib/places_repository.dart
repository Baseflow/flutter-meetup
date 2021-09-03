import 'dart:convert';

import 'package:flutter/services.dart';

import 'place.dart';

class PlacesRepository {
 static Stream<Place> getPlaces(String city) {
   return Stream.fromFuture(rootBundle.loadString('assets/places.json'))
       .transform(json.decoder)
       .expand((jsonBody) => (jsonBody as Map)['results'])
       .map((jsonPlace) => new Place.fromJson(jsonPlace));
 }
}
