import 'package:yellowcat/domain/models/product.dart';
import 'package:redux/redux.dart';
import 'package:yellowcat/presentation/common/actions/actions.dart';

final productsReducer =
    combineReducers<List<Product>>([_addProduct, _removeProduct]);

List<Product> _addProduct(List<Product> state, action) {
  if (action is ProductsLoadedAction) {
    return List.from(state)..addAll(action.products);
  }
  return state;
}

List<Product> _removeProduct(List<Product> state, action) {
  if (action is RemoveProductAction) {
    return state.where((product) => product.id != action.id).toList();
  } else {
    return state;
  }
}
