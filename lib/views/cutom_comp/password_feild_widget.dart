import 'package:flutter/material.dart';

class PasswordDetailWidget extends StatefulWidget {
  final TextEditingController controller;
  const PasswordDetailWidget({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  State<PasswordDetailWidget> createState() => _PasswordDetailWidgetState();
}

class _PasswordDetailWidgetState extends State<PasswordDetailWidget> {
  String? _password;

  @override
  Widget build(BuildContext context) => TextFormField(
        controller: widget.controller,
        autofocus: false,
        decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
          hintText: "password",
          prefixIcon: const Icon(Icons.lock),
        ),
        keyboardType: TextInputType.visiblePassword,
        autofillHints: const [AutofillHints.password],
        validator: ((value) {
          if (value != null && value.length < 7) {
            return "Enter min. 7 characters";
          } else {
            return null;
          }
        }),
        onSaved: (value) => _password = value!,
      );
}
