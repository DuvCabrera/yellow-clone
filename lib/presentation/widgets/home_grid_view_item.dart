import 'package:flutter/material.dart';
import 'package:yellowcat/domain/models/product.dart';
import '../common/utils.dart';
import '../common/colors.dart' as colors;

class ProductVM {
  final int id;
  final String name;
  final String description;
  final double price;
  final int? discount;
  final String imageUrl;

  ProductVM(this.id,
      {required this.name,
      required this.description,
      required this.price,
      required this.discount,
      required this.imageUrl});
}

class HomeGridViewItem extends StatelessWidget {
  HomeGridViewItem({
    super.key,
    required this.product,
    required this.onClick,
  });

  final Product product;
  final VoidCallback onClick;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 10.0),
          child: Container(
            width: context.responsiveWidth(224),
            decoration:
                BoxDecoration(border: Border.all(color: colors.darkGray)),
          ),
        ),
        Stack(children: [
          Image.network(
            product.imageUrl,
            height: context.responsiveHeight(224),
            width: context.responsiveWidth(224),
            fit: BoxFit.cover,
          ),
          product.discount != null
              ? Padding(
                  padding: const EdgeInsets.only(top: 5.0),
                  child: Container(
                    color: colors.purple,
                    child: Text(
                      "${product.discount} % OFF ",
                      style: const TextStyle(
                        color: colors.white,
                        fontSize: 20,
                      ),
                    ),
                  ),
                )
              : Container(),
        ]),
        Text(product.name),
        Text(product.description),
        product.discount != null
            ? Text(
                'R\$ ${product.price} | ${priceWithDiscount(product.price, product.discount!)} ')
            : Text('R\$ ${product.price}'),
        Text('12X DE R\$${(product.price / 12).toStringAsPrecision(3)}'),

        GestureDetector(
          onTap: () {
            // callback;
            onClick();
          },
          child: Container(
              height: context.responsiveHeight(30),
              width: context.responsiveWidth(87),
              decoration: const BoxDecoration(color: colors.purple),
              child: const Center(
                child: Text(
                  'COMPRAR',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: colors.white),
                ),
              )),
        )
        // })
      ],
    );
  }
}

String priceWithDiscount(double price, int discount) {
  final double percent = discount / 100;
  final double priceDisconted = price * percent;
  final priceWithDiscount = price - priceDisconted;
  final result = priceWithDiscount.toStringAsPrecision(4);
  return 'R\$$result';
}
