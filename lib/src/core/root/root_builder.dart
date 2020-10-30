import 'package:flutter/material.dart';

import '../../home/home.dart';
import 'splash_page.dart';

class AppRootBuilder extends StatefulWidget {
  const AppRootBuilder({Key key}) : super(key: key);

  @override
  _AppRootBuilderState createState() => _AppRootBuilderState();
}

class _AppRootBuilderState extends State<AppRootBuilder> {
  @override
  Widget build(BuildContext context) {
    // dynamic routing
    return const HomePage();
    return const SplashPage();
  }
}
