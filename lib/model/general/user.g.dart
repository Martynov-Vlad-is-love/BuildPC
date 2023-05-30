// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
      json['id'] as int,
      json['name'] as String,
      json['username'] as String,
      json['email'] as String,
      json['password'] as String,
      $enumDecode(_$ERoleEnumMap, json['role']),
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'username': instance.username,
      'email': instance.email,
      'password': instance.password,
      'role': _$ERoleEnumMap[instance.role]!,
    };

const _$ERoleEnumMap = {
  ERole.roleUser: 'roleUser',
  ERole.roleAdmin: 'roleAdmin',
};
