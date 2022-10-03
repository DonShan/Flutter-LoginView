import 'package:flutter/material.dart';
import '../view_model/spalsh_services.dart';

class SpalashView extends StatefulWidget {
  const SpalashView({super.key});

  @override
  State<SpalashView> createState() => _SpalashViewState();
}

class _SpalashViewState extends State<SpalashView> {
  SplashServices splashServices = SplashServices();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    splashServices.checkAuthantication(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'Splash screen',
          style: Theme.of(context).textTheme.headline4,
        ),
      ),
    );
  }
}
