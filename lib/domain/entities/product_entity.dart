import 'package:equatable/equatable.dart';

class ProductEntity extends Equatable {
  final String brand;
  final String model;
  final int price;

  const ProductEntity({required this.brand, required this.model, required this.price});

  @override
  List<Object> get props => [brand, model, price];
}
