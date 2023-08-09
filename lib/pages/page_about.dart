import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart' hide Trans;
import 'package:get_it/get_it.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:url_launcher/url_launcher.dart';

import '../enums/nav_drawer_enum.dart';
import '../utils/const/app_data.dart';
import '../widgets/nav_drawer.dart';
import '../widgets/page_body.dart';

class PageAbout extends StatelessWidget {

  const PageAbout({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);

    final ScrollController scrollController = ScrollController();

    var mq = MediaQuery.of(context);

    var layoutProperties = AppData.layoutProperties(mq.size.width);

    return SafeArea(
      child: Scaffold(
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
          selected: NavDrawerEnum.about,
        ),
        body: Padding(
          padding: EdgeInsets.all(layoutProperties.edgeInsets),
          child: PageBody(
            constraints: BoxConstraints(maxWidth: layoutProperties.maxWidth),
            controller: scrollController,
            child: SingleChildScrollView(
              controller: scrollController,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(
                    height: 120.0 * layoutProperties.textScalingFactor,
                    child: SvgPicture.asset('assets/images/misc/icon.svg'),
                  ),
                  SizedBox(height: layoutProperties.edgeInsets),
                  Text(
                    'app_name',
                    textScaleFactor: layoutProperties.textScalingFactor,
                    style: theme.textTheme.titleLarge,
                  ).tr(),
                  Text(
                    'version_build_',
                    textScaleFactor: layoutProperties.textScalingFactor,
                    style: theme.textTheme.labelMedium,
                  ).tr(namedArgs: {
                    'v': GetIt.I<PackageInfo>().version,
                    'b': GetIt.I<PackageInfo>().buildNumber
                  }),
                  SizedBox(height: layoutProperties.edgeInsets),
                  Text(
                    '©2023 Bernhard Piskernik',
                    textScaleFactor: layoutProperties.textScalingFactor,
                    style: theme.textTheme.titleSmall,
                  ),
                  SizedBox(height: layoutProperties.edgeInsets * 2),
                  Text(
                    'contact',
                    textScaleFactor: layoutProperties.textScalingFactor,
                    style: theme.textTheme.titleMedium,
                  ).tr(),
                  SizedBox(height: layoutProperties.edgeInsets),
                  Text(
                    'Mood Patterns',
                    textScaleFactor: layoutProperties.textScalingFactor,
                    style: theme.textTheme.labelLarge,
                  ),
                  Text(
                    'Bernhard Piskernik',
                    textScaleFactor: layoutProperties.textScalingFactor,
                    style: theme.textTheme.titleSmall,
                  ),
                  SizedBox(height: layoutProperties.edgeInsets),
                  GestureDetector(
                    onTap: () {
                      launchUrl(Uri(
                        scheme: 'mailto',
                        path: 'contact@moodpatterns.info',
                      ));
                    },
                    child: MouseRegion(
                      cursor: SystemMouseCursors.click,
                      child: Row(
                        children: [
                          const Icon(Icons.email),
                          SizedBox(width: layoutProperties.edgeInsets / 2),
                          Text(
                            'contact@moodpatterns.info',
                            style: theme.textTheme.bodyMedium,
                            textScaleFactor: layoutProperties.textScalingFactor,
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: layoutProperties.edgeInsets / 2),
                  GestureDetector(
                    onTap: () {
                      launchUrl(Uri.parse('https://www.moodpatterns.info'));
                    },
                    child: MouseRegion(
                      cursor: SystemMouseCursors.click,
                      child: Row(
                        children: [
                          const Icon(Icons.home),
                          SizedBox(width: layoutProperties.edgeInsets / 2),
                          Text(
                            'www.moodpatterns.info',
                            style: theme.textTheme.bodyMedium!
                                .copyWith(decoration: TextDecoration.underline),
                            textScaleFactor: layoutProperties.textScalingFactor,
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: layoutProperties.edgeInsets / 2),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Icon(Icons.location_pin),
                      SizedBox(width: layoutProperties.edgeInsets / 2),
                      Text(
                        'Ernst-Melchior-Gasse 10\n1020 Vienna\nAUSTRIA',
                        style: theme.textTheme.bodyMedium!,
                        textScaleFactor: layoutProperties.textScalingFactor,
                      ),
                    ],
                  ),
                  SizedBox(height: layoutProperties.edgeInsets * 3),
                  MaterialButton(
                      onPressed: () {
                        Get.to(
                            () => LicensePage(
                                  applicationName: 'app_name'.tr(),
                                  applicationVersion:
                                      GetIt.I<PackageInfo>().version,
                                ),
                            transition: Transition.fadeIn);
                      },
                      child: Text(
                        'library_licenses',
                        textScaleFactor: layoutProperties.textScalingFactor,
                      ).tr())
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
