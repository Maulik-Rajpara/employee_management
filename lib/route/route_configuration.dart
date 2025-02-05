import 'package:employee_management/features/employee/presentation/screens/add_employee_detail_screen.dart';
import 'package:employee_management/features/employee/presentation/screens/employee_screen.dart';
import 'package:flutter/material.dart';

import '../features/onboard/presentation/screens/splash_screen.dart';

class RouteConfiguration {
  static const String splash = '/';
  static const String empList = '/employeeList';
  static const String empEditAdd = '/employeeEditAdd';



  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case splash:
        return createRoute(const SplashScreen(),settings);
      case empList:
        return createRoute(const EmployeeListScreen(),settings);
      case empEditAdd:
        return createRoute(AddEmployeeDetailScreen(),settings);

      default:
        return createRoute(_buildNotFoundPage(),settings);
    }
  }

  static Widget _buildNotFoundPage() {
    return const Scaffold(
      body: Center(child: Text('Page not found')),
    );
  }

  static Route createRoute(Widget screenName,RouteSettings? settings,
      {int? duration,Cubic? animation1=Curves.ease, Offset? offset}) {

    return PageRouteBuilder(settings: settings,
      transitionDuration:  Duration(milliseconds:duration??500),
      pageBuilder: (context, animation, secondaryAnimation) =>screenName,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        var begin = offset??const Offset(1.0,0.0);
        const end = Offset.zero;
        const curve = Curves.ease;
        var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
    );
  }

  static String currentRoute = '/'; // Default route

  static void setCurrentRoute(String route) {
    currentRoute = route;
  }

  static String getCurrentRoute() {
    return currentRoute;
  }


}