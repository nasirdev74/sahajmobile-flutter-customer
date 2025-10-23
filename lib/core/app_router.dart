import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:injectable/injectable.dart';
import 'package:app/presentation/splash/pages/splash_page.dart';
import 'package:app/presentation/product_list/pages/product_list_page.dart';
import 'package:app/presentation/models/confirm_installment_nav_params.dart';
import 'package:app/presentation/installment_plan/pages/installment_plan_page.dart';
import 'package:app/presentation/confirm_installment/pages/confirm_installment_page.dart';

final GlobalKey<NavigatorState> rootNavigator = GlobalKey(debugLabel: 'root');
final GlobalKey<NavigatorState> shellNavigator = GlobalKey(debugLabel: 'shell');

@singleton
class AppRouter {
  static final GoRouter router = GoRouter(
    navigatorKey: rootNavigator,
    initialLocation: SplashPage.route,
    routes: [
      GoRoute(path: SplashPage.route, name: SplashPage.route, builder: (_, _) => const SplashPage()),
      GoRoute(path: ProductListPage.route, name: ProductListPage.route, builder: (_, _) => const ProductListPage()),
      GoRoute(
        path: InstallmentPlanPage.route,
        name: InstallmentPlanPage.route,
        builder: (_, state) => InstallmentPlanPage(productPrice: state.extra as int? ?? 0),
      ),
      GoRoute(
        name: ConfirmInstallmentPage.route,
        path: ConfirmInstallmentPage.route,
        builder: (_, state) => ConfirmInstallmentPage(navParams: state.extra as ConfirmInstallmentNavParams),
      ),
    ],
    errorBuilder: (context, state) => Scaffold(body: Center(child: Text('Error: ${state.error}'))),
  );
}
