import 'package:another_flushbar/flushbar_route.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:loginnew/utility/utils.dart';
import 'package:loginnew/utility/widgets.dart';
import 'package:loginnew/view_model/auth_view_model.dart';
import 'package:loginnew/views/cutom_comp/email_field_widget.dart';
import 'package:loginnew/views/cutom_comp/password_feild_widget.dart';
import 'package:loginnew/views/cutom_comp/round_button.dart';
import 'package:loginnew/views/register.dart';
import 'package:provider/provider.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
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
            key: formKey,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("Email"),
                const SizedBox(
                  height: 15.0,
                ),
                EmailDeildWidget(controller: _emailController),
                const SizedBox(
                  height: 15.0,
                ),
                const Text("Password"),
                const SizedBox(
                  height: 15.0,
                ),
                PasswordDetailWidget(controller: _passwordController),
                const SizedBox(
                  height: 15.0,
                ),
                RoundButton(
                    title: "Log in",
                    loading: authViewModel.loading,
                    onPress: () {
                      final form = formKey.currentState!;
                      if (form.validate()) {
                        final email = _emailController.text;
                        ScaffoldMessenger.of(context)
                          ..removeCurrentSnackBar()
                          ..showSnackBar(
                              SnackBar(content: Text("Your Email is $email")));
                        Map data = {
                          'email': 'eve.holt@reqres.in',
                          'password': 'cityslicka',
                        };
                        authViewModel.loginApi(data, context);
                        print("api hit");
                      }
                    }),
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
