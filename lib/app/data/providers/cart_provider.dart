import 'package:get/get.dart';

import '../models/cart_model.dart';

class CartProvider extends GetConnect {
  @override
  void onInit() {
    httpClient.defaultDecoder = (map) {
      if (map is Map<String, dynamic>) return Cart.fromJson(map);
      if (map is List) return map.map((item) => Cart.fromJson(item)).toList();
    };
    httpClient.baseUrl = 'YOUR-API-URL';
  }

  Future<Cart?> getCart(int id) async {
    final response = await get('cart/$id');
    return response.body;
  }

  Future<Response<Cart>> postCart(Cart cart) async => await post('cart', cart);
  Future<Response> deleteCart(int id) async => await delete('cart/$id');
}
