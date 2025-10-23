// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductModel _$ProductModelFromJson(Map<String, dynamic> json) => ProductModel(
  brand: json['brand'] as String? ?? '',
  model: json['model'] as String? ?? '',
  price: (json['price'] as num?)?.toDouble() ?? 0,
);

Map<String, dynamic> _$ProductModelToJson(ProductModel instance) =>
    <String, dynamic>{
      'brand': instance.brand,
      'model': instance.model,
      'price': instance.price,
    };
