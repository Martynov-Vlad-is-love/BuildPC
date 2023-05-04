// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'admin.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Admin _$AdminFromJson(Map<String, dynamic> json) => Admin(
      json['id'] as int,
      json['login'] as String,
      json['eMail'] as String,
      json['password'] as String,
    );

Map<String, dynamic> _$AdminToJson(Admin instance) => <String, dynamic>{
      'id': instance.id,
      'login': instance.login,
      'eMail': instance.eMail,
      'password': instance.password,
    };
