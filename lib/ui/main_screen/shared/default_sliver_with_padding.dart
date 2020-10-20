import 'package:flutter/material.dart';

class DefaultSliverWithPadding extends StatelessWidget {
  final Widget sliver;
  final double top;
  const DefaultSliverWithPadding({Key key, @required this.sliver, this.top})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: EdgeInsets.only(
        top: top == null ? 0.0 : top,
        left: 20.0,
        right: 20.0,
        bottom: 10.0,
      ),
      sliver: sliver,
    );
  }
}
