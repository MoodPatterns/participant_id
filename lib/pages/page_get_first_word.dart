import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:participant_id/utils/models/personal_information.dart';

import '../utils/const/app_data.dart';
import '../widgets/page_body.dart';

class PageGetFirstWord extends StatefulWidget {
  final PersonalInformation pi;

  const PageGetFirstWord({super.key, required this.pi});

  @override
  State<PageGetFirstWord> createState() => _PageGetFirstWordState();
}

class _PageGetFirstWordState extends State<PageGetFirstWord> {
  late PersonalInformation pi;

  @override
  void initState() {
    pi = widget.pi;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);

    final ScrollController scrollController = ScrollController();

    var mq = MediaQuery.of(context);

    var layoutProperties = AppData.layoutProperties(mq.size.width);

    return Scaffold(
      appBar: AppBar(
        title:
            const Text('question_x_of_y').tr(namedArgs: {'x': '1', 'y': '6'}),
      ),
      body: Padding(
        padding: EdgeInsets.all(layoutProperties.edgeInsets),
        child: PageBody(
          constraints: BoxConstraints(maxWidth: layoutProperties.maxWidth),
          controller: scrollController,
          child: SingleChildScrollView(
            controller: scrollController,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  'first_word_question',
                  style: theme.textTheme.titleLarge,
                  textScaleFactor: layoutProperties.textScalingFactor,
                  textAlign: TextAlign.center,
                ).tr(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
