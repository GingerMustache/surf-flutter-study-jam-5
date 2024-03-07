import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:go_router/go_router.dart';
import 'package:meme_generator/i18n/strings.g.dart';
import 'package:meme_generator/screen/widgets/constants.dart';
import 'package:meme_generator/theme/colors.dart';

abstract class MyAppNavigation {
  RouterConfig<RouteMatchList> get router;
}

class MyApp extends StatelessWidget {
  final MyAppNavigation navigation;

  const MyApp({
    Key? key,
    required this.navigation,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      scaffoldMessengerKey: snackbarKey,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
        iconTheme: const IconThemeData(
          color: AppColors.mainWhite,
        ),
      ),
      routerConfig: navigation.router,
      locale: TranslationProvider.of(context).flutterLocale, // use provider
      supportedLocales: AppLocaleUtils.supportedLocales,
      localizationsDelegates: GlobalMaterialLocalizations.delegates,
    );
  }
}
