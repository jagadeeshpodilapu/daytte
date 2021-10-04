import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:daytte/services/base_service/app_exceptions.dart';
import 'package:http/http.dart' as http;

class BaseClient {
  static const int TIME_OUT_DURATION = 20;

  //Get
  Future<dynamic> get(String baseUrl, String endPoint) async {
    final uri = Uri.parse(baseUrl + endPoint);

    try {
      var response =
          await http.get(uri).timeout(Duration(seconds: TIME_OUT_DURATION));
      return _processResponse(response);
    } on SocketException {
      throw FetchDataException("No Internet connection", uri.toString());
    } on TimeoutException {
      throw ApiNotRespondingException('TimeOut', uri.toString());
    }
  }

//Post

  Future<dynamic> post(
      String baseUrl, String endPoint, dynamic payloadObj) async {
    final uri = Uri.parse(baseUrl + endPoint);
    var payload = jsonEncode(payloadObj);

    try {
      var response = await http
          .post(uri, body: payload)
          .timeout(Duration(seconds: TIME_OUT_DURATION));
      return _processResponse(response);
    } on SocketException {
      throw FetchDataException("No Internet connection", uri.toString());
    } on TimeoutException {
      throw ApiNotRespondingException('TimeOut', uri.toString());
    }
  }

//Delete

  dynamic _processResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        var responseJson = utf8.decode(response.bodyBytes);
        return responseJson;
        break;
      case 201:
        var responseJson = utf8.decode(response.bodyBytes);
        return responseJson;
        break;
      case 400:
        throw BadRequestException(
            utf8.decode(response.bodyBytes), response.request!.url.toString());
        break;
      case 401:
        break;
      case 403:
        throw UnAuthorizedException(
            utf8.decode(response.bodyBytes), response.request!.url.toString());
        break;
      case 500:
        break;
      default:
        throw FetchDataException(
            "Error occured with code:${response.statusCode}",
            response.request!.url.toString());
    }
  }
}
