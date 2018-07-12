import 'package:json_annotation/json_annotation.dart';

part 'menuItem.g.dart';

@JsonSerializable()
class MenuItem extends Object with _$MenuItemSerializerMixin {
  @JsonKey(name: 'name')
  final String name;

  @JsonKey(name: 'price')
  final double ownerId;

  @JsonKey(name: 'description')
  final String description;

  MenuItem(this.name, this.description, this.ownerId);

  factory MenuItem.fromJson(Map<String, dynamic> json) => _$MenuItemFromJson(json);
}