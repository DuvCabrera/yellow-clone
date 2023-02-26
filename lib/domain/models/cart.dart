import 'package:yellowcat/domain/models/product.dart';

class Cart {
  final List<CartProduct> cartProduct;
  double? get total => totalPrice();

  const Cart(this.cartProduct);

  double? totalPrice() {
    try {
      double total = 0;
      for (var item in cartProduct) {
        total += (item.quantitie * item.product.price);
      }
      return total;
    } catch (e) {
      return null;
    }
  }

  Cart.init() : cartProduct = <CartProduct>[];
}

class CartProduct {
  final int quantitie;
  final Product product;

  CartProduct({required this.quantitie, required this.product});
}
