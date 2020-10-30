// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../home/home.dart';
import '../root/root_builder.dart';

class Routes {
  static const String appRootBuilder = '/';
  static const String homePage = '/home';
  static const String moviePage = '/movie';
  static const all = <String>{
    appRootBuilder,
    homePage,
    moviePage,
  };
}

class AppRouter extends RouterBase {
  @override
  List<RouteDef> get routes => _routes;
  final _routes = <RouteDef>[
    RouteDef(Routes.appRootBuilder, page: AppRootBuilder),
    RouteDef(Routes.homePage, page: HomePage),
    RouteDef(Routes.moviePage, page: MoviePage),
  ];
  @override
  Map<Type, AutoRouteFactory> get pagesMap => _pagesMap;
  final _pagesMap = <Type, AutoRouteFactory>{
    AppRootBuilder: (data) {
      return MaterialPageRoute<void>(
        builder: (context) => const AppRootBuilder(),
        settings: data,
      );
    },
    HomePage: (data) {
      return MaterialPageRoute<void>(
        builder: (context) => const HomePage(),
        settings: data,
      );
    },
    MoviePage: (data) {
      return MaterialPageRoute<void>(
        builder: (context) => const MoviePage(),
        settings: data,
      );
    },
  };
}
