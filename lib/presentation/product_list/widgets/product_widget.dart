import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:app/domain/entities/product_entity.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductWidget extends StatelessWidget {
  const ProductWidget({super.key, required this.product, required this.onTap});

  final ProductEntity product;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final currencyFormatter = NumberFormat.simpleCurrency(decimalDigits: 0, name: 'TK ');

    return Material(
      color: const Color(0xFFF6F5Fa),
      borderRadius: BorderRadius.circular(5.r),
      child: ListTile(
        onTap: onTap,
        subtitle: Text(product.brand),
        title: Text(product.model, style: const TextStyle(fontWeight: FontWeight.bold)),
        trailing: Text(
          currencyFormatter.format(product.price),
          style: const TextStyle(color: Colors.indigo, fontWeight: FontWeight.w600, fontSize: 16),
        ),
      ),
    );
  }
}
