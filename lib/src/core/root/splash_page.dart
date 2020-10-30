import 'package:flutter/material.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.movie, size: 88),
            const SizedBox(height: 10),
            Center(
              child: Text(
                'LOADING',
                style: Theme.of(context).textTheme.headline5,
              ),
            ),
          ],
        ),
      );
}
