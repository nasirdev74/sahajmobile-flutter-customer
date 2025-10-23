import 'package:json_annotation/json_annotation.dart';
import 'package:app/domain/entities/product_entity.dart';

part 'product_model.g.dart';

@JsonSerializable()
class ProductModel {
  @JsonKey(defaultValue: '')
  final String brand;
  @JsonKey(defaultValue: '')
  final String model;
  @JsonKey(defaultValue: 0)
  final int price;

  const ProductModel({required this.brand, required this.model, required this.price});

  factory ProductModel.fromJson(Map<String, dynamic> json) => _$ProductModelFromJson(json);

  Map<String, dynamic> toJson() => _$ProductModelToJson(this);

  ProductEntity toEntity() => ProductEntity(brand: brand, model: model, price: price);
}
