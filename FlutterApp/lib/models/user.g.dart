// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) {
  return new User(
      json['email'] as String,
      json['full_name'] as String,
      json['id'] as int,
      json['phone_number'] as String,
      json['user_type'] as String,
      json['user_id'] as int);
}

abstract class _$UserSerializerMixin {
  String get email;
  String get name;
  int get id;
  String get phoneNumber;
  String get type;
  int get userId;
  Map<String, dynamic> toJson() => <String, dynamic>{
        'email': email,
        'full_name': name,
        'id': id,
        'phone_number': phoneNumber,
        'user_type': type,
        'user_id': userId
      };
}
