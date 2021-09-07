import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

@immutable
class Bar extends Equatable {
  const Bar._({
    required this.name,
    required this.address,
    required this.rating,
    this.isFavorite = false,
  });

  final String name;
  final String address;
  final double rating;
  final bool isFavorite;

  Bar.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        address = json['vicinity'],
        rating = json['rating']?.toDouble() ?? -1.0,
        isFavorite = false;

  Bar copyWith(
      {String? name, String? address, double? rating, bool? isFavorite}) {
    return Bar._(
      name: name ?? this.name,
      address: address ?? this.address,
      rating: rating ?? this.rating,
      isFavorite: isFavorite ?? this.isFavorite,
    );
  }

  @override
  List<Object?> get props => [
        name,
        address,
        rating,
        isFavorite,
      ];
}
