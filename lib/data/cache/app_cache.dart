import 'package:yellowcat/data/cache/models/product_cm.dart';

class AppCache {
  Future<List<ProductCM>> getProducts() async {
    return Future.value([
      product,
      product,
      product,
      product,
      product,
      product,
    ]);
  }
}

final product = ProductCM(
    id: 1,
    name: 'Alergicat locao',
    description: 'AntiAlergica Spray 250ML',
    price: 39.90,
    discount: 35,
    imageUrl:
        'https://d2r9epyceweg5n.cloudfront.net/stores/002/305/227/products/87a1bf75-93fe-486f-bfdd-e6b6d02ab6561-350b7277560ac7520516606897974896-320-0.jpeg');
