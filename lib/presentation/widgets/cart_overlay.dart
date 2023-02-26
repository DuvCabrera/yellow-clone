import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:yellowcat/domain/models/app_state.dart';
import 'package:yellowcat/domain/models/cart.dart';
import 'package:yellowcat/presentation/common/horizontal_line.dart';
import 'package:yellowcat/presentation/common/utils.dart';
import 'package:yellowcat/presentation/selectors/selectors.dart';
import 'package:yellowcat/presentation/widgets/cart_item.dart';

class CartOverlay extends StatelessWidget {
  const CartOverlay({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedPositioned(
      right: 0,
      top: 0,
      bottom: 0,
      width: context.responsiveWidth(500),
      duration: const Duration(microseconds: 300),
      child: Material(
        child: SingleChildScrollView(
          child: SizedBox(
            width: context.responsiveWidth(500),
            child: StoreConnector<AppState, Cart>(
                converter: (store) => cartSelector(store.state),
                builder: (context, cart) {
                  return Column(
                    children: [
                      Text('CARRINHO DE COMPRAS'),
                      const HorizontalLine(size: 480),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [Text('PRODUTOS'), Text('SUBTOTAL')],
                      ),
                      const HorizontalLine(size: 480),
                      CartItem(
                        products: cart.cartProduct,
                        total: cart.total,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Subtotal (sem frete):'),
                          Text('R\$${cart.total}')
                        ],
                      )
                    ],
                  );
                }),
          ),
        ),
      ),
    );
  }
}
