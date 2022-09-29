import 'package:flutter/material.dart';
import 'package:loginnew/data/response/api_response.dart';
import 'package:loginnew/models/movies_model.dart';
import 'package:loginnew/repository/home-repository.dart';

class HomeViewViewModel with ChangeNotifier {
  final _myRepo = HomeRepository();

  ApiResponse<MovieListModel> moviewsList = ApiResponse.loading();

  setMovieList(ApiResponse<MovieListModel> response) {
    moviewsList = response;
    notifyListeners();
  }

  Future<void> fetchMoviewListApi() async {
    setMovieList(ApiResponse.loading());
    _myRepo.fetchMovieList().then((value) {
      setMovieList(ApiResponse.completed(value));
    }).onError((error, stackTrace) {
      setMovieList(ApiResponse.error(error.toString()));
    });
  }
}
