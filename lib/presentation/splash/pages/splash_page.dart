import 'package:flutter/material.dart';
import 'package:app/gen/assets.gen.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:app/presentation/installment_plan/pages/installment_plan_page.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  static const route = '/';

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Future.delayed(const Duration(seconds: 1), () {
        context.go(InstallmentPlanPage.route);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color(0xFFf2fcfb),
      body: Padding(
        padding: EdgeInsets.only(top: 50.w),
        child: Center(
          child: SizedBox(
            width: double.infinity,
            child: Assets.logo.image(fit: BoxFit.fitWidth),
          ),
        ),
      ),
    );
  }
}
