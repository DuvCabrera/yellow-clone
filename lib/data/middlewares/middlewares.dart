import 'package:redux/redux.dart';
import 'package:yellowcat/data/cache/app_cache.dart';
import 'package:yellowcat/domain/models/app_state.dart';
import 'package:yellowcat/presentation/common/actions/actions.dart';
import 'package:yellowcat/data/mappers/mapper_cache_to_domain.dart';

void fetchProductsMiddleware(
    Store<AppState> store, action, NextDispatcher next) {
  if (action is LoadProduct) {
    final api = AppCache();
    api.getProducts().then((list) {
      store.dispatch(ProductsLoadedAction(list.map((e) => e.toDM()).toList()));
    }).catchError((error) {
      store.dispatch(ProductsLoadFailAction(error));
    });
  }
  next(action);
}
