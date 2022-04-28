import 'package:flutter/material.dart';
import 'package:step_front_task/screens/city_selection_screen.dart';
import 'package:step_front_task/screens/home_screen.dart';
import 'package:step_front_task/screens/launch_screen.dart';
import 'package:step_front_task/screens/login_screen.dart';

import '../screens/signup_screen.dart';

class AppRouter {
  Route onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case LoginScreen.routeName:
        return MaterialPageRoute(builder: (_) => LoginScreen());
      case SignUpScreen.routeName:
        return MaterialPageRoute(builder: (_) => SignUpScreen());
      case HomeScreen.routeName:
        return MaterialPageRoute(builder: (_) => HomeScreen());
      case LaunchScreen.routeName:
        return MaterialPageRoute(builder: (_) => LaunchScreen());
      case CitySelectionScreen.routeName:
        return MaterialPageRoute(builder: (_) => CitySelectionScreen());
      default:
        return MaterialPageRoute(builder: (_) => LoginScreen());
    }
  }
}
