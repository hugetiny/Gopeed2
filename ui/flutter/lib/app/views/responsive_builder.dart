import 'package:flutter/material.dart';

class ResponsiveBuilder extends StatelessWidget {
  const ResponsiveBuilder({
    required this.miniBuilder,
    required this.narrowBuilder,
    required this.mediumBuilder,
    required this.wideBuilder,
    Key? key,
  }) : super(key: key);
  final Widget Function(
    BuildContext context,
    BoxConstraints constraints,
  ) miniBuilder;
  final Widget Function(
    BuildContext context,
    BoxConstraints constraints,
  ) narrowBuilder;

  final Widget Function(
    BuildContext context,
    BoxConstraints constraints,
  ) mediumBuilder;

  final Widget Function(
    BuildContext context,
    BoxConstraints constraints,
  ) wideBuilder;
  static bool isMini(BuildContext context) =>
      MediaQuery.of(context).size.width < 485;

  static bool isNarrow(BuildContext context) =>
      MediaQuery.of(context).size.width < 768;
          // &&
          // MediaQuery.of(context).size.width >= 485;

  static bool isMedium(BuildContext context) =>
      MediaQuery.of(context).size.width < 1080 &&
      MediaQuery.of(context).size.width >= 768;

  static bool isWide(BuildContext context) =>
      MediaQuery.of(context).size.width >= 1080;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth >= 1080) {
          return wideBuilder(context, constraints);
        } else if (constraints.maxWidth >= 768) {
          return mediumBuilder(context, constraints);
        } else if (constraints.maxWidth >= 485) {
          return narrowBuilder(context, constraints);
        } else {
          return miniBuilder(context, constraints);
        }
      },
    );
  }
}
