import 'package:flutter/material.dart';

import '../../core/core.dart';

class TmdbImage extends StatelessWidget {
  final String image;
  final double height;

  const TmdbImage(
    this.image, {
    Key key,
    this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => image == null
      ? SizedBox(
          height: height,
          child: const Center(
            child: Icon(
              Icons.not_interested,
              size: 80,
            ),
          ),
        )
      : SizedBox(
          height: height,
          child: Image.network(
            '$imgEndpoint$image',
            fit: BoxFit.fill,
            loadingBuilder: (context, child, loadingProgress) {
              if (loadingProgress == null) return child;
              return Center(
                child: SizedBox(
                  height: 30,
                  width: 30,
                  child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(
                      Theme.of(context).primaryColor,
                    ),
                  ),
                ),
              );
            },
          ),
        );
}
