import 'package:flutter/material.dart';

const _designBaseSize = Size(1350, 657);

extension PageSize on BuildContext {
  double responsiveHeight(double nun) {
    return nun * MediaQuery.of(this).size.height / _designBaseSize.height;
  }

  double responsiveWidth(double nun) =>
      nun * MediaQuery.of(this).size.width / _designBaseSize.width;
}
