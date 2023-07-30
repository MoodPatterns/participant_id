import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:participant_id/utils/models/personal_information.dart';
import 'package:participant_id/widgets/bottom_button.dart';

import '../utils/const/app_data.dart';
import '../widgets/page_body.dart';

class PageGetCallName extends StatefulWidget {
  final PersonalInformation pi;

  const PageGetCallName({super.key, required this.pi});

  @override
  State<PageGetCallName> createState() => _PageGetCallNameState();
}

class _PageGetCallNameState extends State<PageGetCallName> {
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
            const Text('question_x_of_y').tr(namedArgs: {'x': '2', 'y': '6'}),
      ),
        bottomNavigationBar: BottomButton(
          onPressed:() {},
          text: 'next'.tr().toUpperCase(),
          isActive: !(pi.callName == null || pi.callName == ""),
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
                  'call_name_question',
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
                      'call_name_explanation',
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
                  child: TextFormField(
                    initialValue: pi.callName,
                    autofocus: true,
                    decoration: InputDecoration(
                      icon: Icon(MdiIcons.commentAccountOutline),
                      hintText: 'call_name_hint'.tr(),
                      labelText: 'call_name_label'.tr(),
                    ),
                    onChanged: (String? value) {
                      setState(() {
                        pi.callName = value;
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
