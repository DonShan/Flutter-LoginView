import 'package:loginnew/data/baseApiService.dart';
import 'package:loginnew/data/networkApiService.dart';
import 'package:loginnew/models/movies_model.dart';
import 'package:loginnew/utility/app_url.dart';

class HomeRepository {
  BaseApiService _apiServices = NetworkApiService();

  Future<MovieListModel> fetchMovieList() async {
    try {
      dynamic response =
          await _apiServices.getApiResponse(AppUrl.movieListEndpoint);
      return response = MovieListModel.fromJson(response);
    } catch (e) {
      throw e;
    }
  }
}
