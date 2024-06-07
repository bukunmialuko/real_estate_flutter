import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:superapp/core/navigation/router/app_router.dart';
import 'package:superapp/core/styling/app_colors.dart';
import 'package:superapp/generated/fonts.gen.dart';
import 'package:superapp/l10n/l10n.dart';

GoRouter appRouter = const AppModuleRouter().createApplicationRouter();

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return MaterialApp.router(
          color: AppColors.darkOrange,
          onGenerateTitle: (context) => context.l10n.appName,
          theme: ThemeData(
            primaryColor: AppColors.darkOrange,
            primaryColorDark: const Color(0xFF1A212A),
            scaffoldBackgroundColor: const Color(0xFFFFFFFF),
            appBarTheme: const AppBarTheme(
              elevation: 0.3,
              backgroundColor: Color(0xFFFFFFFF),
            ),
            fontFamily: FontFamily.euclidCircularA,
          ),
          localizationsDelegates: const [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: AppLocalizations.supportedLocales,
          routeInformationProvider: appRouter.routeInformationProvider,
          routeInformationParser: appRouter.routeInformationParser,
          routerDelegate: appRouter.routerDelegate,
          debugShowCheckedModeBanner: false,
          builder: (_, child) => child!,
        );
      },
    );
  }
}
