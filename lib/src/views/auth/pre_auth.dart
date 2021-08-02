import 'dart:async';
import 'package:careerfinder/src/bloc/authBloc/auth_bloc.dart';
import 'package:careerfinder/src/bloc/authBloc/auth_event.dart';
import 'package:careerfinder/src/bloc/authBloc/auth_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PreauthScreen extends StatefulWidget {
  @override
  _PreauthScreenState createState() => _PreauthScreenState();
}

class _PreauthScreenState extends State<PreauthScreen> {
  var _authBloc;

  @override
  void initState() {
    _authBloc = BlocProvider.of<AuthBloc>(context);
    _authBloc..add(AuthCheckEvent());

    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (BuildContext context, AuthState state) {
        print(state);
        if (state is UserLoggedInState) {
          return Navigator.pushReplacementNamed(context, '/homescreen');
        } else if (state is UserNotLoggedInState) {
          return Navigator.pushReplacementNamed(context, '/loginscreen');
        }
      },
      child: Scaffold(),
    );
  }
}
