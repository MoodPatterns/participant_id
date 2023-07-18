import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';

/// Abstract interface for the ThemeService used to read and save theme
/// properties.
///
/// Also holds the key values used to persist the data and the default values
/// for each property.
abstract class ThemeService {
  /// ThemeService implementations may override this method to perform needed
  /// initialization and setup work.
  Future<void> init();

  /// Key used to read and save the themeMode value.
  static const String keyThemeMode = 'themeMode';

  /// Default value for the themeMode, also used to reset settings.
  static const ThemeMode defaultThemeMode = ThemeMode.system;

  Future<ThemeMode> themeMode();

  Future<void> saveThemeMode(ThemeMode value);

  /// Key used to read and save the useSubThemes value.
  static const String keyUseSubThemes = 'useSubThemes';

  /// Default value for the useSubThemes, also used to reset settings.
  static const bool defaultUseSubThemes = true;

  Future<bool> useSubThemes();

  Future<void> saveUseSubThemes(bool value);

  /// Key used to read and save the useTextTheme value.
  static const String keyUseTextTheme = 'useTextTheme';

  /// Default value for the useSubThemes, also used to reset settings.
  static const bool defaultUseTextTheme = true;

  Future<bool> useTextTheme();

  Future<void> saveUseTextTheme(bool value);

  /// Key used to read and save the usedScheme value.
  static const String keyUsedScheme = 'usedScheme';

  /// Default value for the usedScheme, also used to reset settings.
  static const FlexScheme defaultUsedScheme = FlexScheme.hippieBlue;

  Future<FlexScheme> usedScheme();

  Future<void> saveUsedScheme(FlexScheme value);

  /// Key used to read and save the schemeIndex value.
  static const String keySchemeIndex = 'schemeIndex';

  /// Default value for the schemeIndex, also used to reset settings.

  static const int defaultSchemeIndex = 1;

  Future<int> schemeIndex();

  Future<void> saveSchemeIndex(int value);

  /// Key used to read and save the interactionEffects value.
  static const String keyInteractionEffects = 'interactionEffects';

  /// Default value for the interactionEffects, also used to reset settings.
  static const bool defaultInteractionEffects = true;

  Future<bool> interactionEffects();

  Future<void> saveInteractionEffects(bool value);

  /// Key used to read and save the useDefaultRadius value.
  static const String keyUseDefaultRadius = 'useDefaultRadius';

  /// Default value for the useDefaultRadius, also used to reset settings.
  static const bool defaultUseDefaultRadius = true;

  Future<bool> useDefaultRadius();

  Future<void> saveUseDefaultRadius(bool value);

  /// Key used to read and save the cornerRadius value.
  static const String keyCornerRadius = 'cornerRadius';

  /// Default value for the cornerRadius, also used to reset settings.
  static const double defaultCornerRadius = 16;

  Future<double> cornerRadius();

  Future<void> saveCornerRadius(double value);

  /// Key used to read and save the inputDecoratorIsFilled value.
  static const String keyInputDecoratorIsFilled = 'inputDecoratorIsFilled';

  /// Default value for the inputDecoratorIsFilled, also used to reset settings.
  static const bool defaultInputDecoratorIsFilled = true;

  Future<bool> inputDecoratorIsFilled();

  Future<void> saveInputDecoratorIsFilled(bool value);

  /// Key used to read and save the inputDecoratorBorderType value.
  static const String keyInputDecoratorBorderType = 'inputDecoratorBorderType';

  /// Default value for the inputDecoratorBorderType, also to reset settings.
  static const FlexInputBorderType defaultInputDecoratorBorderType =
      FlexInputBorderType.outline;

  Future<FlexInputBorderType> inputDecoratorBorderType();

  Future<void> saveInputDecoratorBorderType(FlexInputBorderType value);

  /// Key used to read and save the inputDecoratorUnfocusedHasBorder value.
  static const String keyInputDecoratorUnfocusedHasBorder =
      'inputDecoratorUnfocusedHasBorder';

  /// Default value for the inputDecoratorUnfocusedHasBorder, reset settings.
  static const bool defaultInputDecoratorUnfocusedHasBorder = true;

