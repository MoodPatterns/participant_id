import 'dart:math';

import 'package:chips_choice/chips_choice.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' hide Trans;
import 'package:participant_id/enums/long_finger.dart';
import 'package:participant_id/utils/models/personal_information.dart';
import 'package:participant_id/widgets/bottom_button.dart';

import '../utils/const/app_data.dart';
import '../widgets/custom_chip.dart';
import '../widgets/page_body.dart';
import 'page_get_dominant_hand.dart';

class PageGetLongFinger extends StatefulWidget {
  final PersonalInformation pi;

  const PageGetLongFinger({super.key, required this.pi});

  @override
  State<PageGetLongFinger> createState() => _PageGetLongFingerState();
}

class _PageGetLongFingerState extends State<PageGetLongFinger> {
  late PersonalInformation pi;
  final List<FingerSelection> options = <FingerSelection>[];

  @override
  void initState() {
    pi = widget.pi;

    options.addAll([
      FingerSelection('finger_index'.tr(), 'assets/images/misc/longest_index.svg'),
      FingerSelection('finger_equal'.tr(), 'assets/images/misc/longest_equal.svg'),
      FingerSelection('finger_ring'.tr(), 'assets/images/misc/longest_ring.svg'),
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
              const Text('question_x_of_y').tr(namedArgs: {'x': '5', 'y': '6'}),
        ),
        bottomNavigationBar: BottomButton(
          onPressed: () {
            Get.to(() => PageGetDominantHand(pi: pi), transition: Transition.noTransition);
          },
          text: 'next'.tr().toUpperCase(),
          isActive: !(pi.longFinger == null),
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
                    'long_finger_question',
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
                        'long_finger_explanation',
                        style: theme.textTheme.labelMedium!
                            .copyWith(color: theme.colorScheme.onTertiary),
                        textScaleFactor: layoutProperties.textScalingFactor,
                        textAlign: TextAlign.center,
                      ).tr(args: ['finger_equal'.tr()]),
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
                    value: pi.longFinger?.index,
                    onChanged: (val) => setState(() => pi.longFinger = LongFinger.values[val]),
                    choiceItems: C2Choice.listFrom<int, FingerSelection>(
                      source: options,
                      value: (i, v) => i,
                      label: (i, v) => v.label,
                      tooltip: (i, v) => v.assetPath, // this is super hacky
                    ),
                    choiceBuilder: (item, i) {
                      return CustomChip(
                        label: item.label,
                        width: min(mq.size.width/4.5, 120*layoutProperties.textScalingFactor),
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

class FingerSelection {
  final String label;
  final String assetPath;

  FingerSelection(this.label, this.assetPath);
}
