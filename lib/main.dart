import 'package:careerfinder/src/bloc/authBloc/auth_bloc.dart';
import 'package:careerfinder/src/bloc/authBloc/auth_states.dart';
import 'package:careerfinder/src/bloc/jobBloc/job_bloc.dart';
import 'package:careerfinder/src/bloc/jobBloc/job_states.dart';
import 'package:careerfinder/src/constants/contants.dart';
import 'package:careerfinder/src/repositories/auth_repository.dart';
import 'package:careerfinder/src/repositories/job_repository.dart';
import 'package:careerfinder/src/splash_screen.dart';
import 'package:careerfinder/src/views/auth/login_screen.dart';
import 'package:careerfinder/src/views/auth/pre_auth.dart';
import 'package:careerfinder/src/views/auth/signup_screen.dart';
import 'package:careerfinder/src/views/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthBloc>(
            create: (context) => AuthBloc(
                initialState: AuthInitState(),
                authRepository: AuthRepository())),
        BlocProvider<JobBloc>(
            create: (context) => JobBloc(
                initialState: JobInitState(), jobRepository: JobRepository())),
      ],
      child: MaterialApp(
        theme: ThemeData(
          scaffoldBackgroundColor: scaffoldBgColor,
          textTheme: GoogleFonts.poppinsTextTheme(
            Theme.of(context).textTheme,
          ),
        ),
        debugShowCheckedModeBanner: false,
        initialRoute: '/',
        routes: {
          '/': (context) => SplashScreen(),
          '/preauthscreen': (context) => PreauthScreen(),
          '/homescreen': (context) => HomeScreen(),
          '/loginscreen': (context) => LoginScreen(),
          '/signupscreen': (context) => SignupScreen(),
        },
      ),
    );
  }
}
