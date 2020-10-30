import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/core.dart';
import '../home.dart';

class PopularGrid extends StatelessWidget {
  final List<Movie> movies;

  const PopularGrid({
    @required this.movies,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Container(
        constraints: const BoxConstraints(maxWidth: 500),
        child: GridView.builder(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: movies.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 0.56,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
          ),
          itemBuilder: (context, index) {
            final movie = movies[index];
            return PopularTile(movie);
          },
        ),
      );
}

class PopularTile extends StatelessWidget {
  final Movie movie;

  const PopularTile(
    this.movie, {
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // ignore: close_sinks
    final bloc = BlocProvider.of<HomeBloc>(context);

    return Material(
      borderRadius: BorderRadius.circular(8),
      child: InkWell(
        onTap: () {
          bloc.add(GetDetails(movie));
          pushNamed(
            context,
            Routes.moviePage,
          );
        },
        borderRadius: BorderRadius.circular(8),
        child: Column(
          children: [
            TmdbImage(
              movie.poster,
              height: 350,
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 6),
              child: Text(
                movie.title,
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
                style: Theme.of(context).textTheme.headline6,
              ),
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
