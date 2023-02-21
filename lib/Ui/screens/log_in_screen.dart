import 'dart:async';

import 'package:PeaceLink/core/view-models/user_view_model.dart';
import 'package:flutter/material.dart';

import '../utilities/mediaQuery.dart';
import 'main_screen.dart';
import 'sign_up_screen.dart';

class LogIn extends StatefulWidget {
  const LogIn({Key? key}) : super(key: key);
  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  bool animate = false;
  String email = "";
  String pass = "";
  String error = "";
  UserProvider userProvider = UserProvider();
  @override
  void initState() {
    super.initState();
    setState(() {
      animate = false;
    });

    Timer(
        const Duration(seconds: 1),
        () => setState(() {
              animate = true;
            }));
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double deviceHeight = MediaQuery.of(context).size.height;
    double deviceWidth = MediaQuery.of(context).size.width;
    Mediaquery media =
        Mediaquery(mediaHeight: deviceHeight, mediaWidth: deviceWidth);
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              Container(
                height: media.getHeight(400),
                width: double.infinity,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/background.png"),
                      fit: BoxFit.fill),
                ),
                child: Stack(
                  children: [
                    Positioned(
                      left: media.getwidht(30),
                      width: deviceWidth * 0.2,
                      height: deviceHeight * 0.25,
                      child: AnimatedOpacity(
                        duration: const Duration(milliseconds: 2200),
                        opacity: animate ? 1 : 0,
                        curve: Curves.easeOutSine,
                        child: AnimatedSlide(
                          duration: const Duration(milliseconds: 1000),
                          offset: animate
                              ? const Offset(0, 0.01)
                              : const Offset(0, -1),
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
                      left: media.getwidht(140),
                      width: media.getwidht(80),
                      height: deviceHeight * 0.17,
                      child: AnimatedOpacity(
                        duration: const Duration(milliseconds: 2200),
                        opacity: animate ? 1 : 0,
                        curve: Curves.easeOutSine,
                        child: AnimatedSlide(
                          duration: const Duration(milliseconds: 1000),
                          offset: animate
                              ? const Offset(0, 0.01)
                              : const Offset(0, -1),
                          child: Container(
                            decoration: const BoxDecoration(
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
                        margin: EdgeInsets.only(top: media.getHeight(40)),
                        child: Center(
                          child: Text(
                            "LogIn",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: media.getwidht(40),
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
                padding: EdgeInsets.all(media.getwidht(30)),
                child: AnimatedOpacity(
                  duration: const Duration(milliseconds: 2200),
                  opacity: animate ? 1 : 0,
                  curve: Curves.easeOutSine,
                  child: Column(
                    children: [
                      Text(
                        error,
                        style: TextStyle(
                          color: Colors.red[600],
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(media.getwidht(5)),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: const [
                              BoxShadow(
                                color: Color.fromRGBO(143, 148, 251, 2),
                                blurRadius: 20.0,
                                offset: Offset(0, 10),
                              )
                            ]),
                        child: Column(
                          children: [
                            Container(
                              padding: EdgeInsets.all(media.getwidht(8)),
                              decoration: const BoxDecoration(
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
                              padding: EdgeInsets.all(media.getwidht(8)),
                              child: TextField(
                                obscureText: true,
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
                              height: media.getHeight(30),
                            ),
                            GestureDetector(
                              onTap: () async {
                                FocusScope.of(context).unfocus();
                                try {
                                  bool isconnected =
                                      await userProvider.authentificateUser(
                                          email: email, password: pass);

                                  if (isconnected) {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                MyApp(index: 2)));
                                  }
                                } catch (e) {
                                  print(e.toString());
                                  if (e.toString() ==
                                      "Exception: [firebase_auth/network-request-failed] A network error (such as timeout, interrupted connection or unreachable host) has occurred.") {
                                    setState(() {
                                      error = "internet is required to connect";
                                    });
                                  }
                                  if (e.toString() ==
                                      "Exception: [firebase_auth/wrong-password] The password is invalid or the user does not have a password.") {
                                    setState(() {
                                      error = "The password is invalid";
                                    });
                                  }
                                  if (e.toString() ==
                                      "Exception: [firebase_auth/invalid-email] The email address is badly formatted.") {
                                    setState(() {
                                      error =
                                          "The email address is badly formatted";
                                    });
                                  }
                                  if (e.toString() ==
                                      "Exception: [firebase_auth/user-not-found] There is no user record corresponding to this identifier. The user may have been deleted.") {
                                    setState(() {
                                      error =
                                          "There is no user with this email";
                                    });
                                  }
                                }
                              },
                              child: Container(
                                height: media.getHeight(50),
                                width: media.getHeight(220),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  gradient: const LinearGradient(
                                    colors: [
                                      Color.fromRGBO(143, 148, 251, 1),
                                      Color.fromRGBO(143, 148, 251, 0.9),
                                      Color.fromRGBO(143, 148, 251, 0.2),
                                    ],
                                  ),
                                ),
                                child: const Center(
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
                              height: media.getHeight(15),
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => const SignUp()));
                              },
                              child: Container(
                                height: media.getHeight(50),
                                width: media.getwidht(220),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  gradient: const LinearGradient(
                                    colors: [
                                      Color.fromRGBO(143, 148, 251, 0.2),
                                      Color.fromRGBO(143, 148, 251, 0.75),
                                      Color.fromRGBO(143, 148, 251, 1),
                                    ],
                                  ),
                                ),
                                child: const Center(
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
                              height: media.getHeight(40),
                            ),
                            const Text(
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
