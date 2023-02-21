import 'dart:async';

import 'package:PeaceLink/core/models/user_model.dart';
import 'package:PeaceLink/core/view-models/user_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../utilities/mediaQuery.dart';
import 'log_in_screen.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _LogInState();
}

class _LogInState extends State<SignUp> {
  String email = "";
  String name = "";
  String pass = "";
  String age = "";
  bool isSpec = false;
  bool animate = false;
  bool obsc = true;
  String error = "";
  UserProvider userProvider = UserProvider();
  @override
  void initState() {
    super.initState();
    setState(
      () {
        animate = false;
      },
    );
    Timer(
        const Duration(seconds: 1),
        () => setState(() {
              animate = true;
            }));
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
                height: media.getHeight(330),
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
                        margin: EdgeInsets.only(
                          top: media.getwidht(60),
                        ),
                        child: Center(
                          child: Text(
                            "SignUp",
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
                padding: EdgeInsets.only(
                  left: media.getwidht(30),
                  right: media.getwidht(30),
                ),
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
                        padding: EdgeInsets.all(
                          media.getwidht(5),
                        ),
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
                              padding: EdgeInsets.all(
                                media.getwidht(8),
                              ),
                              decoration: const BoxDecoration(
                                border: Border(
                                  bottom: BorderSide(
                                    color: Color(0xFFF5F5F5),
                                  ),
                                ),
                              ),
                              child: TextField(
                                onChanged: (value) => name = value,
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: "Name",
                                  hintStyle: TextStyle(
                                    color: Colors.grey[400],
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.all(
                                media.getwidht(8),
                              ),
                              child: TextField(
                                onChanged: (value) => email = value,
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
                              padding: EdgeInsets.all(
                                media.getwidht(8),
                              ),
                              decoration: const BoxDecoration(
                                border: Border(
                                  bottom: BorderSide(
                                    color: Color(0xFFF5F5F5),
                                  ),
                                ),
                              ),
                              child: Row(
                                children: [
                                  Expanded(
                                    flex: 5,
                                    child: TextField(
                                      obscureText: obsc,
                                      onChanged: (value) => pass = value,
                                      decoration: InputDecoration(
                                        border: InputBorder.none,
                                        hintText: "Password",
                                        hintStyle: TextStyle(
                                          color: Colors.grey[400],
                                        ),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          obsc = !obsc;
                                        });
                                      },
                                      child: obsc
                                          ? Icon(
                                              Icons.remove_red_eye_sharp,
                                              color: const Color.fromRGBO(
                                                  143, 148, 251, 1),
                                              size: media.getwidht(20),
                                            )
                                          : Icon(
                                              Icons.remove_red_eye_outlined,
                                              color: const Color.fromRGBO(
                                                  143, 148, 251, 1),
                                              size: media.getwidht(20),
                                            ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.all(
                                media.getwidht(8),
                              ),
                              decoration: const BoxDecoration(
                                border: Border(
                                  bottom: BorderSide(
                                    color: Color(0xFFF5F5F5),
                                  ),
                                ),
                              ),
                              child: Row(
                                children: [
                                  Text(
                                    "are you specialist",
                                    style: TextStyle(
                                      color: Colors.grey[400],
                                    ),
                                  ),
                                  Checkbox(
                                    activeColor:
                                        const Color.fromRGBO(143, 148, 251, 1),
                                    value: isSpec,
                                    onChanged: (value) {
                                      setState(() {
                                        isSpec = value ?? false;
                                      });
                                    },
                                  ),
                                  SizedBox(
                                    width: media.getwidht(5),
                                  ),
                                  SizedBox(
                                    width: media.getwidht(10),
                                  ),
                                  Container(
                                    width: media.getwidht(100),
                                    child: TextField(
                                      inputFormatters: [
                                        FilteringTextInputFormatter.digitsOnly,
                                      ],
                                      onChanged: (value) => age = value,
                                      decoration: InputDecoration(
                                        border: InputBorder.none,
                                        hintText: "Age",
                                        hintStyle: TextStyle(
                                          color: Colors.grey[400],
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: media.getHeight(10),
                            ),
                            GestureDetector(
                              onTap: () async {
                                FocusScope.of(context).unfocus();
                                if ((email != "") &&
                                    (age != "") &&
                                    (name != "") &&
                                    (pass != "")) {
                                  UserModel userModel = UserModel(
                                      name: name,
                                      email: email,
                                      age: int.parse(age),
                                      isSpecialist: isSpec);
                                  try {
                                    await userProvider.registerUser(
                                        user: userModel, password: pass);
                                    Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => const LogIn(),
                                      ),
                                    );
                                  } catch (e) {
                                    error = "";
                                    if (e.toString() ==
                                        "Exception: [firebase_auth/weak-password] Password should be at least 6 characters") {
                                      setState(() {
                                        error =
                                            "Password should be at least 6 characters";
                                      });
                                    }
                                    if (e.toString() ==
                                        "Exception: [firebase_auth/network-request-failed] A network error (such as timeout, interrupted connection or unreachable host) has occurred.") {
                                      setState(() {
                                        error =
                                            "internet is required to connect";
                                      });
                                    }
                                    if (e.toString() ==
                                        "Exception: [firebase_auth/email-already-in-use] The email address is already in use by another account.") {
                                      setState(() {
                                        error =
                                            "The email address is already exist";
                                      });
                                    }
                                    if (e.toString() ==
                                        "Exception: [firebase_auth/invalid-email] The email address is badly formatted.") {
                                      setState(() {
                                        error =
                                            "The email address is badly formatted";
                                      });
                                    }
                                  }
                                } else {
                                  setState(
                                    () {
                                      error = "empty field";
                                    },
                                  );
                                }
                              },
                              child: Container(
                                height: media.getHeight(50),
                                width: media.getwidht(220),
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
                                    "SignUp",
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
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const LogIn(),
                                  ),
                                );
                              },
                              child: Container(
                                height: media.getHeight(50),
                                width: media.getwidht(220),
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
                                    "LogIn",
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
