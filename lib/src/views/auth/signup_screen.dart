import 'dart:async';

import 'package:careerfinder/src/bloc/authBloc/auth_bloc.dart';
import 'package:careerfinder/src/bloc/authBloc/auth_event.dart';
import 'package:careerfinder/src/bloc/authBloc/auth_states.dart';
import 'package:careerfinder/src/constants/contants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignupScreen extends StatefulWidget {
  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  TextEditingController _name = TextEditingController();
  TextEditingController _email = TextEditingController();
  TextEditingController _mobileNumber = TextEditingController();
  TextEditingController _password = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  int indx = 0;
  String _radioUserType;

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
    _authBloc..add(StartEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    final msg = BlocBuilder<AuthBloc, AuthState>(
      builder: (BuildContext context, AuthState state) {
        print(state);
        if (state is AuthInitState) {
          print("this state");
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
        } else if (state is UserSignedup) {
          return Center(
            child: Text(
              "Account created. Verify your email then login",
              style: TextStyle(
                color: Colors.green,
              ),
            ),
          );
        } else {
          return Container();
        }
      },
    );
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: scaffoldBgColor,
          leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            ),
          ),
        ),
        body: BlocListener<AuthBloc, AuthState>(
          listener: (BuildContext context, AuthState state) {
            print(state);
            if (state is UserSignedup) {
              Timer(Duration(seconds: 2), () {
                Navigator.pushReplacementNamed(context, '/preauthscreen');
              });
            }
          },
          child: Container(
            color: Color(0xFFeeeeee),
            height: height,
            width: width,
            child: ListView(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Signup",
                      style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: primaryBlue),
                    ),
                  ],
                ),
                SizedBox(
                  height: height * 0.02,
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
                  height: height * 0.02,
                ),
                _loginForm(),
                msg
              ],
            ),
          ),
        ));
  }

  _loginForm() {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Form(
      key: _formKey,
      child: Container(
        width: width,
        child: ListView(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          children: [
            Container(
              margin: EdgeInsets.symmetric(horizontal: width * 0.08),
              child: TextFormField(
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    decoration: TextDecoration.none,
                    fontWeight: FontWeight.bold),
                decoration: InputDecoration(
                    contentPadding:
                        EdgeInsets.only(top: 20, left: 4, right: 5, bottom: 5),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey, width: 1),
                    ),
                    //  hintText: 'Email',
                    labelText: 'Your Email',
                    hintStyle: TextStyle(
                        color: primaryBlue,
                        fontSize: 16,
                        fontWeight: FontWeight.normal),
                    focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: primaryBlue, width: 1))),
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
              height: height * 0.02,
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: width * 0.08),
              child: TextFormField(
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    decoration: TextDecoration.none,
                    fontWeight: FontWeight.bold),
                decoration: InputDecoration(
                    contentPadding:
                        EdgeInsets.only(top: 20, left: 4, right: 5, bottom: 5),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey, width: 1),
                    ),
                    //  hintText: 'Email',
                    labelText: 'Your Name',
                    hintStyle: TextStyle(
                        color: primaryBlue,
                        fontSize: 16,
                        fontWeight: FontWeight.normal),
                    focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: primaryBlue, width: 1))),
                autofocus: false,
                controller: _name,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Name is required';
                  }
                  return null;
                },
              ),
            ),
            SizedBox(
              height: height * 0.02,
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: width * 0.08),
              child: TextFormField(
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    decoration: TextDecoration.none,
                    fontWeight: FontWeight.bold),
                decoration: InputDecoration(
                    contentPadding:
                        EdgeInsets.only(top: 20, left: 4, right: 5, bottom: 5),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey, width: 1),
                    ),
                    //  hintText: 'Email',
                    labelText: 'Your Number',
                    hintStyle: TextStyle(
                        color: primaryBlue,
                        fontSize: 16,
                        fontWeight: FontWeight.normal),
                    focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: primaryBlue, width: 1))),
                autofocus: false,
                //    validator: requiredValidator,
                controller: _mobileNumber,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Phone Number is required';
                  }
                  return null;
                },
              ),
            ),
            SizedBox(
              height: height * 0.01,
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: width * 0.08),
              child: TextFormField(
                obscureText: true,
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    decoration: TextDecoration.none,
                    fontWeight: FontWeight.bold),
                decoration: InputDecoration(
                  contentPadding:
                      EdgeInsets.only(top: 20, left: 4, right: 5, bottom: 5),
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
                      borderSide: BorderSide(color: primaryBlue, width: 1)),
                ),
                autofocus: false,
                controller: _password,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Password is required';
                  }
                  return null;
                },
              ),
            ),
            SizedBox(
              height: height * 0.03,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    if (_formKey.currentState.validate()) {
                      _authBloc
                        ..add(SignupButtonPressed(
                            userType: _radioUserType.toLowerCase(),
                            email: _email.text.toLowerCase(),
                            password: _password.text,
                            mobileNumber: _mobileNumber.text,
                            name: _name.text));
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
                      "Sign up",
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    )),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: height * 0.04,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 50,
                  child: Text(
                    "Already have an account ? ",
                    style: TextStyle(
                      fontSize: 14,
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, '/loginscreen');
                  },
                  child: Container(
                    height: 50,
                    child: Text(
                      "Login",
                      style: TextStyle(fontSize: 14, color: primaryBlue),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
