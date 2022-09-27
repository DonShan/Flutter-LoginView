import 'package:flutter/material.dart';
import 'package:loginnew/view_model/auth_view_model.dart';
import 'package:loginnew/views/register.dart';
import 'package:loginnew/utility/widgets.dart';
import 'package:provider/provider.dart';

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
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.red, // background
                    onPrimary: Colors.white, // foreground
                  ),
                  onPressed: () {
                    Map data = {
                      'email': _userName.toString(),
                      'password': _password.toString(),
                    };
                    authViewModel.loginApi(data, context);
                    print("api hit");
                  },
                  child: const Text('Log in'),
                ),
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
