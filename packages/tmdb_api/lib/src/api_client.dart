import 'dart:convert';

import 'package:http/http.dart' as http;

import '../tmdb_api.dart';

class HttpException implements Exception {}

/// {@template http_request_failure}
/// Thrown if an `http` request returns a non-200 status code.
/// {@endtemplate}
class HttpRequestFailure implements Exception {
  /// {@macro http_request_failure}
  const HttpRequestFailure(this.statusCode);

  /// The status code of the response.
  final int statusCode;
}

/// Thrown if an excepton occurs while decoding the response body.
class JsonDecodeException implements Exception {}

/// Thrown is an error occurs while deserializing the response body.
class JsonDeserializationException implements Exception {}

class TmdbApiCLient {
  TmdbApiCLient(
    this.apiKey, {
    http.Client httpClient,
  }) : _httpClient = httpClient ?? http.Client();

  static const _authority = 'api.themoviedb.org';

  final String apiKey;

  final http.Client _httpClient;

  /// returns movie by ID from TMDB API
  Future<TmdbMovie> getMovieById(int id) async {
    final queryParams = <String, String>{'api_key': apiKey};

    final uri = Uri.https(_authority, '/3/movie/$id', queryParams);

    http.Response response;

    try {
      response = await _httpClient.get(
        uri,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8'
        },
      );

      if (response.statusCode != 200) {
        throw HttpRequestFailure(response.statusCode);
      }
    } on Exception {
      throw HttpException();
    }

    Map<String, dynamic> body;

    try {
      body = json.decode(response.body) as Map<String, dynamic>;
    } on Exception {
      throw JsonDecodeException();
    }

    try {
      final result = TmdbMovie.fromJson(body);
      return result;
    } on Exception {
      throw JsonDeserializationException();
    }
  }

  /// discover movies from TMDB API
  Future<List<TmdbMovie>> discover({
    TmDbSortBy sortBy,
    TmdbSortMethod sortMethod,
  }) async {
    final queryParams = <String, String>{'api_key': apiKey};

    if (sortBy != null && sortMethod != null) {
      final sort =
          '${sortBy.toString().replaceAll('TmDbSortBy.', '')}.${sortMethod.toString().replaceAll('TmdbSortMethod.', '')}';
      queryParams.addAll({'sort_by': sort});
    }

    final uri = Uri.https(_authority, '/3/discover/movie', queryParams);

    http.Response response;

    try {
      response = await _httpClient.get(
        uri,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8'
        },
      );

      if (response.statusCode != 200) {
        throw HttpRequestFailure(response.statusCode);
      }
    } on Exception {
      throw HttpException();
    }

    Map<String, dynamic> body;

    try {
      body = json.decode(response.body) as Map<String, dynamic>;
    } on Exception {
      throw JsonDecodeException();
    }

    try {
      final result = <TmdbMovie>[];

      for (final v in body['results'] as List<dynamic>) {
        result.add(TmdbMovie.fromJson(v as Map<String, dynamic>));
      }

      return result;
    } on Exception {
      throw JsonDeserializationException();
    }
  }
}
