// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Product _$ProductFromJson(Map<String, dynamic> json) => Product(
      brand: json['brand'] == null
          ? null
          : Brand.fromJson(json['brand'] as Map<String, dynamic>),
      business: (json['business'] as List<dynamic>?)
          ?.map((e) => Business.fromJson(e as Map<String, dynamic>))
          .toList(),
      category: (json['category'] as List<dynamic>?)
          ?.map((e) => CategoryModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      color:
          (json['color'] as List<dynamic>?)?.map((e) => e as String).toList(),
      description: json['description'] as String?,
      durationDate: json['duration_date'] as String?,
      energyComsumption: json['energy_comsumption'] as String?,
      extraDevice: (json['extra_device'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      id: json['_id'] as String?,
      insurenceData: json['insurence_date'] as String?,
      mainThambNail: json['main_thambnail'] == null
          ? null
          : MainThambNail.fromJson(
              json['main_thambnail'] as Map<String, dynamic>),
      multiImages: (json['multi_images'] as List<dynamic>?)
          ?.map((e) => MultiImages.fromJson(e as Map<String, dynamic>))
          .toList(),
      name: json['name'] as String?,
      price: json['price'] as int?,
      productCode: json['product_code'] as String?,
      size: (json['size'] as List<dynamic>?)?.map((e) => e as String).toList(),
    );

Map<String, dynamic> _$ProductToJson(Product instance) => <String, dynamic>{
      '_id': instance.id,
      'name': instance.name,
      'energy_comsumption': instance.energyComsumption,
      'color': instance.color,
      'size': instance.size,
      'extra_device': instance.extraDevice,
      'description': instance.description,
      'main_thambnail': instance.mainThambNail,
      'multi_images': instance.multiImages,
      'price': instance.price,
      'product_code': instance.productCode,
      'brand': instance.brand,
      'category': instance.category,
      'duration_date': instance.durationDate,
      'insurence_date': instance.insurenceData,
      'business': instance.business,
    };

MainThambNail _$MainThambNailFromJson(Map<String, dynamic> json) =>
    MainThambNail(
      id: json['_id'] as String?,
      mediaLink: json['media_link'] as String?,
    );

Map<String, dynamic> _$MainThambNailToJson(MainThambNail instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'media_link': instance.mediaLink,
    };

MultiImages _$MultiImagesFromJson(Map<String, dynamic> json) => MultiImages(
      id: json['_id'] as String?,
      mediaLink: json['media_link'] as String?,
    );

Map<String, dynamic> _$MultiImagesToJson(MultiImages instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'media_link': instance.mediaLink,
    };
