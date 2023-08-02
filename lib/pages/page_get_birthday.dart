import 'package:date_picker_plus/date_picker_plus.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' hide Trans;
import 'package:participant_id/pages/page_get_older_siblings.dart';
import 'package:participant_id/utils/models/personal_information.dart';
import 'package:participant_id/widgets/bottom_button.dart';

import '../utils/const/app_data.dart';
import '../widgets/page_body.dart';

class PageGetBirthday extends StatefulWidget {
  final PersonalInformation pi;

  const PageGetBirthday({super.key, required this.pi});

  @override
  State<PageGetBirthday> createState() => _PageGetBirthdayState();
}

class _PageGetBirthdayState extends State<PageGetBirthday> {
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
            const Text('question_x_of_y').tr(namedArgs: {'x': '3', 'y': '6'}),
      ),
        bottomNavigationBar: BottomButton(
          onPressed:() {
            Get.to(() => PageGetOlderSiblings(pi: pi), transition: Transition.noTransition);
          },
          text: 'next'.tr().toUpperCase(),
          isActive: !(pi.birthDay == null),
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
                  'birthday_question',
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
                      'birthday_explanation',
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
                  child: DatePicker(
                    initialDate: pi.birthDay ?? DateTime(2000, 1, 1),
                    initialPickerType: PickerType.years,
                    minDate: DateTime(1900, 1, 1),
                    maxDate: DateTime.now().subtract(const Duration(days:365*6)),
                    slidersSize: 24 * layoutProperties.textScalingFactor,
                    onDateChanged: (value) {
                      setState(() {
                        pi.birthDay = value;
                      });
                    },
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
