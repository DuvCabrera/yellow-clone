import 'package:yellowcat/data/cache/models/product_cm.dart';
import 'package:yellowcat/domain/models/product.dart';

extension ProductCMMapper on ProductCM {
  Product toDM() => Product(id,
      name: name,
      description: description,
      price: price,
      discount: discount,
      imageUrl: imageUrl);
}
