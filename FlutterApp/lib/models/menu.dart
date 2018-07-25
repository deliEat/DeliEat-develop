import 'package:json_annotation/json_annotation.dart';
import 'package:DeliEat/models/menuItem.dart';

part 'menu.g.dart';

@JsonSerializable()
class Menu extends Object with _$MenuSerializerMixin {
  @JsonKey(name: 'food_type')
  final String name;

  @JsonKey(name: 'restaurant_id')
  final int restaurantId;

  @JsonKey(name: 'menu_items')
  final List<MenuItem> menuItems;

  Menu(this.name, this.restaurantId, this.menuItems);

  factory Menu.fromJson(Map<String, dynamic> json) => _$MenuFromJson(json);
}