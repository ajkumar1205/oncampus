import 'package:flutter/material.dart';

import '../constants/size.const.dart';

extension Ease on Widget {
  Widget center() => Center(child: this);
  Widget pad(double value) =>
      Padding(padding: EdgeInsets.all(value), child: this);
  Widget padSym([double vertical = 0, double horizontal = 0]) => Padding(
      padding: EdgeInsets.symmetric(vertical: vertical, horizontal: horizontal),
      child: this);
  Widget padLeft(double value) =>
      Padding(padding: EdgeInsets.only(left: value), child: this);
  Widget padRight(double value) =>
      Padding(padding: EdgeInsets.only(right: value), child: this);
  Widget padTop(double value) =>
      Padding(padding: EdgeInsets.only(top: value), child: this);
  Widget padBottom(double value) =>
      Padding(padding: EdgeInsets.only(bottom: value), child: this);
}

extension StringExtension on String {
  Widget text(TextStyle? style) => Text(this, style: style);
}

extension ResponsiveInt on int {
  Widget vertical(Widget? child) =>
      SizedBox(height: this.toDouble(), child: child);
  Widget horizontal(Widget? child) =>
      SizedBox(width: this.toDouble(), child: child);

  double get h => size.height * this / 100;
  double get w => size.width * this / 100;
}

extension ResponsiveDouble on double {
  Widget vertical(Widget? child) => SizedBox(height: this, child: child);
  Widget horizontal(Widget? child) => SizedBox(width: this, child: child);

  double get h => size.height * this / 100;
  double get w => size.width * this / 100;
}
