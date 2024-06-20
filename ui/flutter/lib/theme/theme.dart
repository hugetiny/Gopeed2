import "package:flutter/material.dart";

class MaterialTheme {
  final TextTheme textTheme;

  const MaterialTheme(this.textTheme);

  static ColorScheme lightScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(4278218050),
      surfaceTint: Color(4278218050),
      onPrimary: Color(4294967295),
      primaryContainer: Color(4280726388),
      onPrimaryContainer: Color(4278195208),
      secondary: Color(4278218043),
      onSecondary: Color(4294967295),
      secondaryContainer: Color(4280661097),
      onSecondaryContainer: Color(4278195463),
      tertiary: Color(4278218040),
      onTertiary: Color(4294967295),
      tertiaryContainer: Color(4280541565),
      onTertiaryContainer: Color(4278205981),
      error: Color(4290386458),
      onError: Color(4294967295),
      errorContainer: Color(4294957782),
      onErrorContainer: Color(4282449922),
      surface: Color(4294768888),
      onSurface: Color(4280032027),
      onSurfaceVariant: Color(4282665028),
      outline: Color(4285823091),
      outlineVariant: Color(4291086530),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4281413680),
      inversePrimary: Color(4284276378),
      primaryFixed: Color(4286249908),
      onPrimaryFixed: Color(4278198545),
      primaryFixedDim: Color(4284276378),
      onPrimaryFixedVariant: Color(4278211121),
      secondaryFixed: Color(4286184617),
      onSecondaryFixed: Color(4278198542),
      secondaryFixedDim: Color(4284210831),
      onSecondaryFixedVariant: Color(4278211115),
      tertiaryFixed: Color(4284415900),
      onTertiaryFixed: Color(4278198541),
      tertiaryFixedDim: Color(4280804223),
      onTertiaryFixedVariant: Color(4278211113),
      surfaceDim: Color(4292729305),
      surfaceBright: Color(4294768888),
      surfaceContainerLowest: Color(4294967295),
      surfaceContainerLow: Color(4294374386),
      surfaceContainer: Color(4294045164),
      surfaceContainerHigh: Color(4293650407),
      surfaceContainerHighest: Color(4293255905),
    );
  }

  ThemeData light() {
    return theme(lightScheme());
  }

  static ColorScheme lightMediumContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(4278209838),
      surfaceTint: Color(4278218050),
      onPrimary: Color(4294967295),
      primaryContainer: Color(4278224467),
      onPrimaryContainer: Color(4294967295),
      secondary: Color(4278210088),
      onSecondary: Color(4294967295),
      secondaryContainer: Color(4278224458),
      onSecondaryContainer: Color(4294967295),
      tertiary: Color(4278210086),
      onTertiary: Color(4294967295),
      tertiaryContainer: Color(4278224455),
      onTertiaryContainer: Color(4294967295),
      error: Color(4287365129),
      onError: Color(4294967295),
      errorContainer: Color(4292490286),
      onErrorContainer: Color(4294967295),
      surface: Color(4294768888),
      onSurface: Color(4280032027),
      onSurfaceVariant: Color(4282401856),
      outline: Color(4284244060),
      outlineVariant: Color(4286086263),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4281413680),
      inversePrimary: Color(4284276378),
      primaryFixed: Color(4278224467),
      onPrimaryFixed: Color(4294967295),
      primaryFixedDim: Color(4278217280),
      onPrimaryFixedVariant: Color(4294967295),
      secondaryFixed: Color(4278224458),
      onSecondaryFixed: Color(4294967295),
      secondaryFixedDim: Color(4278217273),
      onSecondaryFixedVariant: Color(4294967295),
      tertiaryFixed: Color(4278224455),
      onTertiaryFixed: Color(4294967295),
      tertiaryFixedDim: Color(4278217271),
      onTertiaryFixedVariant: Color(4294967295),
      surfaceDim: Color(4292729305),
      surfaceBright: Color(4294768888),
      surfaceContainerLowest: Color(4294967295),
      surfaceContainerLow: Color(4294374386),
      surfaceContainer: Color(4294045164),
      surfaceContainerHigh: Color(4293650407),
      surfaceContainerHighest: Color(4293255905),
    );
  }

  ThemeData lightMediumContrast() {
    return theme(lightMediumContrastScheme());
  }

  static ColorScheme lightHighContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(4278200598),
      surfaceTint: Color(4278218050),
      onPrimary: Color(4294967295),
      primaryContainer: Color(4278209838),
      onPrimaryContainer: Color(4294967295),
      secondary: Color(4278200594),
      onSecondary: Color(4294967295),
      secondaryContainer: Color(4278210088),
      onSecondaryContainer: Color(4294967295),
      tertiary: Color(4278200593),
      onTertiary: Color(4294967295),
      tertiaryContainer: Color(4278210086),
      onTertiaryContainer: Color(4294967295),
      error: Color(4283301890),
      onError: Color(4294967295),
      errorContainer: Color(4287365129),
      onErrorContainer: Color(4294967295),
      surface: Color(4294768888),
      onSurface: Color(4278190080),
      onSurfaceVariant: Color(4280362273),
      outline: Color(4282401856),
      outlineVariant: Color(4282401856),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4281413680),
      inversePrimary: Color(4289134536),
      primaryFixed: Color(4278209838),
      onPrimaryFixed: Color(4294967295),
      primaryFixedDim: Color(4278203421),
      onPrimaryFixedVariant: Color(4294967295),
      secondaryFixed: Color(4278210088),
      onSecondaryFixed: Color(4294967295),
      secondaryFixedDim: Color(4278203674),
      onSecondaryFixedVariant: Color(4294967295),
      tertiaryFixed: Color(4278210086),
      onTertiaryFixed: Color(4294967295),
      tertiaryFixedDim: Color(4278203672),
      onTertiaryFixedVariant: Color(4294967295),
      surfaceDim: Color(4292729305),
      surfaceBright: Color(4294768888),
      surfaceContainerLowest: Color(4294967295),
      surfaceContainerLow: Color(4294374386),
      surfaceContainer: Color(4294045164),
      surfaceContainerHigh: Color(4293650407),
      surfaceContainerHighest: Color(4293255905),
    );
  }

  ThemeData lightHighContrast() {
    return theme(lightHighContrastScheme());
  }

  static ColorScheme darkScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(4284276378),
      surfaceTint: Color(4284276378),
      onPrimary: Color(4278204704),
      primaryContainer: Color(4278224467),
      onPrimaryContainer: Color(4294967295),
      secondary: Color(4284210831),
      onSecondary: Color(4278204700),
      secondaryContainer: Color(4278224458),
      onSecondaryContainer: Color(4294967295),
      tertiary: Color(4283235220),
      onTertiary: Color(4278204698),
      tertiaryContainer: Color(4278243184),
      onTertiaryContainer: Color(4278202389),
      error: Color(4294948011),
      onError: Color(4285071365),
      errorContainer: Color(4287823882),
      onErrorContainer: Color(4294957782),
      surface: Color(4279505683),
      onSurface: Color(4293255905),
      onSurfaceVariant: Color(4291086530),
      outline: Color(4287533709),
      outlineVariant: Color(4282665028),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4293255905),
      inversePrimary: Color(4278218050),
      primaryFixed: Color(4286249908),
      onPrimaryFixed: Color(4278198545),
      primaryFixedDim: Color(4284276378),
      onPrimaryFixedVariant: Color(4278211121),
      secondaryFixed: Color(4286184617),
      onSecondaryFixed: Color(4278198542),
      secondaryFixedDim: Color(4284210831),
      onSecondaryFixedVariant: Color(4278211115),
      tertiaryFixed: Color(4284415900),
      onTertiaryFixed: Color(4278198541),
      tertiaryFixedDim: Color(4280804223),
      onTertiaryFixedVariant: Color(4278211113),
      surfaceDim: Color(4279505683),
      surfaceBright: Color(4282005817),
      surfaceContainerLowest: Color(4279111182),
      surfaceContainerLow: Color(4280032027),
      surfaceContainer: Color(4280295199),
      surfaceContainerHigh: Color(4280953386),
      surfaceContainerHighest: Color(4281676852),
    );
  }

  ThemeData dark() {
    return theme(darkScheme());
  }

  static ColorScheme darkMediumContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(4284539550),
      surfaceTint: Color(4284276378),
      onPrimary: Color(4278197005),
      primaryContainer: Color(4278363752),
      onPrimaryContainer: Color(4278190080),
      secondary: Color(4284474259),
      onSecondary: Color(4278197002),
      secondaryContainer: Color(4278298205),
      onSecondaryContainer: Color(4278190080),
      tertiary: Color(4283235220),
      onTertiary: Color(4278201876),
      tertiaryContainer: Color(4278243184),
      onTertiaryContainer: Color(4278190080),
      error: Color(4294949553),
      onError: Color(4281794561),
      errorContainer: Color(4294923337),
      onErrorContainer: Color(4278190080),
      surface: Color(4279505683),
      onSurface: Color(4294900473),
      onSurfaceVariant: Color(4291349702),
      outline: Color(4288717983),
      outlineVariant: Color(4286612607),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4293255905),
      inversePrimary: Color(4278211378),
      primaryFixed: Color(4286249908),
      onPrimaryFixed: Color(4278195465),
      primaryFixedDim: Color(4284276378),
      onPrimaryFixedVariant: Color(4278206244),
      secondaryFixed: Color(4286184617),
      onSecondaryFixed: Color(4278195463),
      secondaryFixedDim: Color(4284210831),
      onSecondaryFixedVariant: Color(4278206240),
      tertiaryFixed: Color(4284415900),
      onTertiaryFixed: Color(4278195463),
      tertiaryFixedDim: Color(4280804223),
      onTertiaryFixedVariant: Color(4278206238),
      surfaceDim: Color(4279505683),
      surfaceBright: Color(4282005817),
      surfaceContainerLowest: Color(4279111182),
      surfaceContainerLow: Color(4280032027),
      surfaceContainer: Color(4280295199),
      surfaceContainerHigh: Color(4280953386),
      surfaceContainerHighest: Color(4281676852),
    );
  }

  ThemeData darkMediumContrast() {
    return theme(darkMediumContrastScheme());
  }

  static ColorScheme darkHighContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(4293853169),
      surfaceTint: Color(4284276378),
      onPrimary: Color(4278190080),
      primaryContainer: Color(4284539550),
      onPrimaryContainer: Color(4278190080),
      secondary: Color(4293918703),
      onSecondary: Color(4278190080),
      secondaryContainer: Color(4284474259),
      onSecondaryContainer: Color(4278190080),
      tertiary: Color(4293918702),
      onTertiary: Color(4278190080),
      tertiaryContainer: Color(4281329539),
      onTertiaryContainer: Color(4278190080),
      error: Color(4294965753),
      onError: Color(4278190080),
      errorContainer: Color(4294949553),
      onErrorContainer: Color(4278190080),
      surface: Color(4279505683),
      onSurface: Color(4294967295),
      onSurfaceVariant: Color(4294507766),
      outline: Color(4291349702),
      outlineVariant: Color(4291349702),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4293255905),
      inversePrimary: Color(4278202651),
      primaryFixed: Color(4286709689),
      onPrimaryFixed: Color(4278190080),
      primaryFixedDim: Color(4284539550),
      onPrimaryFixedVariant: Color(4278197005),
      secondaryFixed: Color(4286971823),
      onSecondaryFixed: Color(4278190080),
      secondaryFixedDim: Color(4284474259),
      onSecondaryFixedVariant: Color(4278197002),
      tertiaryFixed: Color(4287102892),
      onTertiaryFixed: Color(4278190080),
      tertiaryFixedDim: Color(4281329539),
      onTertiaryFixedVariant: Color(4278197002),
      surfaceDim: Color(4279505683),
      surfaceBright: Color(4282005817),
      surfaceContainerLowest: Color(4279111182),
      surfaceContainerLow: Color(4280032027),
      surfaceContainer: Color(4280295199),
      surfaceContainerHigh: Color(4280953386),
      surfaceContainerHighest: Color(4281676852),
    );
  }

  ThemeData darkHighContrast() {
    return theme(darkHighContrastScheme());
  }


  ThemeData theme(ColorScheme colorScheme) => ThemeData(
     useMaterial3: true,
     brightness: colorScheme.brightness,
     colorScheme: colorScheme,
     textTheme: textTheme.apply(
       bodyColor: colorScheme.onSurface,
       displayColor: colorScheme.onSurface,
     ),
     scaffoldBackgroundColor: colorScheme.background,
     canvasColor: colorScheme.surface,
  );


  List<ExtendedColor> get extendedColors => [
  ];
}

class ExtendedColor {
  final Color seed, value;
  final ColorFamily light;
  final ColorFamily lightHighContrast;
  final ColorFamily lightMediumContrast;
  final ColorFamily dark;
  final ColorFamily darkHighContrast;
  final ColorFamily darkMediumContrast;

  const ExtendedColor({
    required this.seed,
    required this.value,
    required this.light,
    required this.lightHighContrast,
    required this.lightMediumContrast,
    required this.dark,
    required this.darkHighContrast,
    required this.darkMediumContrast,
  });
}

class ColorFamily {
  const ColorFamily({
    required this.color,
    required this.onColor,
    required this.colorContainer,
    required this.onColorContainer,
  });

  final Color color;
  final Color onColor;
  final Color colorContainer;
  final Color onColorContainer;
}
