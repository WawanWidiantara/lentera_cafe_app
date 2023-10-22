import 'package:get/get.dart';

import '../models/notif_model.dart';

class NotifProvider extends GetConnect {
  @override
  void onInit() {
    httpClient.defaultDecoder = (map) {
      if (map is Map<String, dynamic>) return Notif.fromJson(map);
      if (map is List) return map.map((item) => Notif.fromJson(item)).toList();
    };
    httpClient.baseUrl = 'YOUR-API-URL';
  }

  Future<Notif?> getNotif(int id) async {
    final response = await get('notif/$id');
    return response.body;
  }

  Future<Response<Notif>> postNotif(Notif notif) async =>
      await post('notif', notif);
  Future<Response> deleteNotif(int id) async => await delete('notif/$id');
}
