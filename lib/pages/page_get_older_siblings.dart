import 'package:chips_choice/chips_choice.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' hide Trans;
import 'package:participant_id/pages/page_get_long_finger.dart';
import 'package:participant_id/utils/models/personal_information.dart';
import 'package:participant_id/widgets/bottom_button.dart';

import '../utils/const/app_data.dart';
import '../widgets/page_body.dart';

class PageGetOlderSiblings extends StatefulWidget {
  final PersonalInformation pi;

  const PageGetOlderSiblings({super.key, required this.pi});

  @override
  State<PageGetOlderSiblings> createState() => _PageGetOlderSiblingsState();
}

class _PageGetOlderSiblingsState extends State<PageGetOlderSiblings> {
  late PersonalInformation pi;
  late List<String> options;

  @override
  void initState() {
    pi = widget.pi;

    options = [for(var i=0; i<10; i+=1) i.toString()];
    options.add('more'.tr());

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
            const Text('question_x_of_y').tr(namedArgs: {'x': '4', 'y': '6'}),
      ),
        bottomNavigationBar: BottomButton(
          onPressed:() {
            Get.to(() => PageGetLongFinger(pi: pi), transition: Transition.noTransition);
            },
          text: 'next'.tr().toUpperCase(),
          isActive: !(pi.olderSiblings == null),
          theme: theme,
          layoutProperties: layoutProperties,
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
                  'older_siblings_question',
                  style: theme.textTheme.titleLarge,
                  textScaleFactor: layoutProperties.textScalingFactor,
                  textAlign: TextAlign.center,
                ).tr(),
                SizedBox(height: layoutProperties.edgeInsets,),
                Card(
                  color: theme.colorScheme.tertiary,
                  child: Padding(
                    padding: EdgeInsets.all(layoutProperties.edgeInsets),
                    child: Text(
                      'older_siblings_explanation',
                      style: theme.textTheme.labelMedium!.copyWith(color: theme.colorScheme.onTertiary),
                      textScaleFactor: layoutProperties.textScalingFactor,
                      textAlign: TextAlign.center,
                    ).tr(),
                  ),
                ),
                SizedBox(height: layoutProperties.edgeInsets*2,),
                MediaQuery(
                  data: mq.copyWith(
                    textScaleFactor: layoutProperties.textScalingFactor,
                  ),
                  child: ChipsChoice<int>.single(
                    wrapped: true,
                    wrapCrossAlignment: WrapCrossAlignment.center,
                    alignment: WrapAlignment.center,
                    runAlignment: WrapAlignment.center,
                    spacing: layoutProperties.edgeInsets,
                    runSpacing: layoutProperties.edgeInsets,
                    choiceCheckmark: true,
                    choiceStyle: C2ChipStyle.filled(height: 32*layoutProperties.textScalingFactor, padding: EdgeInsets.all(layoutProperties.edgeInsets/2)),
                    value: pi.olderSiblings,
                    onChanged: (val) => setState(() => pi.olderSiblings = val),
                    choiceItems: C2Choice.listFrom<int, String>(
                      source: options,
                      value: (i, v) => i,
                      label: (i, v) => v,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
