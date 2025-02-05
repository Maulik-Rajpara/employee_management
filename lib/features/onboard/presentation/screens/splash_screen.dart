import 'package:employee_management/features/employee/presentation/screens/employee_screen.dart';
import 'package:flutter/material.dart';

import '../../../../route/route_configuration.dart';
import '../widgets/splash_widget.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    redirectScreen(context);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: SplashWidget());
  }
  void redirectScreen(context) async{
    await Future.delayed(const Duration(seconds: 3));
    Navigator.of(context).pushReplacementNamed(RouteConfiguration.empList);

  }
}
