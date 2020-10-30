import 'package:json_annotation/json_annotation.dart';

part 'tmdb_movie.g.dart';

@JsonSerializable(nullable: false)
class TmdbMovie {
  final int id;

  @JsonKey(name: 'backdrop_path')
  final String backdropPath;

  @JsonKey(name: 'poster_path')
  final String posterPath;

  final String overview;

  @JsonKey(name: 'release_date')
  final DateTime releaseDate;

  @JsonKey(name: 'original_title')
  final String originalTitle;

  @JsonKey(name: 'original_language')
  final String originalLanguage;

  @JsonKey(name: 'vote_average')
  final double voteAverage;

  final double popularity;

  TmdbMovie({
    this.id,
    this.backdropPath,
    this.posterPath,
    this.overview,
    this.releaseDate,
    this.originalTitle,
    this.originalLanguage,
    this.voteAverage,
    this.popularity,
  });

  /// Converts a [Map<String, dynamic>] into a [TmdbMovie] instance.
  factory TmdbMovie.fromJson(Map<String, dynamic> json) =>
      _$TmdbMovieFromJson(json);

  /// Converts a [TmdbMovie] instance into a [Map<String, dynamic>].
  Map<String, dynamic> toJson() => _$TmdbMovieToJson(this);
}
