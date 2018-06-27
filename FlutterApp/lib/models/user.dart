import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

const customer = 'customer';
const owner = 'owner';

@JsonSerializable()
class User extends Object with _$UserSerializerMixin {
  @JsonKey(name: 'email')
  final String email;

  @JsonKey(name: 'full_name')
  final String name;

  @JsonKey(name: 'id')
  final int id;

  @JsonKey(name: 'phone_number')
  final String phoneNumber;

  @JsonKey(name: 'user_type')
  final String type;

  @JsonKey(name: 'user_id')
  final int userId;

  User(
    this.email,
    this.name,
    this.id,
    this.phoneNumber,
    this.type,
    this.userId,
  );

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}
