import 'package:dio/dio.dart';

class LikesService {
  Future postLikes(Map<String, dynamic> payload, String token) async {
    try {
      var response = await Dio().post(
        "http://65.0.174.202:8000/like",
        data: payload,
        options: Options(
          headers: {
            'Content-Type': 'application/json',
            'Authorization': "Bearer $token",
          },
        ),
      );
      print("service response ${response.data}");
      return response.data;
    } on DioError {}
  }
}
