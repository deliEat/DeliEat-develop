import 'package:json_annotation/json_annotation.dart';

part 'restaurant.g.dart';

@JsonSerializable()
class Restaurant extends Object with _$RestaurantSerializerMixin {
  @JsonKey(name: 'name')
  final String name;

  @JsonKey(name: 'estimated_cook_time')
  final int estimated_cook_time;

  Restaurant(this.name, this.estimated_cook_time);

  factory Restaurant.fromJson(Map<String, dynamic> json) => _$RestaurantFromJson(json);
}
