import 'package:flutter/material.dart';
import 'package:app/domain/entities/product_entity.dart';

class ProductListPage extends StatefulWidget {
  const ProductListPage({super.key});

  static const route = '/product_list';

  @override
  State<ProductListPage> createState() => _ProductListPageState();
}

class _ProductListPageState extends State<ProductListPage> {
  final List<ProductEntity> productList = [
    const ProductEntity(brand: 'Infinix', model: 'Smart 9 (3+64)', price: 9999.00),
    const ProductEntity(brand: 'Infinix', model: 'Smart 9 HD (4+64)', price: 10299.00),
    const ProductEntity(brand: 'Infinix', model: 'Smart 9 (4+128)', price: 11999.00),
    const ProductEntity(brand: 'Infinix', model: 'Smart 8 (4+64)', price: 10499.00),
    const ProductEntity(brand: 'Infinix', model: 'Hot 30i (4+64)', price: 10499.00),
  ];

  @override
  Widget build(BuildContext context) {
    return const Scaffold(backgroundColor: Colors.indigo);
  }
}
