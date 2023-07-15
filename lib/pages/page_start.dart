import 'dart:math';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:participant_id/utils/const/app_data.dart';
import 'package:participant_id/widgets/page_body.dart';

class PageStart extends StatelessWidget {
  const PageStart({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);

    var mq = MediaQuery.of(context);

    var layoutProperties = AppData.layoutProperties(mq.size.width);

    var cardWidth = List<double>.from([
      mq.size.width / 2,
      mq.size.height / 2,
      300 * sqrt(layoutProperties.textScalingFactor)
    ]).reduce(min);

    return Scaffold(
        body: Padding(
      padding: EdgeInsets.all(layoutProperties.edgeInsets),
      child: PageBody(
        child: Column(
          children: [
            TextButton(
                onPressed: () {},
                child: Text(
                  'create_participant_id',
                  style: theme.textTheme.displaySmall,
                  textScaleFactor: layoutProperties.textScalingFactor,
                ).tr()),
            SizedBox(height: layoutProperties.edgeInsets * 2),
            Wrap(
              spacing: layoutProperties.edgeInsets,
              runSpacing: layoutProperties.edgeInsets,
              alignment: WrapAlignment.center,
              children: [
                SizedBox(
                  width: cardWidth,
                  height: cardWidth * 1.34,
                  child: Card(
                      color: theme.primaryColor,
                    child: FlipCard(
                      front: Card(
                        //color: theme.colorScheme.secondary,
                        child: Padding(
                          padding: EdgeInsets.all(layoutProperties.edgeInsets),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                               const Flexible(
                                flex: 3,
                                child: Expanded(
                                  child: FittedBox(
                                      fit: BoxFit.fill, child: Icon(Icons.shield)),
                                ),
                              ),
                              Flexible(
                                flex: 1,
                                child: AutoSizeText(
                                  'secure'.tr(),
                                  style: theme.textTheme.headlineLarge,
                                  maxFontSize:
                                      theme.textTheme.headlineLarge!.fontSize! *
                                          layoutProperties.textScalingFactor,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      back: Card(
                        //color: theme.colorScheme.secondary,
                        child: Center(
                          child: RichText(
                            text: TextSpan(
                              text: 'Hello ',
                              style: DefaultTextStyle.of(context).style,
                              children: const <TextSpan>[
                                TextSpan(
                                    text: 'bold',
                                    style: TextStyle(fontWeight: FontWeight.bold)),
                                TextSpan(text: ' world!'),
                              ],
                            ),
                            textScaleFactor: layoutProperties.textScalingFactor,
                          ),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    ));
  }
}
