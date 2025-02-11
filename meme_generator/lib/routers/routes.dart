import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:meme_generator/screen/choose_sample/choose_samples.dart';
import 'package:meme_generator/screen/home/home_screen.dart';
import 'package:meme_generator/screen/meme_from_scratch/meme_generator_screen.dart';
import 'package:meme_generator/screen/widgets/app/my_app.dart';
import 'package:meme_generator/screen/widgets/constants.dart';

enum MainRoutes { home, createNew, chooseSample }

String mainRoutesName(MainRoutes name) => switch (name) {
      MainRoutes.home => 'HomeScreen',
      MainRoutes.createNew => 'CreateNewMemeScreen',
      MainRoutes.chooseSample => 'ChooseSampleMemeScreen',
    };

String mainRoutesPath(MainRoutes name) => switch (name) {
      MainRoutes.home => '/home',
      MainRoutes.createNew => '/create_new',
      MainRoutes.chooseSample => '/choose_sample',
    };

class MainNavigation implements MyAppNavigation {
  @override
  final GoRouter router = GoRouter(
    initialLocation: mainRoutesPath(MainRoutes.home),
    navigatorKey: navigatorKey,
    routes: <RouteBase>[
      GoRoute(
        name: mainRoutesName(MainRoutes.home),
        path: mainRoutesPath(MainRoutes.home),
        builder: (BuildContext context, GoRouterState state) {
          return const HomeScreen();
        },
      ),
      GoRoute(
        name: mainRoutesName(MainRoutes.createNew),
        path: mainRoutesPath(MainRoutes.createNew),
        builder: (BuildContext context, GoRouterState state) {
          return const MemeGeneratorScreen();
        },
      ),
      GoRoute(
        name: mainRoutesName(MainRoutes.chooseSample),
        path: mainRoutesPath(MainRoutes.chooseSample),
        builder: (BuildContext context, GoRouterState state) {
          return const ChooseSample();
        },
      ),
    ],
  );
}
