import 'package:flutter/material.dart';
import '../common/colors.dart' as colors;

class Indicators extends StatelessWidget {
  const Indicators(
      {super.key, required this.currentIndex, required this.imagesLenght});
  final int currentIndex;
  final int imagesLenght;

  @override
  Widget build(BuildContext context) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List<Widget>.generate(imagesLenght, (index) {
          return Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: Container(
              height: 10,
              width: 10,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: colors.darkGray),
                  color:
                      currentIndex == index ? colors.darkGray : colors.iceBlue),
            ),
          );
        }));
  }
}
