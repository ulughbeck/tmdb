import 'package:tmdb_api/src/api_client.dart';
import 'package:tmdb_api/src/models/models.dart';

void main() {
  final api = TmdbApiCLient('API_KEY');
  final movies = api.discover(
    sortBy: TmDbSortBy.popularity,
    sortMethod: TmdbSortMethod.desc,
  );
}
