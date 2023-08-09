import 'dart:math';

import 'package:assorted_layout_widgets/assorted_layout_widgets.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart' hide Trans;
import 'package:participant_id/pages/page_start.dart';
import 'package:qr_flutter/qr_flutter.dart';

import '../utils/const/app_data.dart';
import '../utils/models/participant_id.dart';
import '../utils/models/personal_information.dart';
import '../widgets/bottom_button.dart';
import '../widgets/page_body.dart';

class PageShowId extends StatefulWidget {
  final PersonalInformation pi;

  const PageShowId({super.key, required this.pi});

  @override
  State<PageShowId> createState() => _PageShowIdState();
}

class _PageShowIdState extends State<PageShowId> {
  ParticipantId? id;
  bool isFinished = false;

  @override
  void initState() {
    _getId();
    super.initState();
  }

  @override
  void setState(fn) {
    if (mounted && !isFinished) {
      super.setState(fn);
    }
  }

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);

    final ScrollController scrollController = ScrollController();

    var mq = MediaQuery.of(context);

    var layoutProperties = AppData.layoutProperties(mq.size.width);

    return WillPopScope(
      onWillPop: () async {
        _exit();
        return false;
      },
      child: SafeArea(
        top: false,
        child: Scaffold(
          bottomNavigationBar: BottomButton(
            onPressed: _exit,
            text: 'finish'.tr().toUpperCase(),
            isActive: id != null,
            theme: theme,
            layoutProperties: layoutProperties,
            message: 'please_wait'.tr(),
          ),
          body: Padding(
            padding: EdgeInsets.all(layoutProperties.edgeInsets),
            child: PageBody(
              constraints: BoxConstraints(maxWidth: layoutProperties.maxWidth),
              controller: scrollController,
              child: SingleChildScrollView(
                controller: scrollController,
                child: id == null
                    ? Center(
                        child: SizedBox(
                          width: 100 * layoutProperties.textScalingFactor,
                          height: 100 * layoutProperties.textScalingFactor,
                          child: const FittedBox(
                            fit: BoxFit.contain,
                            child: CircularProgressIndicator(),
                          ),
                        ),
                      )
                    : Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            'your_participant_id_',
                            style: theme.textTheme.titleLarge,
                            textScaleFactor: layoutProperties.textScalingFactor,
                            textAlign: TextAlign.center,
                          ).tr(),
                          SizedBox(height: layoutProperties.edgeInsets),
                          OutlinedButton(
                            style: OutlinedButton.styleFrom(
                              side: BorderSide(
                                  color: theme.primaryColor,
                                  width: 2 * layoutProperties.textScalingFactor),
                            ),
                            onPressed: _copyId,
                            child: Padding(
                              padding:
                                  EdgeInsets.all(layoutProperties.edgeInsets),
                              child: Text(
                                id!.id,
                                textScaleFactor:
                                    layoutProperties.textScalingFactor,
                              ),
                            ),
                          ),
                          SizedBox(height: layoutProperties.edgeInsets * 3),
                          Text(
                            'your_mnemonic_',
                            style: theme.textTheme.titleLarge,
                            textScaleFactor: layoutProperties.textScalingFactor,
                            textAlign: TextAlign.center,
                          ).tr(),
                          SizedBox(height: layoutProperties.edgeInsets),
                          OutlinedButton(
                            style: OutlinedButton.styleFrom(
                              side: BorderSide(
                                  color: theme.primaryColor,
                                  width: 2 * layoutProperties.textScalingFactor),
                            ),
                            onPressed: _copyMnemonic,
                            child: Padding(
                              padding:
                                  EdgeInsets.all(layoutProperties.edgeInsets),
                              child: WrapSuper(
                                  spacing: layoutProperties.edgeInsets,
                                  lineSpacing: layoutProperties.edgeInsets,
                                  alignment: WrapSuperAlignment.center,
                                  children: id!.mnemonic
                                      .split(' ')
                                      .map((w) => Text(w,
                                          textScaleFactor:
                                              layoutProperties.textScalingFactor))
                                      .toList(growable: false)),
                            ),
                          ),
                          SizedBox(height: layoutProperties.edgeInsets * 3),
                          Text(
                            'your_qr_',
                            style: theme.textTheme.titleLarge,
                            textScaleFactor: layoutProperties.textScalingFactor,
                            textAlign: TextAlign.center,
                          ).tr(),
                          SizedBox(height: layoutProperties.edgeInsets),
                          QrImageView(
                            data: id!.id,
                            version: QrVersions.auto,
                            size: [
                              mq.size.width / 2,
                              mq.size.height / 2,
                              200 * layoutProperties.textScalingFactor,
                            ].reduce(min),
                            dataModuleStyle: QrDataModuleStyle(
                              color: theme.colorScheme.secondary,
                            ),
                            eyeStyle: QrEyeStyle(
                              color: theme.colorScheme.secondary,
                              eyeShape: QrEyeShape.square,
                            ),
                            // eyeStyle: QrEyeStyle(
                            //   color: theme.colorScheme.secondary,
                            // ),
                          ),
                        ],
                      ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _exit() {
    isFinished = true;
    Get.offAll(const PageStart(), transition: Transition.fadeIn);
  }

  void _getId() async {
    var id = await widget.pi.getParticipantId();

    setState(() {
      this.id = id;
    });
  }

  void _copyId() async {
    await Clipboard.setData(ClipboardData(text: id!.id));
    if (!mounted) return;
    Get.snackbar('', 'copied_to_clipboard'.tr(), icon: const Icon(Icons.copy));
  }

  void _copyMnemonic() async {
    await Clipboard.setData(ClipboardData(text: id!.mnemonic));
    if (!mounted) return;
    Get.snackbar('', 'copied_to_clipboard'.tr(), icon: const Icon(Icons.copy));
  }
}
