// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'menu.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Menu _$MenuFromJson(Map<String, dynamic> json) {
  return new Menu(
      json['food_type'] as String,
      json['restaurant_id'] as int,
      (json['menu_items'] as List)
          ?.map((e) => e == null
              ? null
              : new MenuItem.fromJson(e as Map<String, dynamic>))
          ?.toList());
}

abstract class _$MenuSerializerMixin {
  String get name;
  int get restaurantId;
  List<MenuItem> get menuItems;
  Map<String, dynamic> toJson() => <String, dynamic>{
        'food_type': name,
        'restaurant_id': restaurantId,
        'menu_items': menuItems
      };
}
