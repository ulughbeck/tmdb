import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/core.dart';
import '../home.dart';

class MoviePage extends StatefulWidget {
  const MoviePage({Key key}) : super(key: key);

  @override
  _MoviePageState createState() => _MoviePageState();
}

class _MoviePageState extends State<MoviePage> {
  @override
  Widget build(BuildContext context) => BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          if (state.status == HomeStatus.failure) {
            return const Scaffold(
              body: Text('Cannot load movie details'),
            );
          }

          if (state.status == HomeStatus.success) {
            final movie = state.details;
            final movieYear = movie.releaseDate.year.toString();

            return Scaffold(
              backgroundColor: Theme.of(context).accentColor,
              appBar: AppBar(
                elevation: 0,
                title: Text('${movie.title} ($movieYear)'),
              ),
              body: SingleChildScrollView(
                child: Column(
                  children: [
                    TmdbImage(
                      movie.background ?? movie.poster,
                      height: 300,
                    ),
                    MovieInfo(movie: movie),
                    const SizedBox(height: 16),
                  ],
                ),
              ),
            );
          }

          return const Scaffold(body: Center(child: Loader()));
        },
      );
}
