import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'core/core.dart';
import 'dp.dart';

class App extends StatelessWidget {
  const App({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return DependenciesProvider(
      child: MaterialApp(
        title: 'TMDB',
        theme: DefaultTheme.themeData,
        onGenerateRoute: AppRouter(),
      ),
    );
  }
}
