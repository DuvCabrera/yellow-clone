// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:yellowcat/domain/models/cart.dart';
import 'package:yellowcat/domain/models/product.dart';

class AppState {
  final bool isLoading;
  final List<Product> products;
  final Cart cart;

  AppState({
    this.isLoading = false,
    this.products = const [],
    this.cart = const Cart([]),
  });

  factory AppState.loading() => AppState(isLoading: true);

  AppState create({bool? isLoading, List<Product>? products, Cart? cart}) {
    return AppState(
      isLoading: isLoading ?? this.isLoading,
      products: products ?? this.products,
      cart: cart ?? this.cart,
    );
  }
}