  Future<bool> inputDecoratorUnfocusedHasBorder();

  Future<void> saveInputDecoratorUnfocusedHasBorder(bool value);

  /// Key used to read and save the surfaceMode value.
  static const String keySurfaceMode = 'surfaceMode';

  /// Default value for the surfaceMode, also used to reset settings.
  static const FlexSurfaceMode defaultSurfaceMode =
      FlexSurfaceMode.highScaffoldLowSurface;

  Future<FlexSurfaceMode> surfaceMode();

  Future<void> saveSurfaceMode(FlexSurfaceMode value);

  /// Key used to read and save the blendLevel value.
  static const String keyBlendLevel = 'blendLevel';

  /// Default value for the blendLevel, also used to reset settings.
  static const int defaultBlendLevel = 18;

  Future<int> blendLevel();

  Future<void> saveBlendLevel(int value);

  /// Key used to read and save the lightAppBarStyle value.
  static const String keyLightAppBarStyle = 'lightAppBarStyle';

  /// Default value for the lightAppBarStyle, also used to reset settings.
  static const FlexAppBarStyle defaultLightAppBarStyle =
      FlexAppBarStyle.primary;

  Future<FlexAppBarStyle> lightAppBarStyle();

  Future<void> saveLightAppBarStyle(FlexAppBarStyle value);

  /// Key used to read and save the darkAppBarStyle value.
  static const String keyDarkAppBarStyle = 'darkAppBarStyle';

  /// Default value for the darkAppBarStyle, also used to reset settings.
  static const FlexAppBarStyle defaultDarkAppBarStyle =
      FlexAppBarStyle.background;

  Future<FlexAppBarStyle> darkAppBarStyle();

  Future<void> saveDarkAppBarStyle(FlexAppBarStyle value);

  /// Key used to read and save the appBarOpacity value.
  static const String keyAppBarOpacity = 'appBarOpacity';

  /// Default value for the appBarOpacity, also used to reset settings.
  static const double defaultAppBarOpacity = 0.95;

  Future<double> appBarOpacity();

  Future<void> saveAppBarOpacity(double value);

  /// Key used to read and save the appBarElevation value.
  static const String keyAppBarElevation = 'appBarElevation';

  /// Default value for the appBarElevation, also used to reset settings.
  static const double defaultAppBarElevation = 0;

  Future<double> appBarElevation();

  Future<void> saveAppBarElevation(double value);

  /// Key used to read and save the transparentStatusBar value.
  static const String keyTransparentStatusBar = 'transparentStatusBar';

  /// Default value for the transparentStatusBar, also used to reset settings.
  static const bool defaultTransparentStatusBar = true;

  Future<bool> transparentStatusBar();

  Future<void> saveTransparentStatusBar(bool value);

  /// Key used to read and save the tabBarStyle value.
  static const String keyTabBarStyle = 'tabBarStyle';

  /// Default value for the tabBarStyle, also used to reset settings.
  static const FlexTabBarStyle defaultTabBarStyle = FlexTabBarStyle.forAppBar;

  Future<FlexTabBarStyle> tabBarStyle();

  Future<void> saveTabBarStyle(FlexTabBarStyle value);

  /// Key used to read and save the bottomNavigationBarOpacity value.
  static const String keyBottomNavigationBarOpacity =
      'bottomNavigationBarOpacity';

  /// Default value for the bottomNavigationBarOpacity, also to reset settings.
  static const double defaultBottomNavigationBarOpacity = 0.95;

  Future<double> bottomNavigationBarOpacity();

  Future<void> saveBottomNavigationBarOpacity(double value);

  /// Key used to read and save the bottomNavigationBarElevation value.
  static const String keyBottomNavigationBarElevation =
      'bottomNavigationBarElevation';

  /// Default value for the bottomNavigationBarElevation, also reset settings.
  static const double defaultBottomNavigationBarElevation = 0;

  Future<double> bottomNavigationBarElevation();

  Future<void> saveBottomNavigationBarElevation(double value);

  /// Key used to read and save the navBarStyle value.
  static const String keyNavBarStyle = 'navBarStyle';

