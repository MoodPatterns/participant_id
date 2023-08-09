import 'dart:math';

import 'package:chips_choice/chips_choice.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' hide Trans;
import 'package:participant_id/enums/dominant_hand.dart';
import 'package:participant_id/pages/page_show_id.dart';
import 'package:participant_id/utils/models/personal_information.dart';
import 'package:participant_id/widgets/bottom_button.dart';

import '../utils/const/app_data.dart';
import '../widgets/custom_chip.dart';
import '../widgets/page_body.dart';

class PageGetDominantHand extends StatefulWidget {
  final PersonalInformation pi;

  const PageGetDominantHand({super.key, required this.pi});

  @override
  State<PageGetDominantHand> createState() => _PageGetDominantHandState();
}

class _PageGetDominantHandState extends State<PageGetDominantHand> {
  late PersonalInformation pi;
  final List<HandSelection> options = <HandSelection>[];

  @override
  void initState() {
    pi = widget.pi;

    options.addAll([
      HandSelection('hand_left'.tr(), 'assets/images/misc/hand_left.svg'),
      HandSelection('hand_both'.tr(), 'assets/images/misc/hand_both.svg'),
      HandSelection('hand_right'.tr(), 'assets/images/misc/hand_right.svg'),
    ]);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);

    final ScrollController scrollController = ScrollController();

    var mq = MediaQuery.of(context);

    var layoutProperties = AppData.layoutProperties(mq.size.width);

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title:
              const Text('question_x_of_y').tr(namedArgs: {'x': '6', 'y': '6'}),
        ),
        bottomNavigationBar: BottomButton(
          onPressed: () {
            Get.to(() => PageShowId(pi: pi), transition: Transition.noTransition);
          },
          text: 'show_id'.tr().toUpperCase(),
          isActive: !(pi.dominantHand == null),
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
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'dominant_hand_question',
                    style: theme.textTheme.titleLarge,
                    textScaleFactor: layoutProperties.textScalingFactor,
                    textAlign: TextAlign.center,
                  ).tr(),
                  SizedBox(
                    height: layoutProperties.edgeInsets,
                  ),
                  Card(
                    color: theme.colorScheme.tertiary,
                    child: Padding(
                      padding: EdgeInsets.all(layoutProperties.edgeInsets),
                      child: Text(
                        'dominant_hand_explanation',
                        style: theme.textTheme.labelMedium!
                            .copyWith(color: theme.colorScheme.onTertiary),
                        textScaleFactor: layoutProperties.textScalingFactor,
                        textAlign: TextAlign.center,
                      ).tr(args: ['hand_both'.tr()]),
                    ),
                  ),
                  SizedBox(
                    height: layoutProperties.edgeInsets * 2,
                  ),
                  ChipsChoice<int>.single(
                    wrapped: false,
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    choiceStyle: C2ChipStyle.filled(
                        height: 32 * layoutProperties.textScalingFactor,
                        padding:
                            EdgeInsets.all(layoutProperties.edgeInsets / 2)),
                    value: pi.dominantHand?.index,
                    onChanged: (val) => setState(() => pi.dominantHand = DominantHand.values[val]),
                    choiceItems: C2Choice.listFrom<int, HandSelection>(
                      source: options,
                      value: (i, v) => i,
                      label: (i, v) => v.label,
                      tooltip: (i, v) => v.assetPath, // this is super hacky
                    ),
                    choiceBuilder: (item, i) {
                      return CustomChip(
                        label: item.label,
                        width: min(mq.size.width/4, 120*layoutProperties.textScalingFactor),
                        selected: item.selected,
                        onSelect: item.select!,
                        svgPath: item.tooltip!,
                        layoutProperties: layoutProperties,// this is super hacky
                      );
                    },
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class HandSelection {
  final String label;
  final String assetPath;

  HandSelection(this.label, this.assetPath);
}
