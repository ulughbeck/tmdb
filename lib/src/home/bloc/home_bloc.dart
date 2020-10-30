import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:tmdb_api/tmdb_api.dart';
import 'package:tmdb_repository/tmdb_repository.dart';

import '../home.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc(this._repository)
      : assert(_repository != null, 'repository missed'),
        super(const HomeState.initial());

  final TmdbRepository _repository;

  @override
  Stream<HomeState> mapEventToState(HomeEvent event) async* {
    if (event is GetPopular) {
      yield* _mapDiscoverEventToState(event, state);
    } else if (event is GetNew) {
      yield* _mapDiscoverEventToState(event, state);
    } else if (event is GetOldest) {
      yield* _mapDiscoverEventToState(event, state);
    } else if (event is GetDetails) {
      yield* _mapGetDetaulsToState(event, state);
    }
  }

  Stream<HomeState> _mapDiscoverEventToState(
    HomeEvent event,
    HomeState state,
  ) async* {
    yield const HomeState.loading();

    try {
      List<TmdbMovie> result;

      if (event is GetPopular) {
        result = await _repository.getMostPopular();
      } else if (event is GetNew) {
        result = await _repository.getMostNew();
      } else if (event is GetOldest) {
        result = await _repository.getMostOld();
      }

      final movies = <Movie>[];

      for (final v in result) {
        movies.add(Movie(
          background: v.backdropPath,
          id: v.id,
          language: v.originalLanguage,
          overview: v.overview,
          poster: v.posterPath,
          releaseDate: v.releaseDate,
          title: v.originalTitle,
          popularity: v.popularity,
          voteAverage: v.voteAverage,
        ));
      }

      yield HomeState.success(movies: movies);
    } on Exception {
      yield const HomeState.failure();
    }
  }

  Stream<HomeState> _mapGetDetaulsToState(
    GetDetails event,
    HomeState state,
  ) async* {
    yield const HomeState.loading();

    try {
      final result = await _repository.getMovieById(event.movie.id);

      final movie = Movie(
        background: result.backdropPath,
        id: result.id,
        language: result.originalLanguage,
        overview: result.overview,
        poster: result.posterPath,
        releaseDate: result.releaseDate,
        title: result.originalTitle,
        popularity: result.popularity,
        voteAverage: result.voteAverage,
      );

      yield HomeState.success(
        movies: state.moviesList,
        movie: movie,
      );
    } on Exception {
      yield const HomeState.failure();
    }
  }
}
