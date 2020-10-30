import 'package:flutter/material.dart';

class InfoBadge extends StatelessWidget {
  final String label;
  final String value;
  const InfoBadge({
    Key key,
    this.label,
    this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Column(
        children: [
          Text(
            label,
            style: Theme.of(context).textTheme.headline6,
          ),
          Text(
            value,
            style: Theme.of(context).textTheme.headline5,
          ),
        ],
      );
}
