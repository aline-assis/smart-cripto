import 'package:flutter/material.dart';

class Response extends StatelessWidget {
  final Widget largeScreen;
  final Widget smallScreen;
  final Widget mediumScreen;

  const Response(
      {Key? key,
      required this.largeScreen,
      required this.smallScreen,
      required this.mediumScreen})
      : super(key: key);

  static bool isLargeScreen(BuildContext context) =>
      MediaQuery.of(context).size.width >= 1200;
  static bool isMediumScreen(BuildContext context) =>
      MediaQuery.of(context).size.width <= 1200 &&
      MediaQuery.of(context).size.width >= 800;
  static bool isSmallScreen(BuildContext context) =>
      MediaQuery.of(context).size.width < 800;

  @override
  Widget build(BuildContext context) {
    final Size _size = MediaQuery.of(context).size;

    if (_size.width >= 1100) {
      return largeScreen;
    } else if (_size.width >= 850) {
      return mediumScreen;
    } else {
      return smallScreen;
    }
  }
}
