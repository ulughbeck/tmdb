import 'package:tmdb_api/tmdb_api.dart';
import 'package:tmdb_repository/src/repository.dart';

void main() {
  final repo = TmdbRepository(apiClient: TmdbApiCLient('API_KEY'));
  final mostPopularMovies = repo.getMostPopular();
}
