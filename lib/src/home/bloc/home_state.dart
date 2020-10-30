part of 'home_bloc.dart';

enum HomeStatus { initial, loading, success, failure }

class HomeState extends Equatable {
  const HomeState._({
    this.status = HomeStatus.initial,
    this.moviesList = const [],
    this.details,
  });

  const HomeState.initial() : this._();

  const HomeState.loading() : this._(status: HomeStatus.loading);

  const HomeState.success({
    List<Movie> movies,
    Movie movie,
  }) : this._(
          status: HomeStatus.success,
          moviesList: movies,
          details: movie,
        );

  const HomeState.failure() : this._(status: HomeStatus.failure);

  final HomeStatus status;
  final List<Movie> moviesList;
  final Movie details;

  @override
  List<Object> get props => [status, moviesList];
}
