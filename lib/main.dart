import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:step_front_task/helpers/app_router.dart';
import 'package:step_front_task/logic/auth/auth_cubit.dart';
import 'package:step_front_task/logic/city/location_cubit.dart';
import 'package:step_front_task/logic/home/home_cubit.dart';
import 'package:step_front_task/screens/city_selection_screen.dart';
import 'package:step_front_task/screens/home_screen.dart';
import 'package:step_front_task/screens/launch_screen.dart';
import 'package:step_front_task/screens/login_screen.dart';
import 'package:step_front_task/screens/signup_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);
  AppRouter _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AuthCubit(),
        ),
        BlocProvider(
          create: (context) => HomeCubit(),
        ),
        BlocProvider(
          create: (context) => LocationCubit(),
        ),
      ],
      child: GetMaterialApp(
        onGenerateRoute: _appRouter.onGenerateRoute,
        initialRoute: LaunchScreen.routeName,
      ),
    );
  }
}
