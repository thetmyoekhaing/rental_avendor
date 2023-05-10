// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vendor_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Vendor _$VendorFromJson(Map<String, dynamic> json) => Vendor(
      name: json['name'] as String?,
      shopName: json['shop_name'] as String?,
      email: json['email'] as String?,
      phone: json['phone'] as String?,
      joinDate: json['join_date'] as String?,
      address: json['address'] as String?,
      authToken: json['auth_token'] as String?,
      id: json['id'] as String?,
      status: json['status'] as int?,
    );

Map<String, dynamic> _$VendorToJson(Vendor instance) => <String, dynamic>{
      'name': instance.name,
      'shop_name': instance.shopName,
      'email': instance.email,
      'phone': instance.phone,
      'join_date': instance.joinDate,
      'address': instance.address,
      'status': instance.status,
      'auth_token': instance.authToken,
      'id': instance.id,
    };
