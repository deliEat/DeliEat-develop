// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'menuItem.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MenuItem _$MenuItemFromJson(Map<String, dynamic> json) {
  return new MenuItem(json['name'] as String, json['description'] as String,
      (json['price'] as num)?.toDouble());
}

abstract class _$MenuItemSerializerMixin {
  String get name;
  double get ownerId;
  String get description;
  Map<String, dynamic> toJson() => <String, dynamic>{
        'name': name,
        'price': ownerId,
        'description': description
      };
}
