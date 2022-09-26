import 'package:flutter/material.dart';

InputDecoration buildInputDecoration(String hintText, IconData icon) {
  return InputDecoration(
    prefixIcon: Icon(
      icon,
      color: Color.fromRGBO(50, 62, 72, 1.0),
    ),
    hintText: hintText,
    contentPadding: const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
    border: OutlineInputBorder(borderRadius: BorderRadius.circular(5.0)),
  );
}

final forgotLabel = Row(
  mainAxisAlignment: MainAxisAlignment.spaceBetween,
  children: [
    const Padding(padding: EdgeInsets.all(0.0)),
    TextButton(
        onPressed: () {
          //    Navigator.pushReplacementNamed(context, "/Register");
        },
        child: const Text("Forgot Password")),
    TextButton(
        onPressed: () {
          //  Navigator.pushReplacementNamed(context, "routeName");
        },
        child: const Text("Sign up")),
  ],
);
