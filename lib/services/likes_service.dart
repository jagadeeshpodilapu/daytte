import 'package:daytte/services/base_service/base_client.dart';
import 'package:dio/dio.dart';

class LikesService {
  Future postLikes(Map<String, dynamic> payload, String token) async {
    try {
      var response = await Dio()
          .post(BaseClient.baseUrl + 'like',
              data: payload,
              options: Options(headers: {
                'Content-Type': 'application/json',
                'Authorization': "Bearer $token",
              }))
          .timeout(Duration(seconds: 20));
      print("service response ${response.data}");
      return response.data;
    } on DioError {}
  }
}
