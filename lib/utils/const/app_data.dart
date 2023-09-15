import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
//import 'package:google_fonts/google_fonts.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:participant_id/utils/models/layout_properties.dart';


class AppData {
  // This class is not meant to be instantiated or extended; this constructor
  // prevents instantiation and extension.
  AppData._();

  // The max dp width used for layout content on the screen in the available
  // body area. Wider content gets growing side padding, kind of like on most
  // web pages when they are used on super wide screen. Just a design used for
  // this demo app, that works pretty well in this use case too.
  static const double maxBodyWidth = 1280;
  static const double maxBodyWidthBigDesktop = 1680;

  static const double bigDesktopWidthBreakpoint = 2800;
  static const double desktopBreakpoint = 1150;
  static const double phoneBreakpoint = 600;

  // Edge padding insets for page content on the screen.
  static const double edgeInsetsPhone = 8;
  static const double edgeInsetsTablet = 14;
  static const double edgeInsetsDesktop = 18;
  static const double edgeInsetsBigDesktop = 24;


  static const double scalingFactorPhone =  1;
  static const double scalingFactorTablet = 1.2;
  static const double scalingFactorDesktop = 1.5;
  static const double scalingFactorBigDesktop = 2;


  static double maxWidth(double width) {
    if (width < bigDesktopWidthBreakpoint) return maxBodyWidth;
    return maxBodyWidthBigDesktop;
  }
  

  static double textScalingFactor(double width) {
    if (width < phoneBreakpoint) return scalingFactorPhone;
    if (width < desktopBreakpoint) return scalingFactorTablet;
    if (width < bigDesktopWidthBreakpoint) return scalingFactorDesktop;
    return scalingFactorBigDesktop;
  }


  // Responsive insets based on width. The width may be from LayoutBuilder or
  // MediaQuery, depending on what is appropriate for the use case.
  static double responsiveInsets(double width) {
    if (width < phoneBreakpoint) return edgeInsetsPhone;
    if (width < desktopBreakpoint) return edgeInsetsTablet;
    if (width < bigDesktopWidthBreakpoint) return edgeInsetsDesktop;
    return edgeInsetsBigDesktop;
  }


  static const double dialogMarginPhone = 16.0;
  static const double dialogMarginTablet = 20.0;
  static const double dialogMarginDesktop = 24.0;

  static double responsiveDialogInsets(double width) {
    if (width < phoneBreakpoint) return dialogMarginPhone;
    if (width < desktopBreakpoint) return dialogMarginTablet;
    return dialogMarginDesktop;
  }

  // Returns the title of the MaterialApp. Used to set title on pages to
  // same that is defined in each example as its app name. Handy as we only
  // need to update in one place, where it belongs and no need to put it as
  // a const somewhere and no need to pass it around via a title prop either.
  static String title(BuildContext context) =>
      (context as Element).findAncestorWidgetOfExactType<GetMaterialApp>()!.title;

  // Get the main font that is used in some of the examples.
  // Feel free to try different fonts.
  //static String? get font => GoogleFonts.roboto().fontFamily;

  // Defining the visual density here to so we can change it in one spot when
  // we want to try different options.
  static VisualDensity get visualDensity =>
      FlexColorScheme.comfortablePlatformDensity;

  // We define a custom text theme for our app. This is just for demo purposes
  // on how to setup a custom text theme. This works just as well with normal
  // ThemeData and ThemeData.from btw. FlexColorScheme does the TextTheme
  // setup same way as ThemeData, but injects the primary color blends if you
  // use the new text theme blend mode option when you opt in on sub themes.
  //
  // In this example we decided that:
  //
  // Headline1...4 are too big to be useful on mobile, so we make them smaller.
  // The used sizes for them below are actually from Material Guide M3/You.
  // https://m3.material.io/styles/typography/overview
  //
  // We also think that overline is a bit too small and have weird letter
  // spacing, so we change it too.
  static const TextTheme textTheme = TextTheme(
  //   headline1: TextStyle(
  //     fontSize: 57, // Same as M3, defaults to 96 in Material2018 Typography.
  //   ),
  //   headline2: TextStyle(
  //     fontSize: 45, // Same as M3, defaults to 60 in Material2018 Typography.
  //   ),
  //   headline3: TextStyle(
  //     fontSize: 36, // Same as M3, defaults to 48 in Material2018 Typography.
  //   ),
  //   headline4: TextStyle(
  //     fontSize: 28, // Same as M3, defaults to 34 in Material2018 Typography.
  //   ),
  //   // I chose this, I later saw it happened to match new M3 style too - cool!
  //   overline: TextStyle(
  //     fontSize: 11, // Defaults to 10 in Material2018 Typography.
  //     letterSpacing: 0.5, // Defaults to 1.5 in Material2018 Typography.
  //   ),
  );

  static LayoutProperties layoutProperties(double width){
    return LayoutProperties(responsiveInsets(width), textScalingFactor(width), maxWidth(width));
  }
}