import 'package:yellowcat/domain/models/app_state.dart';
import 'package:yellowcat/presentation/reducers/cart_reducer.dart';
import 'package:yellowcat/presentation/reducers/loading_reducer.dart';
import 'package:yellowcat/presentation/reducers/products_reducer.dart';

AppState appStateReducer(AppState state, appAction) {
  return AppState(
    isLoading: loadingReducer(
      state.isLoading,
      appAction,
    ),
    products: productsReducer(
      state.products,
      appAction,
    ),
    cart: cartReducer(
      state.cart,
      appAction,
    ),
  );
}
