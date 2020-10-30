import 'package:flutter/material.dart';

class Rating extends StatelessWidget {
  final double rating;
  final double popularity;

  const Rating(
    this.rating,
    this.popularity, {
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(
            Icons.star,
            size: 80,
            color: Colors.yellow,
          ),
          const SizedBox(width: 6),
          Column(
            children: [
              Text(
                '$rating/10',
                style: Theme.of(context).textTheme.headline4,
              ),
              Text(
                popularity.toString(),
                style: Theme.of(context).textTheme.headline6,
              ),
            ],
          ),
        ],
      );
}
