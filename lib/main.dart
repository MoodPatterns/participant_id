import 'package:easy_localization/easy_localization.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get_it/get_it.dart';
import 'package:participant_id/pages/page_start.dart';
import 'package:participant_id/utils/const/app_color.dart';
import 'package:participant_id/utils/const/app_data.dart';
import 'package:participant_id/utils/const/hive_keys.dart';
import 'package:participant_id/utils/controllers/theme_controller.dart';
import 'package:participant_id/utils/services/theme_service.dart';
import 'package:participant_id/utils/services/theme_service_hive.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  final ThemeService themeService = ThemeServiceHive(HiveKeys.themeFile);
  // Initialize the theme service.
  await themeService.init();
  // Create a ThemeController that uses the ThemeService.
  GetIt.I.registerSingleton<ThemeController>(ThemeController(themeService));

  await GetIt.I<ThemeController>().loadAll();

  runApp(
    EasyLocalization(
        supportedLocales: const [Locale('en'),],
        path: 'assets/translations', // <-- change the path of the translation files
        fallbackLocale: const Locale('en'),
        child: MyApp(themeController: GetIt.I<ThemeController>()),
    )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key, required this.themeController}) : super(key: key);
  final ThemeController themeController;
  final useMaterial3 = true;
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      title: 'app_name'.tr(),
      theme: FlexThemeData.light(
        useMaterial3: useMaterial3,
    // We moved the definition of the list of color schemes to use into
    // a separate static class and list. We use the theme controller
    // to change the index of used color scheme from the list.
    colors: AppColor.schemes[themeController.schemeIndex].light,
      // Here we use another surface blend mode, where the scaffold
      // background gets a strong blend. This type is commonly used
      // on web/desktop when you wrap content on the scaffold in a
      // card that has a lighter background.
      surfaceMode: FlexSurfaceMode.highScaffoldLowSurfaces,
      // Our content is not all wrapped in cards in this demo, so
      // we keep the blend level fairly low for good contrast.
      blendLevel: 5,
      appBarElevation: 0.5,
      // Enum used to select what AppBar style we use.
      appBarStyle: themeController.lightAppBarStyle,
      // Set background opacity on app bar.
      appBarOpacity: themeController.appBarOpacity,
      // Used to control if we use one or two toned status bar.
      transparentStatusBar: themeController.transparentStatusBar,
      // Enum used to select what TabBar style we use.
      tabBarStyle: themeController.tabBarStyle,
      //useSubThemes: themeController.useSubThemes,
      // In this example we use the values for visual density and font
      // from a single static source, so we can change it easily there.
      visualDensity: AppData.visualDensity,
      fontFamily: AppData.font,
    ),
    // We do the exact same definition for the dark theme, but using
    // FlexThemeData.dark() and the dark FlexSchemeColors in our
    // AppColor.schemes list instead.
    darkTheme: FlexThemeData.dark(
      useMaterial3: useMaterial3,
    colors: AppColor.schemes[themeController.schemeIndex].dark,
    surfaceMode: FlexSurfaceMode.highScaffoldLowSurfaces,
    // We go with a slightly stronger blend in dark mode. It is worth
    // noticing, that in light mode, the alpha value used for the blends
    // is the blend level value, but in dark mode it is 2x this value.
    // Visually they match fairly well, but it depends on how saturated
    // your dark mode primary color is.
    blendLevel: 7,
    appBarStyle: themeController.darkAppBarStyle,
    appBarOpacity: themeController.appBarOpacity,
    transparentStatusBar: themeController.transparentStatusBar,
    appBarElevation: 0.5,
    //useSubThemes: themeController.useSubThemes,
    visualDensity: AppData.visualDensity,
    fontFamily: AppData.font,
    ),
    // Use the dark or light theme based on controller setting.
    themeMode: themeController.themeMode,
      home: const PageStart(),
    );
  }
}



