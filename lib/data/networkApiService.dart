import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart';
import 'package:loginnew/data/app_exception.dart';
import 'package:loginnew/data/baseApiService.dart';
import 'package:http/http.dart' as http;

class NetworkApiService extends BaseApiService {
  @override
  Future getApiResponse(String url) async {
    dynamic reponseJson;
    try {
      final response =
          await http.get(Uri.parse(url)).timeout(const Duration(seconds: 10));
      reponseJson = returnResponse(response);
    } on SocketException {
      throw FetachDataException("No Internet Connection");
    }
    return reponseJson;
  }

  @override
  Future getPostApiResponse(String url, data) async {
    dynamic reponseJson;
    try {
      Response response = await http
          .post(Uri.parse(url), body: data)
          .timeout(const Duration(seconds: 10));
      reponseJson = returnResponse(response);
    } on SocketException {
      throw FetachDataException("No Internet Connection");
    }
    return reponseJson;
  }

  dynamic returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        dynamic responseJson = jsonDecode(response.body);
        return responseJson;
      case 400:
        throw BadRequestException(response.body.toString());
      case 500:
      case 404:
        throw UnauthorisedException(response.body.toString());
      default:
        throw FetachDataException(
            "Error accured while communicating with server" +
                "with staus code" +
                response.statusCode.toString());
    }
  }
}
