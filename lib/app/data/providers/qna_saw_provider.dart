import 'package:get/get.dart';

import '../models/qna_saw_model.dart';

class QnaSawProvider extends GetConnect {
  @override
  void onInit() {
    httpClient.defaultDecoder = (map) {
      if (map is Map<String, dynamic>) return QnaSaw.fromJson(map);
      if (map is List) return map.map((item) => QnaSaw.fromJson(item)).toList();
    };
    httpClient.baseUrl = 'YOUR-API-URL';
  }

  Future<QnaSaw?> getQnaSaw(int id) async {
    final response = await get('qnasaw/$id');
    return response.body;
  }

  Future<Response<QnaSaw>> postQnaSaw(QnaSaw qnasaw) async =>
      await post('qnasaw', qnasaw);
  Future<Response> deleteQnaSaw(int id) async => await delete('qnasaw/$id');
}
