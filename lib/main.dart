import 'package:employee_management/core/utils/app_colors.dart';
import 'package:employee_management/core/utils/strings.dart';
import 'package:employee_management/features/employee/presentation/bloc/employee_bloc.dart';
import 'package:employee_management/route/route_configuration.dart';
import 'package:employee_management/services/hive_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'features/onboard/presentation/screens/splash_screen.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter(); // Initialize Hive with a valid storage path
  await HiveService.init(); // Call your HiveService init method

  runApp(MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => EmployeeBloc(),lazy: true),
      ],
  child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: false,
      child: MaterialApp(
        title: Strings.appName, debugShowCheckedModeBanner: false,
        onGenerateRoute: RouteConfiguration.generateRoute,
        theme: ThemeData(
          textTheme: GoogleFonts.robotoTextTheme(textTheme).copyWith(
            bodyMedium: GoogleFonts.roboto(textStyle: textTheme.bodyMedium),
          ),
          colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primaryColor),
          useMaterial3: true,
        ),
        home: const SplashScreen(),
      ),
    );
  }
}
