import 'package:loginnew/data/baseApiService.dart';
import 'package:loginnew/data/networkApiService.dart';
import 'package:loginnew/utility/app_url.dart';

class AuthRepository {
  BaseApiService _apiServices = NetworkApiService();

  Future<dynamic> loginApi(dynamic data) async {
    try {
      dynamic response =
          await _apiServices.getApiResponse(AppUrl.loginUrlEndpoint);
    } catch (e) {
      throw e;
    }
  }

  Future<dynamic> registerApi(dynamic data) async {
    try {
      dynamic response = await _apiServices.getPostApiResponse(
          AppUrl.registerApiEndpoint, data);
      return response;
    } catch (e) {
      throw e;
    }
  }
}
