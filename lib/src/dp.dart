import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tmdb_api/tmdb_api.dart';
import 'package:tmdb_repository/tmdb_repository.dart';

import 'core/core.dart';
import 'home/home.dart';

class DependenciesProvider extends StatelessWidget {
  final Widget child;

  const DependenciesProvider({Key key, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // use provider to provide dependencies
    final repo = TmdbRepository(apiClient: TmdbApiCLient(apiKey));

    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => HomeBloc(repo)..add(const GetPopular()),
        ),
      ],
      child: child,
    );
  }
}
