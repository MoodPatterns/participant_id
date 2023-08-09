import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' hide Trans;
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:participant_id/pages/page_get_mother_maiden_name.dart';
import 'package:participant_id/utils/models/personal_information.dart';
import 'package:participant_id/widgets/bottom_button.dart';

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

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title:
              const Text('question_x_of_y').tr(namedArgs: {'x': '1', 'y': '6'}),
        ),
        bottomNavigationBar: BottomButton(
          onPressed: () {
            Get.to(() => PageGetMotherMaidenName(pi: pi),
                transition: Transition.noTransition);
          },
          text: 'next'.tr().toUpperCase(),
          isActive: !(pi.firstWord == null || pi.firstWord == ""),
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
                    'first_word_question',
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
                        'first_word_explanation',
                        style: theme.textTheme.labelMedium!
                            .copyWith(color: theme.colorScheme.onTertiary),
                        textScaleFactor: layoutProperties.textScalingFactor,
                        textAlign: TextAlign.center,
                      ).tr(),
                    ),
                  ),
                  SizedBox(
                    height: layoutProperties.edgeInsets * 2,
                  ),
                  MediaQuery(
                    data: mq.copyWith(
                      textScaleFactor: layoutProperties.textScalingFactor,
                    ),
                    child: TextFormField(
                      initialValue: pi.firstWord,
                      autofocus: true,
                      decoration: InputDecoration(
                        icon: Icon(MdiIcons.accountVoice),
                        hintText: 'first_word_hint'.tr(),
                        labelText: 'first_word_label'.tr(),
                      ),
                      onChanged: (String? value) {
                        setState(() {
                          pi.firstWord = value;
                        });
                      },
                      onFieldSubmitted: (String? s) {
                        if (!(pi.firstWord == null || pi.firstWord == "")) {
                          Get.to(() => PageGetMotherMaidenName(pi: pi),
                              transition: Transition.noTransition);
                        }
                      },
                    ),
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