  /// Default value for the navBarStyle, also used to reset settings.
  static const FlexSystemNavBarStyle defaultNavBarStyle =
      FlexSystemNavBarStyle.background;

  Future<FlexSystemNavBarStyle> navBarStyle();

  Future<void> saveNavBarStyle(FlexSystemNavBarStyle value);

  /// Key used to read and save the useNavDivider value.
  static const String keyUseNavDivider = 'useNavDivider';

  /// Default value for the useNavDivider, also to reset settings.
  static const bool defaultUseNavDivider = false;

  Future<bool> useNavDivider();

  Future<void> saveUseNavDivider(bool value);

  /// Key used to read and save the tooltipsMatchBackground value.
  static const String keyTooltipsMatchBackground = 'tooltipsMatchBackground';

  /// Default value for the tooltipsMatchBackground, also to reset settings.
  static const bool defaultTooltipsMatchBackground = true;

  Future<bool> tooltipsMatchBackground();

  Future<void> saveTooltipsMatchBackground(bool value);

  /// Key used to read and save the swapLightColors value.
  static const String keySwapLightColors = 'swapLightColors';

  /// Default value for the swapLightColors, also to reset settings.
  static const bool defaultSwapLightColors = false;

  Future<bool> swapLightColors();

  Future<void> saveSwapLightColors(bool value);

  /// Key used to read and save the swapDarkColors value.
  static const String keySwapDarkColors = 'swapDarkColors';

  /// Default value for the swapDarkColors, also to reset settings.
  static const bool defaultSwapDarkColors = false;

  Future<bool> swapDarkColors();

  Future<void> saveSwapDarkColors(bool value);

  /// Key used to read and save the lightIsWhite value.
  static const String keyLightIsWhite = 'lightIsWhite';

  /// Default value for the lightIsWhite, also to reset settings.
  static const bool defaultLightIsWhite = false;

  Future<bool> lightIsWhite();

  Future<void> saveLightIsWhite(bool value);

  /// Key used to read and save the darkIsTrueBlack value.
  static const String keyDarkIsTrueBlack = 'darkIsTrueBlack';

  /// Default value for the darkIsTrueBlack, also to reset settings.
  static const bool defaultDarkIsTrueBlack = false;

  /// Loads dark uses true black setting in dark mode, in example 5.
  Future<bool> darkIsTrueBlack();

  /// Persists dark uses true black setting in dark mode, in example 5.
  Future<void> saveDarkIsTrueBlack(bool value);

  /// Key used to read and save the useToDarkMethod value.
  static const String keyUseToDarkMethod = 'useToDarkMethod';

  /// Default value for the useToDarkMethod, also to reset settings.
  static const bool defaultUseToDarkMethod = false;

  Future<bool> useToDarkMethod();

  Future<void> saveUseToDarkMethod(bool value);

  /// Key used to read and save the darkMethodLevel value.
  static const String keyDarkMethodLevel = 'darkMethodLevel';

  /// Default value for the darkMethodLevel, also used to reset settings.
  ///
  /// Defaults to 35.
  static const int defaultDarkMethodLevel = 35;

  Future<int> darkMethodLevel();

  Future<void> saveDarkMethodLevel(int value);

  /// Key used to read and save the useFlexColorScheme value.
  static const String keyUseFlexColorScheme = 'useFlexColorScheme';

  /// Default value for the useFlexColorScheme, also to reset settings.
  static const bool defaultUseFlexColorScheme = true;

  Future<bool> useFlexColorScheme();

  Future<void> saveUseFlexColorScheme(bool value);

  /// Key used to read and save the blendLightOnColors value.
  static const String keyBlendLightOnColors = 'blendLightOnColors';

  /// Default value for the blendLightOnColors, also to reset settings.
  static const bool defaultBlendLightOnColors = true;

  Future<bool> blendLightOnColors();

  Future<void> saveBlendLightOnColors(bool value);

  /// Key used to read and save the blendDarkOnColors value.
  static const String keyBlendDarkOnColors = 'blendDarkOnColors';

  /// Default value for the blendDarkOnColors, also to reset settings.
  static const bool defaultBlendDarkOnColors = true;

