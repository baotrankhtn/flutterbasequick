import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutterbasequick/gen/assets/colors.gen.dart';

import 'bloc/base/app/app_bloc.dart';
import 'bloc/base/locale/locale_bloc.dart';
import 'bloc/base/locale/locale_state.dart';
import 'configs/routes.dart';
import 'configs/service_locator.dart';
import 'gen/assets/fonts.gen.dart';
import 'gen/localization/l10n.dart';
import 'presentation/pages/home/home_page.dart';

final navigatorKey = GlobalKey<NavigatorState>();

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => AppBloc()),
        BlocProvider(create: (context) => LocaleBloc(locator.get())),
      ],
      child: BlocBuilder<LocaleBloc, LocaleState>(
          buildWhen: (previous, current) => previous != current,
          builder: (context, state) {
            return AnnotatedRegion(
              value: _buildSystemTheme(),
              child: MaterialApp(
                title: 'Flutter',
                navigatorKey: navigatorKey,
                debugShowCheckedModeBanner: false,
                theme: _buildAppTheme(context),
                builder: (BuildContext context, Widget? child) {
                  // Prevent system prefered font size
                  Widget fixedFontSizeWidget = MediaQuery(
                    data: MediaQuery.of(context).copyWith(textScaleFactor: 1),
                    child: child!,
                  );

                  // Easy loading
                  fixedFontSizeWidget =
                      EasyLoading.init()(context, fixedFontSizeWidget);

                  return fixedFontSizeWidget;
                },
                localeResolutionCallback: (locale, supportedLocales) {
                  for (var supportedLocale in supportedLocales) {
                    if (supportedLocale.languageCode == locale?.languageCode) {
                      return supportedLocale;
                    }
                  }
                  return supportedLocales.first;
                },
                localizationsDelegates: [
                  S.delegate,
                  GlobalMaterialLocalizations.delegate,
                  GlobalWidgetsLocalizations.delegate,
                  GlobalCupertinoLocalizations.delegate,
                ],
                supportedLocales: S.delegate.supportedLocales,
                locale: state.locale,
                onGenerateRoute: Routes.generateRoute,
                home: _getInitialScreen(),
              ),
            );
          }),
    );
  }

  ///
  /// Theme inside app
  ///
  ThemeData _buildAppTheme(BuildContext context) {
    return ThemeData(
        scaffoldBackgroundColor: ColorName.background,
        primarySwatch: ColorName.primaryMaterial,
        textTheme:
            Theme.of(context).textTheme.apply(fontFamily: FontFamily.sfpro),
        textSelectionTheme:
            const TextSelectionThemeData(cursorColor: Colors.black),
        appBarTheme: Theme.of(context)
            .appBarTheme
            .copyWith(systemOverlayStyle: SystemUiOverlayStyle.dark));
  }

  ///
  /// Theme of OS
  ///
  SystemUiOverlayStyle _buildSystemTheme() {
    return const SystemUiOverlayStyle(
        systemNavigationBarColor: null,
        systemNavigationBarDividerColor: null,
        systemNavigationBarIconBrightness: Brightness.dark,
        statusBarColor: Colors.transparent,
        statusBarBrightness: Brightness.light,
        statusBarIconBrightness: Brightness.dark);
  }

  static Future<void> appRunner() async {
    // Ready to call native code
    WidgetsFlutterBinding.ensureInitialized();

    // IoC
    await setupServiceLocator();

    return runApp(MyApp());
  }

  Widget _getInitialScreen() {
    return HomePage();
  }
}
