import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:app/domain/entities/product_entity.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:app/presentation/widgets/primary_app_bar.dart';
import 'package:app/presentation/product_list/widgets/product_widget.dart';
import 'package:app/presentation/installment_plan/pages/installment_plan_page.dart';

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
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      appBar: const PrimaryAppBar(title: 'Products', actions: [], showLeading: false),
      body: ListView.separated(
        itemCount: productList.length,
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        physics: const AlwaysScrollableScrollPhysics(),
        separatorBuilder: (_, _) => SizedBox(height: 5.w),
        itemBuilder: (context, index) {
          final product = productList[index];
          return ProductWidget(
            product: product,
            onTap: () => context.pushNamed(InstallmentPlanPage.route, extra: product.price),
          );
        },
      ),
    );
  }
}
