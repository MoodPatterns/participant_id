import 'dart:math';

import 'package:assorted_layout_widgets/assorted_layout_widgets.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_remix/flutter_remix.dart';
import 'package:get/get.dart' hide Trans;
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:participant_id/pages/page_get_first_word.dart';
import 'package:participant_id/utils/const/app_data.dart';
import 'package:participant_id/utils/models/personal_information.dart';
import 'package:participant_id/widgets/details_card.dart';
import 'package:participant_id/widgets/page_body.dart';
import 'package:url_launcher/url_launcher.dart';

import '../enums/nav_drawer_enum.dart';
import '../widgets/bottom_button.dart';
import '../widgets/nav_drawer.dart';

// the only reason it needs to be stateful is to show navdrawer  opening
class PageStart extends StatefulWidget {
  const PageStart({super.key});

  @override
  State<PageStart> createState() => _PageStartState();
}

class _PageStartState extends State<PageStart> {
  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);

    final ScrollController scrollController = ScrollController();

    var mq = MediaQuery.of(context);

    var layoutProperties = AppData.layoutProperties(mq.size.width);

    var cardWidth = List<double>.from([
      mq.size.width / 2,
      mq.size.height / 2,
      200 * pow(layoutProperties.textScalingFactor, 0.75)
    ]).reduce(min);

    return Scaffold(
        appBar: AppBar(
          leading: Builder(
            builder: (context) => // Ensure Scaffold is in context
                IconButton(
                    icon: const Icon(Icons.menu),
                    onPressed: () => Scaffold.of(context).openDrawer()),
          ),
          title: const Text("app_name").tr(),
        ),
        drawer: const NavDrawer(
          selected: NavDrawerEnum.home,
        ),
        bottomNavigationBar: BottomButton(
          onPressed: () {
            Get.to(() => PageGetFirstWord(pi: PersonalInformation()));
          },
          text: 'create_participant_id'.tr().toUpperCase(),
          isActive: true,
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
                  TextButton(
                      onPressed: () {
                        Get.to(
                            () => PageGetFirstWord(pi: PersonalInformation()));
                      },
                      child: Text(
                        'create_participant_id',
                        style: theme.textTheme.displaySmall,
                        textScaleFactor: layoutProperties.textScalingFactor,
                        textAlign: TextAlign.center,
                      ).tr()),
                  SizedBox(height: layoutProperties.edgeInsets),
                  Text(
                    'short_description',
                    style: theme.textTheme.titleSmall,
                    textScaleFactor: layoutProperties.textScalingFactor,
                    textAlign: TextAlign.center,
                  ).tr(),
                  SizedBox(height: layoutProperties.edgeInsets),
                  Card(
                    color: theme.colorScheme.secondary,
                    child: Padding(
                      padding: EdgeInsets.all(layoutProperties.edgeInsets),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'its_',
                            style: theme.textTheme.titleLarge!.copyWith(
                                color: theme.colorScheme.onSecondary
                                            .computeLuminance() <
                                        0.5
                                    ? Colors.black
                                    : Colors.white),
                            textScaleFactor: layoutProperties.textScalingFactor,
                          ).tr(),
                          SizedBox(height: layoutProperties.edgeInsets),
                          WrapSuper(
                            spacing: layoutProperties.edgeInsets,
                            lineSpacing: layoutProperties.edgeInsets,
                            alignment: WrapSuperAlignment.center,
                            children: [
                              SizedBox(
                                width: cardWidth,
                                height: cardWidth * 1.34,
                                child: DetailsCard(
                                  padding: layoutProperties.edgeInsets,
                                  theme: theme,
                                  textScalingFactor:
                                      layoutProperties.textScalingFactor,
                                  icon: FlutterRemix.shield_check_line,
                                  header: 'secure'.tr(),
                                  headerStyle: theme.textTheme.headlineLarge!,
                                  explanation: TextSpan(
                                    text: 'md5_explanation'.tr(),
                                    style: theme.textTheme.bodySmall,
                                  ),
                                  explanationStyle: theme.textTheme.bodySmall!,
                                ),
                              ),
                              SizedBox(
                                width: cardWidth,
                                height: cardWidth * 1.34,
                                child: DetailsCard(
                                  padding: layoutProperties.edgeInsets,
                                  theme: theme,
                                  textScalingFactor:
                                      layoutProperties.textScalingFactor,
                                  icon: MdiIcons.incognito,
                                  header: 'anonymous'.tr(),
                                  headerStyle: theme.textTheme.headlineLarge!,
                                  explanation: TextSpan(
                                    text: 'anonymous_explanation'.tr(),
                                    style: theme.textTheme.bodySmall,
                                  ),
                                  explanationStyle: theme.textTheme.bodySmall!,
                                ),
                              ),
                              SizedBox(
                                width: cardWidth,
                                height: cardWidth * 1.34,
                                child: DetailsCard(
                                  padding: layoutProperties.edgeInsets,
                                  theme: theme,
                                  textScalingFactor:
                                  layoutProperties.textScalingFactor,
                                  icon: MdiIcons.repeatVariant,
                                  header: 'reproducible_stable'.tr(),
                                  headerStyle: theme.textTheme.headlineLarge!,
                                  explanation: TextSpan(
                                    text: 'reproducible_stable_explanation'.tr(),
                                    style: theme.textTheme.bodySmall,
                                  ),
                                  explanationStyle: theme.textTheme.bodySmall!,
                                ),
                              ),
                              SizedBox(
                                width: cardWidth,
                                height: cardWidth * 1.34,
                                child: DetailsCard(
                                  padding: layoutProperties.edgeInsets,
                                  theme: theme,
                                  textScalingFactor:
                                      layoutProperties.textScalingFactor,
                                  icon: FlutterRemix.open_source_line,
                                  header: 'open_source'.tr(),
                                  headerStyle: theme.textTheme.headlineLarge!,
                                  explanation: TextSpan(
                                    text: 'open_source_explanation'.tr(),
                                    style: theme.textTheme.bodySmall,
                                    children: [
                                      TextSpan(
                                        text: 'link_to_repository'.tr(),
                                        style: TextStyle(
                                          color: theme.colorScheme.secondary,
                                          decoration: TextDecoration.underline,
                                        ),
                                        recognizer: TapGestureRecognizer()
                                          ..onTap = _launchRepo,
                                      ),
                                    ],
                                  ),
                                  explanationStyle: theme.textTheme.bodySmall!,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ));
  }

  _launchRepo() async {
    Uri url = Uri.parse('https://github.com/MoodPatterns/participant_id');
    if (await launchUrl(url)) {
      await launchUrl(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
