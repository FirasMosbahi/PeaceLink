import 'dart:async';

import 'package:chat_for_peace/core/view-models/user_view_model.dart';
import 'package:flutter/material.dart';

import 'MainScreen.dart';
import 'SignUp.dart';
import 'template.dat.dart';

class logIn extends StatefulWidget {
  const logIn({Key? key}) : super(key: key);

  @override
  State<logIn> createState() => _logInState();
}

class _logInState extends State<logIn> {
  bool animate = false;
  String email = "";
  String pass = "";
  UserProvider userProvider = UserProvider();
  @override
  void initState() {
    setState(() {
      animate = false;
    });
    Timer(
        Duration(seconds: 1),
        () => setState(() {
              animate = true;
            }));
  }

  @override
  Widget build(BuildContext context) {
    double deviceHeight = MediaQuery.of(context).size.height;
    double deviceWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              Container(
                height: 400,
                width: double.infinity,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/background.png"),
                      fit: BoxFit.fill),
                ),
                child: Stack(
                  children: [
                    Positioned(
                      left: 30,
                      width: deviceWidth * 0.2,
                      height: deviceHeight * 0.25,
                      child: AnimatedOpacity(
                        duration: Duration(milliseconds: 2200),
                        opacity: animate ? 1 : 0,
                        curve: Curves.easeOutSine,
                        child: AnimatedSlide(
                          duration: Duration(milliseconds: 1000),
                          offset: animate ? Offset(0, 0.01) : Offset(0, -1),
                          child: Container(
                            child: Image.asset(
                              "assets/light-1.png",
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      left: 140,
                      width: 80,
                      height: deviceHeight * 0.17,
                      child: AnimatedOpacity(
                        duration: Duration(milliseconds: 2200),
                        opacity: animate ? 1 : 0,
                        curve: Curves.easeOutSine,
                        child: AnimatedSlide(
                          duration: Duration(milliseconds: 1000),
                          offset: animate ? Offset(0, 0.01) : Offset(0, -1),
                          child: Container(
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage("assets/light-2.png"),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      child: Container(
                        margin: EdgeInsets.only(top: 50),
                        child: Center(
                          child: Text(
                            "LogIn",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 40,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.all(30),
                child: AnimatedOpacity(
                  duration: Duration(milliseconds: 2200),
                  opacity: animate ? 1 : 0,
                  curve: Curves.easeOutSine,
                  child: Column(
                    children: [
                      Container(
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                color: Color.fromRGBO(143, 148, 251, 2),
                                blurRadius: 20.0,
                                offset: Offset(0, 10),
                              )
                            ]),
                        child: Column(
                          children: [
                            Container(
                              padding: EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                border: Border(
                                  bottom: BorderSide(
                                    color: Color(0xFFF5F5F5),
                                  ),
                                ),
                              ),
                              child: TextField(
                                onChanged: (value) {
                                  email = value;
                                },
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: "Email",
                                  hintStyle: TextStyle(
                                    color: Colors.grey[400],
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.all(8),
                              child: TextField(
                                onChanged: (value) {
                                  pass = value;
                                },
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: "Password",
                                  hintStyle: TextStyle(
                                    color: Colors.grey[400],
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            GestureDetector(
                              onTap: () {
                                try {
                                  userProvider.authentificateUser(
                                      email: email, password: pass);
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              MyApp(2, appBar)));
                                } catch (e) {
                                  debugPrint(e.toString());
                                }
                              },
                              child: Container(
                                height: 50,
                                width: 220,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  gradient: LinearGradient(
                                    colors: [
                                      Color.fromRGBO(143, 148, 251, 1),
                                      Color.fromRGBO(143, 148, 251, 0.9),
                                      Color.fromRGBO(143, 148, 251, 0.2),
                                    ],
                                  ),
                                ),
                                child: Center(
                                  child: Text(
                                    "Login",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => signUp()));
                              },
                              child: Container(
                                height: 50,
                                width: 220,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  gradient: LinearGradient(
                                    colors: [
                                      Color.fromRGBO(143, 148, 251, 0.2),
                                      Color.fromRGBO(143, 148, 251, 0.75),
                                      Color.fromRGBO(143, 148, 251, 1),
                                    ],
                                  ),
                                ),
                                child: Center(
                                  child: Text(
                                    "Sign Up",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 70,
                            ),
                            Text(
                              "Forget Password ?",
                              style: TextStyle(
                                color: Color.fromRGBO(143, 148, 251, 1),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
