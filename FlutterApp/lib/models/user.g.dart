// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// Generator: JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) {
  return new User(json['full_name'] as String, json['user_type'] as String);
}

abstract class _$UserSerializerMixin {
  String get name;
  String get type;
  Map<String, dynamic> toJson() =>
      <String, dynamic>{'full_name': name, 'user_type': type};
}
