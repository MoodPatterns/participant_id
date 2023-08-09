import 'package:easy_localization/easy_localization.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../enums/nav_drawer_enum.dart';
import '../utils/const/app_color.dart';
import '../utils/const/app_data.dart';
import '../utils/controllers/theme_controller.dart';
import '../widgets/nav_drawer.dart';
import '../widgets/page_body.dart';
import '../widgets/theme_popup_menu.dart';

class PageTheme extends StatelessWidget {
  const PageTheme({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);

    final ScrollController scrollController = ScrollController();

    var mq = MediaQuery.of(context);

    var layoutProperties = AppData.layoutProperties(mq.size.width);

    return SafeArea(
      bottom: false,
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
          selected: NavDrawerEnum.theme,
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
                      'theme',
                      textScaleFactor: layoutProperties.textScalingFactor,
                      style: theme.textTheme.titleLarge,
                    ).tr(),
                    // A 3-way theme toggle switch that shows the scheme.
                    FlexThemeModeSwitch(
                      themeMode: GetIt.I<ThemeController>().themeMode,
                      onThemeModeChanged: GetIt.I<ThemeController>().setThemeMode,
                      flexSchemeData: AppColor
                          .schemes[GetIt.I<ThemeController>().schemeIndex],
                      optionButtonBorderRadius:
                          GetIt.I<ThemeController>().useSubThemes ? 12 : 4,
                      buttonOrder: FlexThemeModeButtonOrder.lightSystemDark,
                    ),
                    SizedBox(height: layoutProperties.edgeInsets),
                    // Theme popup menu button to select color scheme.
                    ThemePopupMenu(
                      contentPadding: EdgeInsets.zero,
                      schemeIndex: GetIt.I<ThemeController>().schemeIndex,
                      onChanged: GetIt.I<ThemeController>().setSchemeIndex,
                    ),
                    // Active theme color indicators.
                  ],
                )),
          ),
        ),
      ),
    );
  }
}
