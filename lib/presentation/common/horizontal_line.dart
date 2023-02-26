import 'package:flutter/material.dart';
import 'colors.dart' as colors;
import 'utils.dart';

class HorizontalLine extends StatelessWidget {
  const HorizontalLine({super.key, required this.size});
  final double size;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.responsiveWidth(size),
      decoration: BoxDecoration(border: Border.all(color: colors.darkGray)),
    );
  }
}