  Future<bool> blendDarkOnColors();

  Future<void> saveBlendDarkOnColors(bool value);

  /// Key used to read and save the blendLightTextTheme value.
  static const String keyBlendLightTextTheme = 'blendLightTextTheme';

  /// Default value for the blendLightTextTheme, also to reset settings.
  static const bool defaultBlendLightTextTheme = true;

  Future<bool> blendLightTextTheme();

  Future<void> saveBlendLightTextTheme(bool value);

  /// Key used to read and save the blendDarkTextTheme value.
  static const String keyBlendDarkTextTheme = 'blendDarkTextTheme';

  /// Default value for the blendDarkTextTheme, also to reset settings.
  static const bool defaultBlendDarkTextTheme = true;

  Future<bool> blendDarkTextTheme();

  Future<void> saveBlendDarkTextTheme(bool value);

  /// Key used to read and save the fabUseShape value.
  static const String keyFabUseShape = 'fabUseShape';

  /// Default value for the fabUseShape, also to reset settings.
  static const bool defaultFabUseShape = true;

  Future<bool> fabUseShape();

  Future<void> saveFabUseShape(bool value);

  /// Key used to read and save the primaryLight color value.
  static const String keyPrimaryLight = 'primaryLight';

  /// Default value for the primaryLight color, also to reset settings.
  static const Color defaultPrimaryLight = FlexColor.materialLightPrimary;

  Future<Color> primaryLight();

  Future<void> savePrimaryLight(Color value);

  /// Key used to read and save the primaryVariantLight color value.
  static const String keyPrimaryVariantLight = 'primaryVariantLight';

  /// Default value for the primaryLight color, also to reset settings.
  static const Color defaultPrimaryVariantLight =
      FlexColor.materialLightPrimaryVariant;

  Future<Color> primaryVariantLight();

  Future<void> savePrimaryVariantLight(Color value);

  /// Key used to read and save the secondaryLight color value.
  static const String keySecondaryLight = 'secondaryLight';

  /// Default value for the secondaryLight color, also to reset settings.
  static const Color defaultSecondaryLight = FlexColor.materialLightSecondary;

  Future<Color> secondaryLight();

  Future<void> saveSecondaryLight(Color value);

  /// Key used to read and save the secondaryVariantLight color value.
  static const String keySecondaryVariantLight = 'secondaryVariantLight';

  /// Default value for the secondaryLight color, also to reset settings.
  static const Color defaultSecondaryVariantLight =
      FlexColor.materialLightSecondaryVariant;

  Future<Color> secondaryVariantLight();

  Future<void> saveSecondaryVariantLight(Color value);

  /// Key used to read and save the primaryDark color value.
  static const String keyPrimaryDark = 'primaryDark';

  /// Default value for the primaryDark color, also to reset settings.
  static const Color defaultPrimaryDark = FlexColor.materialDarkPrimary;

  Future<Color> primaryDark();

  Future<void> savePrimaryDark(Color value);

  /// Key used to read and save the primaryVariantDark color value.
  static const String keyPrimaryVariantDark = 'primaryVariantDark';

  /// Default value for the primaryDark color, also to reset settings.
  static const Color defaultPrimaryVariantDark =
      FlexColor.materialDarkPrimaryVariant;

  Future<Color> primaryVariantDark();

  Future<void> savePrimaryVariantDark(Color value);

  /// Key used to read and save the secondaryDark color value.
  static const String keySecondaryDark = 'secondaryDark';

  /// Default value for the secondaryDark color, also to reset settings.
  static const Color defaultSecondaryDark = FlexColor.materialDarkSecondary;

  Future<Color> secondaryDark();

  Future<void> saveSecondaryDark(Color value);

  /// Key used to read and save the secondaryVariantDark color value.
  static const String keySecondaryVariantDark = 'secondaryVariantDark';

  /// Default value for the secondaryDark color, also to reset settings.
  static const Color defaultSecondaryVariantDark =
      FlexColor.materialDarkSecondaryVariant;

  Future<Color> secondaryVariantDark();

  Future<void> saveSecondaryVariantDark(Color value);
}