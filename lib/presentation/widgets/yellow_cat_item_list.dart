import 'package:flutter/material.dart';
import 'package:yellowcat/presentation/common/utils.dart';
import '../common/colors.dart' as colors;
import 'option_item.dart';

class YellowCatItemList extends StatelessWidget {
  const YellowCatItemList({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      // ignore: prefer_const_literals_to_create_immutables
      children: [
        const OptionItem(
            title: 'ENVIAMOS SUAS COMPRAS',
            subTitle: 'Entrega em todo pais',
            icon: Icons.fire_truck_outlined),
        Padding(
          padding: EdgeInsets.only(right: context.responsiveWidth(30)),
          child: Container(
            height: context.responsiveHeight(40),
            decoration: BoxDecoration(
                color: colors.darkGray,
                border: Border.all(color: colors.black)),
          ),
        ),
        const OptionItem(
            title: 'PAGUE COMO QUISER',
            subTitle: 'Cartões de crédito ou à vista',
            icon: Icons.credit_card),
        Padding(
          padding: EdgeInsets.only(right: context.responsiveWidth(30)),
          child: Container(
            height: context.responsiveHeight(40),
            decoration: BoxDecoration(
                color: colors.darkGray,
                border: Border.all(color: colors.black)),
          ),
        ),
        const OptionItem(
            title: 'COMPRE COM SEGURANÇA',
            subTitle: 'Seus dados sempre protegidos',
            icon: Icons.lock_outline)
      ],
    );
  }
}
