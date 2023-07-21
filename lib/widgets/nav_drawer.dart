import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import '../utils/helper_functions/string_utils.dart';
import 'package:flutter/material.dart';
//import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart' hide Trans;
import 'package:easy_localization/easy_localization.dart';
import 'package:hive/hive.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:participant_id/pages/page_start.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:yaml/yaml.dart';

import '../../utils/const/hive_keys.dart';
import '../enums/nav_drawer_enum.dart';
import '../utils/const/app_data.dart';

class NavDrawer extends StatelessWidget {
  final NavDrawerEnum selected;
  static final _stateBox = Hive.box(HiveKeys.stateFile);

  const NavDrawer({Key? key, required this.selected}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    var mq = MediaQuery.of(context);

    var layoutProperties = AppData.layoutProperties(mq.size.width);

    return Drawer(
      // Add a ListView to the drawer. This ensures the user can scroll
      // through the options in the drawer if there isn't enough vertical
      // space to fit everything.
      child: ListView(
        // Important: Remove any padding from the ListView.
        padding: EdgeInsets.zero,
        children: [
          // SizedBox(
          //   height: 120.0,
          //   child: DrawerHeader(
          //     decoration: BoxDecoration(
          //       border: Border(
          //           bottom: BorderSide(
          //         color: theme.primaryColor,
          //         width: 2.0,
          //       )),
          //       color: theme.highlightColor,
          //     ),
          //     child: SvgPicture.asset('assets/images/onboarding/ekde_logo.svg'),
          //   ),
          // ),
          Padding(
            padding: EdgeInsets.only(right: layoutProperties.edgeInsets),
            child: ListTile(
              title: const Text('home').tr(),
              leading: const Icon(Icons.home),
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                topRight: Radius.circular(50),
                bottomRight: Radius.circular(50),
              )),
              selected: selected == NavDrawerEnum.home,
              selectedTileColor: theme.focusColor,
              onTap: () {
                selected == NavDrawerEnum.home
                    ? Get.back()
                    : Get.offAll(const PageStart(), transition: Transition.rightToLeftWithFade);

              },
            ),
          ),
          Padding(
            padding: EdgeInsets.only(right: layoutProperties.edgeInsets),
            child: ListTile(
              title: const Text('theme').tr(),
              leading: const Icon(Icons.palette_outlined),
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                topRight: Radius.circular(50),
                bottomRight: Radius.circular(50),
              )),
              selected: selected == NavDrawerEnum.theme,
              selectedTileColor: Theme.of(context).focusColor,
              onTap: () {
                // selected == NavDrawerEnum.theme
                //     ? Get.back()
                //     : Get.to(() => const PageTheme(),
                //         transition: Transition.rightToLeftWithFade);
              },
            ),
          ),

          ListTile(
            title: const Text('about').tr(),
            leading: const Icon(Icons.info),
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
              topRight: Radius.circular(50),
              bottomRight: Radius.circular(50),
            )),
            onTap: () {
              //todo
            },
          ),
          ListTile(
            title: const Text('privacy_policy').tr(),
            leading: const Icon(Icons.policy),
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(50),
                  bottomRight: Radius.circular(50),
                )),
            onTap: () {
              //todo
            },
          ),

          Divider(
            height: layoutProperties.edgeInsets,
            thickness: 1,
          ),
          ListTile(
            title: const Text('support').tr(),
            leading: const Icon(Icons.contact_support),
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
              topRight: Radius.circular(50),
              bottomRight: Radius.circular(50),
            )),
            onTap: () {
              contactSupport();
            },
          ),

        ],
      ),
    );
  }


  // var version = "0.0";
  // var pub = await rootBundle.loadString("pubspec.yaml");
  // var yaml = await loadYaml(pub);
  // version = yaml["version"];



  Future<void> contactSupport() async {
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    var body = "device_info".tr();



    if (Platform.isIOS) {
      IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
      body =
          "$body: ${iosInfo.model} ${iosInfo.systemName} ${iosInfo.systemVersion}";
    } else if (Platform.isAndroid) {
      AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
      body =
          "$body: ${androidInfo.device} Android ${androidInfo.version.release}";
    } else {
      var browserInfo = await deviceInfo.webBrowserInfo;
      body =
      "$body: ${browserInfo.platform} ${browserInfo.browserName} ${browserInfo.language}";
    }

    body = "$body v${packageInfo.version}/b${packageInfo.buildNumber} ";

    final Uri emailLaunchUri = Uri(
      scheme: 'mailto',
      path: 'contact@moodpatterns.info',
      query: StringUtils.encodeQueryParameters(<String, String>{
        'subject': 'feedback_'.tr(),
        'body': body //+'\n\n'
      }),
    );

    launchUrl(emailLaunchUri);
  }
}
