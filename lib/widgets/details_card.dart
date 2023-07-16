
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';

class DetailsCard extends StatelessWidget {
  final double padding;
  final double textScalingFactor;
  final Color colorFrame;
  final IconData icon;
  final String header;
  final TextStyle headerStyle;
  final TextSpan explanation;
  final TextStyle explanationStyle;

  const DetailsCard({super.key, required this.padding, required this.textScalingFactor, required this.colorFrame, required this.icon, required this.header, required this.headerStyle, required this.explanation, required this.explanationStyle});


  @override
  Widget build(BuildContext context) {
    return Card(
    color: colorFrame,
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
                  style: headerStyle,
                  maxFontSize:
                  headerStyle.fontSize!,
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
          child: Center(
            child: AutoSizeText.rich(
              explanation,
              style: explanationStyle,
              textScaleFactor: textScalingFactor,
            ),
          ),
        ),
      ),
    ),
    );
  }

}
