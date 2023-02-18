import 'package:flutter/material.dart';

import '../widgets/field_change.dart';

class UserPage extends StatefulWidget {
  const UserPage({Key? key}) : super(key: key);

  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  double height = 300;
  bool emailPress = false;
  bool namePress = false;
  bool passPress = false;
  bool agePress = false;
  bool obsc = true;
  Widget changeWidget = const SizedBox();
  @override
  Widget build(BuildContext context) {
    double deviceHeight = MediaQuery.of(context).size.height;
    double deviceWidth = MediaQuery.of(context).size.width;

    return Center(
      child: Container(
        height: height,
        width: deviceWidth * 0.85,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
          boxShadow: const [
            BoxShadow(
              color: Color.fromRGBO(143, 148, 251, 2),
              blurRadius: 20.0,
              offset: Offset(0, 10),
            )
          ],
        ),
        child: Column(
          children: [
            const Expanded(
              child: Center(
                child: Text(
                  "Mohamed Amine Gasmi",
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Courgette',
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            Expanded(
              flex: 6,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  child: Column(
                    children: [
                      Row(
                        children: [
                          const Text(
                            "Name :",
                            style: TextStyle(
                              fontFamily: "Courgette",
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Colors.purple,
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Text(
                            "Mohamed Amine Gasmi",
                            style: TextStyle(
                              fontFamily: 'Courgette',
                              fontWeight: FontWeight.w300,
                              color: Colors.grey[700],
                            ),
                          ),
                          const Spacer(),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                namePress = !namePress;
                                namePress ? height += 80 : height -= 80;
                              });
                            },
                            child: namePress
                                ? const Icon(
                                    Icons.arrow_circle_down_sharp,
                                    color: Color.fromRGBO(143, 148, 251, 1),
                                    size: 30,
                                  )
                                : const Icon(
                                    Icons.arrow_circle_right_sharp,
                                    color: Color.fromRGBO(143, 148, 251, 1),
                                    size: 30,
                                  ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          if (namePress)
                            Expanded(
                                flex: 2,
                                child: TextField(
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: "name",
                                    hintStyle: TextStyle(
                                      color: Colors.grey[400],
                                    ),
                                  ),
                                )),
                          if (namePress) Expanded(child: Field()),
                        ],
                      ),
                      const Divider(
                        height: 20,
                      ),
                      Row(
                        children: [
                          const Text(
                            "email :",
                            style: TextStyle(
                              fontFamily: "Courgette",
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              color: Colors.purple,
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Text(
                            "Semah.mechi@gmail.com",
                            style: TextStyle(
                              fontFamily: 'Courgette',
                              fontWeight: FontWeight.w300,
                              color: Colors.grey[700],
                            ),
                          ),
                          const Spacer(),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                emailPress = !emailPress;
                                emailPress ? height += 80 : height -= 80;
                              });
                            },
                            child: emailPress
                                ? const Icon(
                                    Icons.arrow_circle_down_sharp,
                                    color: Color.fromRGBO(143, 148, 251, 1),
                                    size: 30,
                                  )
                                : const Icon(
                                    Icons.arrow_circle_right_sharp,
                                    color: Color.fromRGBO(143, 148, 251, 1),
                                    size: 30,
                                  ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          if (emailPress)
                            Expanded(
                                flex: 2,
                                child: TextField(
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: "email",
                                    hintStyle: TextStyle(
                                      color: Colors.grey[400],
                                    ),
                                  ),
                                )),
                          if (emailPress) Expanded(child: Field()),
                        ],
                      ),
                      const Divider(
                        height: 20,
                      ),
                      Row(
                        children: [
                          const Text(
                            "Password :",
                            style: TextStyle(
                              fontFamily: "Courgette",
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Colors.purple,
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Text(
                            "************",
                            style: TextStyle(
                              fontFamily: 'Courgette',
                              fontWeight: FontWeight.w300,
                              color: Colors.grey[700],
                            ),
                          ),
                          const Spacer(),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                passPress = !passPress;
                                passPress ? height += 80 : height -= 80;
                              });
                            },
                            child: passPress
                                ? const Icon(
                                    Icons.arrow_circle_down_sharp,
                                    color: Color.fromRGBO(143, 148, 251, 1),
                                    size: 30,
                                  )
                                : const Icon(
                                    Icons.arrow_circle_right_sharp,
                                    color: Color.fromRGBO(143, 148, 251, 1),
                                    size: 30,
                                  ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          if (passPress)
                            Expanded(
                                flex: 3,
                                child: TextField(
                                  obscureText: obsc,
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: "password",
                                    hintStyle: TextStyle(
                                      color: Colors.grey[400],
                                    ),
                                  ),
                                )),
                          if (passPress)
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
                                        color: Color.fromRGBO(143, 148, 251, 1),
                                        size: 20,
                                      )
                                    : Icon(
                                        Icons.remove_red_eye_outlined,
                                        color: Color.fromRGBO(143, 148, 251, 1),
                                        size: 20,
                                      ),
                              ),
                            ),
                          if (passPress) Expanded(flex: 2, child: Field()),
                        ],
                      ),
                      const Divider(
                        height: 20,
                      ),
                      Row(
                        children: [
                          const Text(
                            "Age :",
                            style: TextStyle(
                              fontFamily: "Courgette",
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Colors.purple,
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Text(
                            "21",
                            style: TextStyle(
                              fontFamily: 'Courgette',
                              fontWeight: FontWeight.w300,
                              color: Colors.grey[700],
                            ),
                          ),
                          const Spacer(),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                agePress = !agePress;
                                agePress ? height += 80 : height -= 80;
                              });
                            },
                            child: agePress
                                ? const Icon(
                                    Icons.arrow_circle_down_sharp,
                                    color: Color.fromRGBO(143, 148, 251, 1),
                                    size: 30,
                                  )
                                : const Icon(
                                    Icons.arrow_circle_right_sharp,
                                    color: Color.fromRGBO(143, 148, 251, 1),
                                    size: 30,
                                  ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          if (agePress)
                            Expanded(
                                flex: 2,
                                child: TextField(
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: "age",
                                    hintStyle: TextStyle(
                                      color: Colors.grey[400],
                                    ),
                                  ),
                                )),
                          if (agePress) Expanded(child: Field()),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
