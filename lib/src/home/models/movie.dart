import 'package:equatable/equatable.dart';

class Movie extends Equatable {
  final int id;
  final String title;
  final String background;
  final String poster;
  final String overview;
  final DateTime releaseDate;
  final String language;
  final double voteAverage;
  final double popularity;

  const Movie({
    this.id,
    this.title,
    this.background,
    this.poster,
    this.overview,
    this.releaseDate,
    this.language,
    this.voteAverage,
    this.popularity,
  });

  @override
  List<Object> get props => [
        id,
        title,
        background,
        poster,
        overview,
        releaseDate,
        language,
        voteAverage,
        popularity,
      ];
}
