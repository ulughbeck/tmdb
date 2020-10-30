import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SearchInput extends StatelessWidget {
  const SearchInput({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => const CupertinoTextField(
        textInputAction: TextInputAction.search,
        prefix: Padding(
          padding: EdgeInsets.all(8),
          child: Icon(
            Icons.search_sharp,
            size: 30,
          ),
        ),
        placeholder: 'Search',
        padding: EdgeInsets.zero,
      );
}
