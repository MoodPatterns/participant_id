import 'package:easy_localization/easy_localization.dart';
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
                  style: theme.textTheme.displayMedium,
                  textScaleFactor: layoutProperties.textScalingFactor,
                ).tr())
          ],
        ),
      ),
    ));
  }
}
