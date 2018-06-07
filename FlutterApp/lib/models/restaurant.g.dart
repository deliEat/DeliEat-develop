// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'restaurant.dart';

// **************************************************************************
// Generator: JsonSerializableGenerator
// **************************************************************************

Restaurant _$RestaurantFromJson(Map<String, dynamic> json) {
  return new Restaurant(
      json['name'] as String, json['estimated_cook_time'] as int);
}

abstract class _$RestaurantSerializerMixin {
  String get name;
  int get estimatedCookTime;
  Map<String, dynamic> toJson() =>
      <String, dynamic>{'name': name, 'estimated_cook_time': estimatedCookTime};
}
