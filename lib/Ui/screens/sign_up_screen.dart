import 'dart:async';

import 'package:chat_for_peace/core/models/user-model.dart';
import 'package:chat_for_peace/core/view-models/user_view_model.dart';
import 'package:flutter/material.dart';

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
  bool isSpec = false;
  bool animate = false;
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
  Widget build(BuildContext context) {
    double deviceHeight = MediaQuery.of(context).size.height;
    double deviceWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              Container(
                height: 330,
                width: double.infinity,
                decoration: const BoxDecoration(
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
                        duration: const Duration(milliseconds: 2200),
                        opacity: animate ? 1 : 0,
                        curve: Curves.easeOutSine,
                        child: AnimatedSlide(
                          duration: const Duration(milliseconds: 1000),
                          offset: animate ? const Offset(0, 0.01) : const Offset(0, -1),
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
                        duration: const Duration(milliseconds: 2200),
                        opacity: animate ? 1 : 0,
                        curve: Curves.easeOutSine,
                        child: AnimatedSlide(
                          duration: const Duration(milliseconds: 1000),
                          offset: animate ? const Offset(0, 0.01) : const Offset(0, -1),
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
                        margin: const EdgeInsets.only(top: 60),
                        child: const Center(
                          child: Text(
                            "SignUp",
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
                padding: const EdgeInsets.only(left: 30, right: 30),
                child: AnimatedOpacity(
                  duration: const Duration(milliseconds: 2200),
                  opacity: animate ? 1 : 0,
                  curve: Curves.easeOutSine,
                  child: Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(5),
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
                              padding: const EdgeInsets.all(8),
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
                              padding: const EdgeInsets.all(8),
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
                              padding: const EdgeInsets.all(8),
                              decoration: const BoxDecoration(
                                border: Border(
                                  bottom: BorderSide(
                                    color: Color(0xFFF5F5F5),
                                  ),
                                ),
                              ),
                              child: TextField(
                                obscureText: true,
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
                            Container(
                                padding: const EdgeInsets.all(8),
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
                                      "are you specialiste",
                                      style: TextStyle(
                                        color: Colors.grey[400],
                                      ),
                                    ),
                                    const Spacer(),
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
                                    const SizedBox(
                                      width: 100,
                                    ),
                                  ],
                                )),
                            const SizedBox(
                              height: 10,
                            ),
                            GestureDetector(
                              onTap: () {
                                //TODO: add the age field
                                UserModel userModel = UserModel(
                                    name: name,
                                    email: email,
                                    age: 21,
                                    isSpecialist: isSpec);
                                try {
                                  userProvider.registerUser(
                                      user: userModel, password: pass);
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => const LogIn()));
                                } catch (e) {}
                              },
                              child: Container(
                                height: 50,
                                width: 220,
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
                            const SizedBox(
                              height: 15,
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => const LogIn()));
                              },
                              child: Container(
                                height: 50,
                                width: 220,
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
                            const SizedBox(
                              height: 15,
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
