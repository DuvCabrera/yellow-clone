import 'package:yellowcat/domain/models/app_state.dart';

final productSelector = (AppState state) => state.products;
final cartProductSelector = (AppState state) => state.cart.cartProduct;
final cartSelector = (AppState state) => state.cart;
