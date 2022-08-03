import 'dart:async';

import 'package:flutter/material.dart';
import 'package:viva_web/locator/service_locator.dart';
import 'package:viva_web/routes/router.dart';
import 'package:viva_web/service/viva_service.dart';

FutureOr<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setup();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Viva web',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.purple,
        pageTransitionsTheme: const PageTransitionsTheme(
          builders: {
            TargetPlatform.iOS: FadeUpwardsPageTransitionsBuilder(),
            TargetPlatform.android: FadeUpwardsPageTransitionsBuilder(),
          },
        ),
      ),
      navigatorKey: navigationKey,
      scaffoldMessengerKey: scaffolKey,
      initialRoute: VivaRoute.login,
      onGenerateRoute: VivaRoute().onGeneratedRoutes,
    );
  }
}
