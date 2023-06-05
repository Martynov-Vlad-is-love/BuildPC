// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
      json['id'] as int?,
      json['name'] as String,
      json['username'] as String,
      json['email'] as String,
      json['password'] as String?,
      $enumDecode(_$ERoleEnumMap, json['roles']),
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'username': instance.username,
      'email': instance.email,
      'password': instance.password,
      'roles': _$ERoleEnumMap[instance.roles]!,
    };

const _$ERoleEnumMap = {
  ERole.ROLE_USER: 'ROLE_USER',
  ERole.ROLE_ADMIN: 'ROLE_ADMIN',
};
