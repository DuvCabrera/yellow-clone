import 'package:flutter/material.dart';
import 'package:yellowcat/domain/models/cart.dart';
import 'package:yellowcat/presentation/common/horizontal_line.dart';
import 'package:yellowcat/presentation/common/utils.dart';

class CartItem extends StatefulWidget {
  const CartItem({super.key, this.products, this.total, this.onTap});
  final List<CartProduct>? products;
  final double? total;
  final Function(int id)? onTap;
  @override
  State<CartItem> createState() => _CartItemState();
}

class _CartItemState extends State<CartItem> {
  List<CartProduct>? get _products => widget.products;
  double? get _total => widget.total;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.responsiveWidth(480),
      child: Column(
        children: List.generate(_products?.length ?? 0, (index) {
          return Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: context.responsiveWidth(15)),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child: Image.network(
                          _products![index].product.imageUrl,
                          height: context.responsiveHeight(100),
                          width: context.responsiveWidth(50),
                          alignment: Alignment.topCenter,
                        ),
                      ),
                      SizedBox(
                        width: context.responsiveWidth(10),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(_products![index].product.name),
                          Text(_products![index].product.description),
                          Text('R\$${_products![index].product.price}'),
                          SizedBox(
                            width: context.responsiveWidth(100),
                            child: Row(children: [
                              Container(
                                child: GestureDetector(
                                  child: Icon(Icons.exposure_minus_1),
                                ),
                              ),
                            ]),
                          ),
                        ],
                      ),
                    ]),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Row(
                        children: [
                          Text('R\$${_total?.toString() ?? "0,00"}'),
                          IconButton(
                              onPressed: () => widget.onTap,
                              icon: const Icon(Icons.delete_outline_rounded))
                        ],
                      ),
                    )
                  ],
                ),
              ),
              HorizontalLine(size: context.responsiveWidth(480))
            ],
          );
        }),
      ),
    );
  }
}
