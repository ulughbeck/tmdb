import 'package:meta/meta.dart';
import 'package:tmdb_api/tmdb_api.dart';

/// Thrown when an error occurs in the API client
class TmdbException implements Exception {}

class TmdbRepository {
  final TmdbApiCLient apiClient;

  const TmdbRepository({@required this.apiClient});

  /// Returns [TmdbMovie] with id provided throws a [TmdbException] if an error occurs.
  Future<TmdbMovie> getMovieById(int id) async {
    try {
      final movie = apiClient.getMovieById(id);
      return movie;
    } on Exception {
      throw TmdbException();
    }
  }

  /// Returns [List<TmdbMovie>] of popular movies order descending [TmdbException] if an error occurs.
  Future<List<TmdbMovie>> getMostPopular() async {
    try {
      final movies = apiClient.discover(
        sortBy: TmDbSortBy.popularity,
        sortMethod: TmdbSortMethod.desc,
      );
      return movies;
    } on Exception {
      throw TmdbException();
    }
  }

  /// Returns [List<TmdbMovie>] of popular movies order ascending [TmdbException] if an error occurs.
  Future<List<TmdbMovie>> getLeastPopular() async {
    try {
      final movies = apiClient.discover(
        sortBy: TmDbSortBy.popularity,
        sortMethod: TmdbSortMethod.asc,
      );
      return movies;
    } on Exception {
      throw TmdbException();
    }
  }

  /// Returns [List<TmdbMovie>] of movies order descending by release date [TmdbException] if an error occurs.
  Future<List<TmdbMovie>> getMostNew() async {
    try {
      final movies = apiClient.discover(
        sortBy: TmDbSortBy.release_date,
        sortMethod: TmdbSortMethod.desc,
      );
      return movies;
    } on Exception {
      throw TmdbException();
    }
  }

  /// Returns [List<TmdbMovie>] of movies order ascending by release date [TmdbException] if an error occurs.
  Future<List<TmdbMovie>> getMostOld() async {
    try {
      final movies = apiClient.discover(
        sortBy: TmDbSortBy.release_date,
        sortMethod: TmdbSortMethod.asc,
      );
      return movies;
    } on Exception {
      throw TmdbException();
    }
  }
}
