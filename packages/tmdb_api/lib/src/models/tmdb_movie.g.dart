// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tmdb_movie.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TmdbMovie _$TmdbMovieFromJson(Map<String, dynamic> json) {
  return TmdbMovie(
    id: json['id'] as int,
    backdropPath: json['backdrop_path'] as String,
    posterPath: json['poster_path'] as String,
    overview: json['overview'] as String,
    releaseDate: DateTime.parse(json['release_date'] as String),
    originalTitle: json['original_title'] as String,
    originalLanguage: json['original_language'] as String,
    voteAverage: (json['vote_average'] as num).toDouble(),
    popularity: (json['popularity'] as num).toDouble(),
  );
}

Map<String, dynamic> _$TmdbMovieToJson(TmdbMovie instance) => <String, dynamic>{
      'id': instance.id,
      'backdrop_path': instance.backdropPath,
      'poster_path': instance.posterPath,
      'overview': instance.overview,
      'release_date': instance.releaseDate.toIso8601String(),
      'original_title': instance.originalTitle,
      'original_language': instance.originalLanguage,
      'vote_average': instance.voteAverage,
      'popularity': instance.popularity,
    };
