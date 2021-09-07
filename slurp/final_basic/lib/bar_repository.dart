import 'dart:convert';

import 'package:flutter/services.dart';

import 'bar.dart';

class BarRepository {
  static Stream<Bar> getPlaces() {
    return Stream.fromFuture(rootBundle.loadString('assets/bars.json'))
        .transform(json.decoder)
        .expand((jsonBody) => (jsonBody as Map)['results'])
        .map((jsonPlace) => Bar.fromJson(jsonPlace));
  }
}
