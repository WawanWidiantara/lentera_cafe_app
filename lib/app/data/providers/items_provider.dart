import 'package:get/get.dart';

import '../models/items_model.dart';

class ItemsProvider extends GetConnect {
  @override
  void onInit() {
    httpClient.defaultDecoder = (map) {
      if (map is Map<String, dynamic>) return Items.fromJson(map);
      if (map is List) return map.map((item) => Items.fromJson(item)).toList();
    };
    httpClient.baseUrl = 'YOUR-API-URL';
  }

  Future<Items?> getItems(int id) async {
    final response = await get('items/$id');
    return response.body;
  }

  Future<Response<Items>> postItems(Items items) async =>
      await post('items', items);
  Future<Response> deleteItems(int id) async => await delete('items/$id');
}
