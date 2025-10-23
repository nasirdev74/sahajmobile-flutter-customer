import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:injectable/injectable.dart';
import 'package:app/presentation/splash/pages/splash_page.dart';
import 'package:app/presentation/installment_plan/pages/installment_plan_page.dart';

final GlobalKey<NavigatorState> rootNavigator = GlobalKey(debugLabel: 'root');
final GlobalKey<NavigatorState> shellNavigator = GlobalKey(debugLabel: 'shell');

@singleton
class AppRouter {
  static final GoRouter router = GoRouter(
    navigatorKey: rootNavigator,
    initialLocation: SplashPage.route,
    routes: [
      GoRoute(path: SplashPage.route, name: SplashPage.route, builder: (_, _) => const SplashPage()),
      GoRoute(
        path: InstallmentPlanPage.route,
        name: InstallmentPlanPage.route,
        builder: (_, state) => InstallmentPlanPage(orderAmount: state.extra as double? ?? 0),
      ),
    ],
    errorBuilder: (context, state) => Scaffold(body: Center(child: Text('Error: ${state.error}'))),
  );
}
