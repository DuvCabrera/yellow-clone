import 'package:redux/redux.dart';
import 'package:yellowcat/domain/models/cart.dart';
import 'package:yellowcat/presentation/common/actions/actions.dart';

final cartReducer = combineReducers([
  _addProductToCart,
  _removeProductFromCart,
  _cleanProductCart,
]);

Cart _addProductToCart(Cart state, action) {
  if (action is AddProductToCartAction) {
    final list = List<CartProduct>.from(state.cartProduct);
    list.add(action.product);
    return Cart(list);
  } else {
    return state;
  }
}

Cart _removeProductFromCart(Cart state, action) {
  if (action is RemoveProductFromCartAction) {
    state.cartProduct
        .where((product) => product.product.id != action.id)
        .toList();
    return state;
  }
  return state;
}

Cart _cleanProductCart(Cart state, action) {
  if (action is CleanProductCart) {
    state.cartProduct.clear();
    return state;
  }
  return state;
}
