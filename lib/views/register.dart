import 'package:flutter/material.dart';
import 'package:loginnew/utility/widgets.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  late String _userName, _confirmPassword, _Password;

  final fromKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Register"),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(40.0),
          child: Form(
            key: fromKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("Email"),
                const SizedBox(
                  height: 15.0,
                ),
                TextFormField(
                  autofocus: false,
                  onSaved: (value) => _userName = value!,
                  decoration: buildInputDecoration("Enter Email", Icons.email),
                ),
                const Text("Password"),
                const SizedBox(
                  height: 15.0,
                ),
                TextFormField(
                  autofocus: false,
                  onSaved: (value) => _userName = value!,
                  decoration: buildInputDecoration("Password", Icons.lock),
                ),
                const SizedBox(
                  height: 15.0,
                ),
                const Text("Confirm Password"),
                const SizedBox(
                  height: 15.0,
                ),
                TextFormField(
                  autofocus: false,
                  onSaved: (value) => _Password = value!,
                  decoration:
                      buildInputDecoration("Confirm Password", Icons.lock),
                ),
                const SizedBox(
                  height: 15.0,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.red, // background
                    onPrimary: Colors.white, // foreground
                  ),
                  onPressed: () {},
                  child: const Text('Register'),
                ),
                const SizedBox(
                  height: 15.0,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
