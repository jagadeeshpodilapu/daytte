import 'package:dio/dio.dart';

class CreateChatService {
  Future chatCreate(Map<String, dynamic> payload) async {
    try {
      var response = await Dio().post(
        "http://65.0.174.202:9000/chat",
        data: payload,
        
      );
      print("service response ${response.data}");
      return response.data;
    } on DioError catch (e) {
      print("exception $e");
    }
  }
}