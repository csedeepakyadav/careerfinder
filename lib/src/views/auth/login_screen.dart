import 'package:careerfinder/src/bloc/authBloc/auth_bloc.dart';
import 'package:careerfinder/src/bloc/authBloc/auth_event.dart';
import 'package:careerfinder/src/bloc/authBloc/auth_states.dart';
import 'package:careerfinder/src/constants/contants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  int indx = 0;
  String _radioUserType;

  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  void chooseUserType(String value) {
    if (mounted) {
      setState(() {
        _radioUserType = value;

        if (indx == 0) {
          setState(() {
            indx = 1;
          });
        } else {
          setState(() {
            indx = 0;
          });
        }
      });
    }
  }

  AuthBloc _authBloc;

  @override
  void initState() {
    setState(() {
      _radioUserType = "Seeker";
    });

    _authBloc = BlocProvider.of<AuthBloc>(context);
    //  _authBloc..add(AuthCheckEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    final msg = BlocBuilder<AuthBloc, AuthState>(
      builder: (BuildContext context, AuthState state) {
        //print(state);
        if (state is AuthInitState) {
        }
        if (state is AuthErrorState) {
          return Center(
            child: Text(
              state.message,
              style: TextStyle(
                color: Colors.red,
              ),
            ),
          );
        } else if (state is AuthLoadingState) {
          return Center(child: CircularProgressIndicator());
        } else {
          return Container();
        }
      },
    );
    return Scaffold(
        body: BlocListener<AuthBloc, AuthState>(
            listener: (BuildContext context, AuthState state) {
           //   print(state);

              if (state is UserLoginSuccessState) {
                return Navigator.pushReplacementNamed(
                    context, '/preauthscreen');
              }/*  else if (state is UserLoggedInState) {
                return Navigator.pushReplacementNamed(
                    context, '/preauthscreen');
              } */
            },
            child: Container(
              color: Color(0xFFeeeeee),
              height: height,
              width: width,
              child: ListView(
                children: [
                  SizedBox(
                    height: height * 0.04,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Login",
                        style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: primaryBlue),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: height * 0.04,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Row(
                        children: <Widget>[
                          Radio(
                            value: 'Seeker',
                            groupValue: _radioUserType,
                            onChanged: chooseUserType,
                            activeColor: primaryBlue,
                          ),
                          Text(
                            "Seeker",
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: _radioUserType == "Seeker"
                                    ? primaryBlue
                                    : Colors.black),
                          ),
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          Radio(
                            value: 'Recruiter',
                            groupValue: _radioUserType,
                            onChanged: chooseUserType,
                            activeColor: primaryBlue,
                          ),
                          Text(
                            "Recruiter",
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: _radioUserType == "Recruiter"
                                    ? primaryBlue
                                    : Colors.black),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: height * 0.05,
                  ),
                  _loginForm(),
                  SizedBox(
                    height: height * 0.02,
                  ),
                  msg
                ],
              ),
            )));
  }

  _loginForm() {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Container(
      //  height: height,
      width: width,
      child: ListView(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        children: [
          Form(
              key: _formKey,
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: width * 0.08),
                    child: TextFormField(
                      //  enabled: isEmailEnabled,
                      enabled: true,
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          decoration: TextDecoration.none,
                          fontWeight: FontWeight.bold),
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.only(
                              top: 20, left: 4, right: 5, bottom: 5),
                          enabledBorder: UnderlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.grey, width: 1),
                          ),
                          //  hintText: 'Email',
                          labelText: 'Your Email',
                          hintStyle: TextStyle(
                              color: primaryBlue,
                              fontSize: 16,
                              fontWeight: FontWeight.normal),
                          focusedBorder: UnderlineInputBorder(
                              borderSide:
                                  BorderSide(color: primaryBlue, width: 1))),
                      autofocus: false,
                      controller: _email,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Email is Required';
                        }
                        return null;
                      },
                    ),
                  ),
                  SizedBox(
                    height: height * 0.03,
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: width * 0.08),
                    child: TextFormField(
                      obscureText: true,
                      enabled: true,
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          decoration: TextDecoration.none,
                          fontWeight: FontWeight.bold),
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.only(
                            top: 20, left: 4, right: 5, bottom: 5),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey, width: 1),
                        ),
                        //  hintText: 'Email',
                        labelText: 'Password',
                        hintStyle: TextStyle(
                            color: primaryBlue,
                            fontSize: 16,
                            fontWeight: FontWeight.normal),
                        focusedBorder: UnderlineInputBorder(
                            borderSide:
                                BorderSide(color: primaryBlue, width: 1)),
                      ),
                      autofocus: false,
                      controller: _password,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Password is Required';
                        }
                        return null;
                      },
                    ),
                  ),
                ],
              )),
          SizedBox(
            height: height * 0.08,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {
                  if (_formKey.currentState.validate()) {
                    _authBloc.add(LoginButtonPressed(
                        email: _email.text.toLowerCase(),
                        password: _password.text,
                        userType: _radioUserType.toLowerCase()));
                  }
                },
                child: Container(
                  height: 45,
                  padding: EdgeInsets.symmetric(horizontal: width * 0.15),
                  decoration: BoxDecoration(
                      gradient: buttonBgGradient,
                      borderRadius: BorderRadius.circular(25),
                      boxShadow: [
                        BoxShadow(
                            blurRadius: 3,
                            color: Colors.grey,
                            offset: Offset(0, 2),
                            spreadRadius: 2)
                      ]),
                  child: Center(
                      child: Text(
                    "Sign in",
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  )),
                ),
              ),
            ],
          ),
          SizedBox(
            height: height * 0.05,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 50,
                child: Text(
                  "Don't have an account ? ",
                  style: TextStyle(
                    fontSize: 14,
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, '/signupscreen');
                },
                child: Container(
                  height: 50,
                  child: Text(
                    "Register Now",
                    style: TextStyle(fontSize: 14, color: primaryBlue),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
