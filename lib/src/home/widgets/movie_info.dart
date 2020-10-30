import 'package:flutter/material.dart';

import '../home.dart';
import 'info_badge.dart';
import 'movie_rating.dart';

class MovieInfo extends StatelessWidget {
  final Movie movie;

  const MovieInfo({
    @required this.movie,
    Key key,
  }) : super(key: key);

  String get releaseDatePrety =>
      '${movie.releaseDate.day}/${movie.releaseDate.month}/${movie.releaseDate.year}';

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Rating(
                  movie.voteAverage,
                  movie.popularity,
                ),
                InfoBadge(
                  label: 'Release',
                  value: releaseDatePrety,
                ),
                InfoBadge(
                  label: 'Language',
                  value: movie.language,
                ),
              ],
            ),
            const Divider(),
            Text(
              'Overview',
              style: Theme.of(context).textTheme.headline6,
            ),
            const SizedBox(height: 10),
            Text(movie.overview),
          ],
        ),
      );
}
