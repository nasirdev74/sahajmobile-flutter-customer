import 'package:app/di/injector.dart';
import 'package:flutter/material.dart';
import 'package:app/core/settings.dart';
import 'package:app/core/app_router.dart';
import 'package:app/theme/app_theme.dart';
import 'package:app/core/app_constant.dart';
import 'package:app/l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:app/presentation/core/connectivity_monitor.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  configureDependencies();
  runApp(const SahajMobileCustomerApp());
}

class SahajMobileCustomerApp extends StatefulWidget {
  const SahajMobileCustomerApp({super.key});

  @override
  State<SahajMobileCustomerApp> createState() => _SahajMobileCustomerAppState();
}

class _SahajMobileCustomerAppState extends State<SahajMobileCustomerApp> {
  final router = AppRouter.router;
  var locale = const Locale('en', 'US');

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      minTextAdapt: true,
      splitScreenMode: true,
      useInheritedMediaQuery: true,
      designSize: AppSettings.designSize,
      builder: (ctx, _) {
        return MediaQuery(
          data: MediaQueryData.fromView(View.of(context)).copyWith(alwaysUse24HourFormat: false),
          child: MaterialApp.router(
            locale: locale,
            theme: AppTheme.light,
            darkTheme: AppTheme.dark,
            themeMode: ThemeMode.light,
            title: AppConstant.appName,
            debugShowCheckedModeBanner: false,
            routerDelegate: router.routerDelegate,
            supportedLocales: AppLocalizations.supportedLocales,
            routeInformationParser: router.routeInformationParser,
            routeInformationProvider: router.routeInformationProvider,
            localizationsDelegates: AppLocalizations.localizationsDelegates,
            builder: (context, child) => ConnectivityMonitor(child: child ?? const SizedBox.shrink()),
          ),
        );
      },
    );
  }
}
