import 'package:auto_route/auto_route_annotations.dart';
import 'package:flutter/widgets.dart';

import '../../home/home.dart';
import '../root/root_builder.dart';

export 'package:auto_route/auto_route.dart';

export 'app_router.gr.dart';

@CustomAutoRouter(
  routes: <AutoRoute>[
    MaterialRoute<void>(
      page: AppRootBuilder,
      initial: true,
    ),
    MaterialRoute<void>(
      path: '/home',
      page: HomePage,
    ),
    MaterialRoute<void>(
      path: '/movie',
      page: MoviePage,
    ),
  ],
)
class $AppRouter {}

//
// Utils
//

Future<T> pushNamed<T extends Object>(
  BuildContext context,
  String route, {
  Object arguments,
}) =>
    Navigator.of(context).pushNamed<T>(
      route,
      arguments: arguments,
    );

Future<T> pushAndRemoveAll<T extends Object>(
  BuildContext context,
  String route, {
  Object arguments,
}) =>
    Navigator.of(context).pushNamedAndRemoveUntil<T>(
      route,
      (route) => false,
      arguments: arguments,
    );
