import 'package:yellowcat/domain/models/cart.dart';
import 'package:yellowcat/domain/models/product.dart';

class LoadProduct {}

class ProductsLoadedAction {
  final List<Product> products;

  ProductsLoadedAction(this.products);
}

class ProductsLoadFailAction {
  final Exception error;

  ProductsLoadFailAction(this.error);
}

class RemoveProductAction {
  final int id;

  RemoveProductAction(this.id);
}

class AddProductToCartAction {
  final CartProduct product;

  AddProductToCartAction(this.product);
}

class RemoveProductFromCartAction {
  final int id;

  RemoveProductFromCartAction(this.id);
}

class CleanProductCart {}

enum LoadingAction { loaded, loading }
