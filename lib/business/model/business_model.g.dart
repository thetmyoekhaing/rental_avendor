// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'business_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Business _$BusinessFromJson(Map<String, dynamic> json) => Business(
      id: json['_id'] as String?,
      address: json['address'] as String?,
      name: json['name'] as String?,
    );

Map<String, dynamic> _$BusinessToJson(Business instance) => <String, dynamic>{
      '_id': instance.id,
      'name': instance.name,
      'address': instance.address,
    };
