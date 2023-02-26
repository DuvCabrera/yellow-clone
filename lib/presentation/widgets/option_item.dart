import 'package:flutter/material.dart';
import '../common/utils.dart';
import '../common/colors.dart' as colors;

class OptionItem extends StatelessWidget {
  const OptionItem({
    super.key,
    required this.title,
    required this.subTitle,
    required this.icon,
  });
  final String title;
  final String subTitle;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: context.responsiveHeight(40),
      width: context.responsiveWidth(290),
      child: Row(
        children: [
          Icon(
            icon,
            size: context.responsiveHeight(40),
            color: colors.darkGray,
          ),
          SizedBox(
            width: context.responsiveWidth(20),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  color: colors.darkGray,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Text(
                subTitle,
                style: const TextStyle(color: colors.darkGray),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
