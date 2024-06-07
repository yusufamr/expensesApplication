import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  const ChartBar({Key? key, required this.fill}) : super(key: key);
  final double fill;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
          padding: EdgeInsets.all( 4),
          child: FractionallySizedBox(
            child: DecoratedBox(

              decoration: BoxDecoration(borderRadius: BorderRadius.circular(5),
              color: Theme.of(context).colorScheme.onSecondary),

            ),
            heightFactor: fill,
          )),
    );
  }
}
