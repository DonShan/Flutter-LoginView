import 'package:flutter/foundation.dart';

import 'package:flutter/material.dart';
import 'package:loginnew/models/user_models.dart';
import 'package:loginnew/view_model/user_view_model.dart';
import 'package:loginnew/views/home_view.dart';
import 'package:loginnew/views/login.dart';

class SplashServices {
  Future<UserModel> getUserData() => UserViewModel().getUser();

  void checkAuthantication(BuildContext context) async {
    getUserData().then((value) async {
      print(value.token);
      if (value.token == null || value.token == '') {
        await Future.delayed(Duration(seconds: 3));
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const Login()),
        );
      } else {
        await Future.delayed(Duration(seconds: 3));
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const HomeView()),
        );
      }
    }).onError((error, stackTrace) {
      if (kDebugMode) {
        print(error.toString());
      }
    });
  }
}
