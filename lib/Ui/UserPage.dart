import 'package:flutter/material.dart';

class userPage extends StatefulWidget {
  const userPage({Key? key}) : super(key: key);

  @override
  State<userPage> createState() => _userPageState();
}

class _userPageState extends State<userPage> {
  double height = 300;
  bool emailPress = false;
  bool namePress = false;
  bool passPress = false;
  bool agePress = false;
  Widget changeWidget = SizedBox();
  @override
  Widget build(BuildContext context) {
    double deviceHeight = MediaQuery.of(context).size.height;
    double deviceWidth = MediaQuery.of(context).size.width;

    return Center(
      child: Container(
        height: this.height,
        width: deviceWidth * 0.85,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Color.fromRGBO(143, 148, 251, 2),
              blurRadius: 20.0,
              offset: Offset(0, 10),
            )
          ],
        ),
        child: Column(
          children: [
            Expanded(
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
            SizedBox(
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
                          Text(
                            "Name :",
                            style: TextStyle(
                              fontFamily: "Courgette",
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Colors.purple,
                            ),
                          ),
                          SizedBox(
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
                          Spacer(),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                this.namePress = !this.namePress;
                              });
                            },
                            child: namePress
                                ? Icon(
                                    Icons.arrow_circle_down_sharp,
                                    color: Color.fromRGBO(143, 148, 251, 1),
                                    size: 30,
                                  )
                                : Icon(
                                    Icons.arrow_circle_right_sharp,
                                    color: Color.fromRGBO(143, 148, 251, 1),
                                    size: 30,
                                  ),
                          ),
                        ],
                      ),
                      Divider(
                        height: 20,
                      ),
                      Row(
                        children: [
                          Text(
                            "email :",
                            style: TextStyle(
                              fontFamily: "Courgette",
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              color: Colors.purple,
                            ),
                          ),
                          SizedBox(
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
                          Spacer(),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                this.emailPress = !this.emailPress;
                                emailPress
                                    ? this.height += 80
                                    : this.height -= 80;
                              });
                            },
                            child: emailPress
                                ? Icon(
                                    Icons.arrow_circle_down_sharp,
                                    color: Color.fromRGBO(143, 148, 251, 1),
                                    size: 30,
                                  )
                                : Icon(
                                    Icons.arrow_circle_right_sharp,
                                    color: Color.fromRGBO(143, 148, 251, 1),
                                    size: 30,
                                  ),
                          ),
                        ],
                      ),
                      if (this.emailPress)
                        GestureDetector(
                          onTap: () {},
                          child: Container(
                            height: 40,
                            width: 70,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              gradient: LinearGradient(
                                colors: [
                                  Color.fromRGBO(143, 148, 251, 0.4),
                                  Color.fromRGBO(143, 148, 251, 1),
                                  Color.fromRGBO(143, 148, 251, 1),
                                  Color.fromRGBO(143, 148, 251, 0.4),
                                ],
                              ),
                            ),
                            child: Center(
                              child: Text(
                                "Change",
                                style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ),
                      Divider(
                        height: 20,
                      ),
                      Row(
                        children: [
                          Text(
                            "Password :",
                            style: TextStyle(
                              fontFamily: "Courgette",
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Colors.purple,
                            ),
                          ),
                          SizedBox(
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
                          Spacer(),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                this.passPress = !this.passPress;
                              });
                            },
                            child: passPress
                                ? Icon(
                                    Icons.arrow_circle_down_sharp,
                                    color: Color.fromRGBO(143, 148, 251, 1),
                                    size: 30,
                                  )
                                : Icon(
                                    Icons.arrow_circle_right_sharp,
                                    color: Color.fromRGBO(143, 148, 251, 1),
                                    size: 30,
                                  ),
                          ),
                        ],
                      ),
                      Divider(
                        height: 20,
                      ),
                      Row(
                        children: [
                          Text(
                            "Age :",
                            style: TextStyle(
                              fontFamily: "Courgette",
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Colors.purple,
                            ),
                          ),
                          SizedBox(
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
                          Spacer(),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                this.agePress = !this.agePress;
                              });
                            },
                            child: agePress
                                ? Icon(
                                    Icons.arrow_circle_down_sharp,
                                    color: Color.fromRGBO(143, 148, 251, 1),
                                    size: 30,
                                  )
                                : Icon(
                                    Icons.arrow_circle_right_sharp,
                                    color: Color.fromRGBO(143, 148, 251, 1),
                                    size: 30,
                                  ),
                          ),
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
