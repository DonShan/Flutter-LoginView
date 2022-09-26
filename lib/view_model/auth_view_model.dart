import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:loginnew/repository/auth_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:loginnew/views/home_view.dart';

class AuthViewModel with ChangeNotifier {
  final _myRepo = AuthRepository();

  bool _loading = false;
  bool get loading => _loading;

  setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }

  Future<void> loginApi(dynamic data, BuildContext context) async {
    setLoading(true);
    _myRepo.loginApi(data).then((value) {
      setLoading(false);
      print("Log in Successfull ==========================>");
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const HomeView()),
      );
      if (kDebugMode) {
        print(value.toString());
      }
    }).onError((error, stackTrace) {
      setLoading(false);
      if (kDebugMode) {
        print(error.toString());
      }
    });
  }
}
