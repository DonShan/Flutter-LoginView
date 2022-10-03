import 'package:flutter/material.dart';
import 'package:loginnew/utility/utils.dart';
import 'package:loginnew/view_model/auth_view_model.dart';
import 'package:loginnew/views/cutom_comp/round_button.dart';
import 'package:loginnew/views/register.dart';
import 'package:loginnew/utility/widgets.dart';
import 'package:provider/provider.dart';
import 'package:another_flushbar/flushbar_route.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../utility/validater.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  String? _userName, _password;

  @override
  Widget build(BuildContext context) {
    final authViewModel = Provider.of<AuthViewModel>(context);

    TextEditingController _emailController = TextEditingController();
    TextEditingController _passwordController = TextEditingController();

    @override
    void dispose() {
      super.dispose();

      _emailController.dispose();
      _passwordController.dispose();
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("Log in"),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(40.0),
          child: Form(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("Email"),
                const SizedBox(
                  height: 15.0,
                ),
                TextFormField(
                  autofocus: false,
                  //       validator: validateEmail,
                  onSaved: (value) => _userName = value!,
                  decoration: buildInputDecoration("Enter Email", Icons.email),
                ),
                const SizedBox(
                  height: 15.0,
                ),
                const Text("Password"),
                const SizedBox(
                  height: 15.0,
                ),
                TextFormField(
                  autofocus: false,
                  obscureText: true,
                  onSaved: (value) => _password = value!,
                  decoration:
                      buildInputDecoration("Enter Password", Icons.lock),
                ),
                const SizedBox(
                  height: 15.0,
                ),

                RoundButton(
                    title: "Log in",
                    loading: authViewModel.loading,
                    onPress: () {
                      if (_emailController.text.isEmpty) {
                        Utill.toastMessage("please enter email");
                      } else if (_passwordController.text.isEmpty) {
                        Utill.toastMessage("Please Enter Password");
                      } else if (_passwordController.text.length < 6) {
                        Utill.toastMessage("Please enter 6 digit password");
                      } else {
                        //This should be Map data
                      }

                      Map data = {
                        'email': 'eve.holt@reqres.in',
                        'password': 'cityslicka',
                      };
                      authViewModel.loginApi(data, context);
                      print("api hit");

                      // Map data = {
                      //   'email': _userName?.toString(),
                      //   'password': _password?.toString(),
                      // };
                      // authViewModel.loginApi(data, context);
                      // print("api hit");
                    }),
                // ElevatedButton(
                //   style: ElevatedButton.styleFrom(
                //     primary: Colors.red, // background
                //     onPrimary: Colors.white, // foreground
                //   ),
                //   child: const Text('Log in'),
                //   onPressed: () {
                //     if (_emailController.text.isEmpty) {
                //       Utill.toastMessage("please enter email");
                //     } else if (_passwordController.text.isEmpty) {
                //       Utill.toastMessage("Please Enter Password");
                //     } else if (_passwordController.text.length < 6) {
                //       Utill.toastMessage("Please enter 6 digit password");
                //     } else {
                //       //This should be Map data
                //     }
                //     Map data = {
                //       'email': _userName?.toString(),
                //       'password': _password?.toString(),
                //     };
                //     authViewModel.loginApi(data, context);
                //     print("api hit");
                //   },
                // ),
                const SizedBox(
                  height: 15.0,
                ),
                TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Register()),
                      );
                    },
                    child: const Text("Sign up")),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
