import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable()
class User extends Object with _$UserSerializerMixin {
  @JsonKey(name: 'full_name')
  final String name;

  @JsonKey(name: 'user_type')
  final String type;

  User(this.name, this.type);

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}
