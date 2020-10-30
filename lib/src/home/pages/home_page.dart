import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/core.dart';
import '../home.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    Key key,
  }) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) => DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            elevation: 0,
            centerTitle: true,
            title: const Text('Movie viewer'),
            bottom: TabBar(
              onTap: (index) {
                if (index == 0) {
                  context.bloc<HomeBloc>().add(const GetPopular());
                } else if (index == 1) {
                  context.bloc<HomeBloc>().add(const GetNew());
                } else {
                  context.bloc<HomeBloc>().add(const GetOldest());
                }
              },
              tabs: const [
                Tab(
                  icon: Icon(Icons.star_border),
                  text: 'Popular',
                ),
                Tab(
                  icon: Icon(Icons.new_releases),
                  text: 'Coming',
                ),
                Tab(
                  icon: Icon(Icons.timeline),
                  text: 'Oldest',
                )
              ],
            ),
          ),
          body: BlocBuilder<HomeBloc, HomeState>(
            builder: (context, state) {
              switch (state.status) {
                case HomeStatus.success:
                  final movies = state.moviesList;
                  return _HomeSuccess(movies: movies);
                case HomeStatus.failure:
                  return const _HomeFailure();
                case HomeStatus.initial:
                  return const _HomeInitial();
                case HomeStatus.loading:
                default:
                  return const Center(child: Loader());
              }
            },
          ),
        ),
      );
}

class _HomeSuccess extends StatelessWidget {
  final List<Movie> movies;

  const _HomeSuccess({Key key, this.movies}) : super(key: key);

  @override
  Widget build(BuildContext context) => SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 16),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: SearchInput(),
            ),
            const SizedBox(height: 16),
            PopularGrid(movies: movies),
            const SizedBox(height: 16),
          ],
        ),
      );
}

class _HomeInitial extends StatelessWidget {
  const _HomeInitial({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => const _HomeText(
        'Here you can find the most popular, the most oldest and the upcoming movies',
      );
}

class _HomeFailure extends StatelessWidget {
  const _HomeFailure({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => const _HomeText(
        'Cannot connect to the server 😢, Try later again',
      );
}

class _HomeText extends StatelessWidget {
  final String text;

  const _HomeText(
    this.text, {
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Center(
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.headline6,
        ),
      );
}
