import 'package:flutter/material.dart';
import 'package:loginnew/view_model/auth_view_model.dart';
import 'package:loginnew/views/login.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => AuthViewModel())],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'MVVM login registration',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const Login(),
      ),
    );
  }
}
