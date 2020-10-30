part of 'home_bloc.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();
}

class GetPopular extends HomeEvent {
  const GetPopular();

  @override
  List<Object> get props => [];
}

class GetNew extends HomeEvent {
  const GetNew();

  @override
  List<Object> get props => [];
}

class GetOldest extends HomeEvent {
  const GetOldest();

  @override
  List<Object> get props => [];
}

class GetDetails extends HomeEvent {
  final Movie movie;

  const GetDetails(this.movie);

  @override
  List<Object> get props => [movie];
}
