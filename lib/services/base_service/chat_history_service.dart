import 'package:dio/dio.dart';

class ChatHistoryService {
  Future getChatHistory(String sender,String reciever,int page,int limit) async {
    try {
      var response = await Dio().get(
        "http://65.0.174.202:9000/chat?sender=$sender&receiver=$reciever&page=$page&limit=$limit",
      );
      print("service response ${response.data}");
      return response.data;
    } on DioError catch (e) {
      print("exception $e");
    }
  }
}
