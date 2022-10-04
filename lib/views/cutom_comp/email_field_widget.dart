import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:loginnew/views/login.dart';

class EmailDeildWidget extends StatefulWidget {
  final TextEditingController controller;
  const EmailDeildWidget({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  State<EmailDeildWidget> createState() => _EmailDeildWidgetState();
}

class _EmailDeildWidgetState extends State<EmailDeildWidget> {
  String? _userName;

  @override
  Widget build(BuildContext context) => TextFormField(
        controller: widget.controller,
        autofocus: false,
        decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
          hintText: "email",
          prefixIcon: const Icon(Icons.mail),
        ),
        keyboardType: TextInputType.emailAddress,
        autofillHints: const [AutofillHints.email],
        validator: (email) => email != null && !EmailValidator.validate(email)
            ? "Enter Valid Email"
            : null,
        onSaved: (value) => _userName = value!,
      );
}
