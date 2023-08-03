import 'package:auto_size_text/auto_size_text.dart';
import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';

class DetailsCard extends StatelessWidget {
  final double padding;
  final ThemeData theme;
  final double textScalingFactor;
  final IconData icon;
  final String header;
  final TextStyle headerStyle;
  final TextSpan explanation;
  final TextStyle explanationStyle;

  const DetailsCard({super.key, required this.padding, required this.theme, required this.textScalingFactor, required this.icon, required this.header, required this.headerStyle, required this.explanation, required this.explanationStyle});

  final MouseCursor cursor = SystemMouseCursors.click;

  @override
  Widget build(BuildContext context) {
    return Card(
    color: theme.primaryColor,
    child: MouseRegion(
      cursor: cursor,
      child: FlipCard(
        front: Card(
          //color: theme.colorScheme.secondary,
          child: Padding(
            padding: EdgeInsets.all(padding),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Flexible(
                  flex: 3,
                    child: FittedBox(
                        fit: BoxFit.fill, child: Icon(icon),),

                ),
                Flexible(
                  flex: 1,
                  child: AutoSizeText(
                    header,
                    textScaleFactor: textScalingFactor,
                    style: theme.textTheme.titleLarge,
                    maxFontSize:
                    theme.textTheme.titleLarge!.fontSize!,
                    textAlign: TextAlign.center,
                  ),
                )
              ],
            ),
          ),
        ),
        back: Card(
          child: Padding(
            padding: EdgeInsets.all(padding),
            child: SingleChildScrollView(
              child: RichText(
                text: explanation,
                textScaleFactor: textScalingFactor,
              ),
            ),
          ),
        ),
      ),
    ),
    );
  }

}
