import 'package:PeaceLink/core/models/user-model.dart';
import 'package:PeaceLink/core/view-models/user_view_model.dart';
import 'package:flutter/material.dart';

import '../utilities/mediaQuery.dart';
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
  String newUserName = "";
  String newEmail = "";
  String newPassword = "";
  int newAge = 0;
  UserProvider userProvider = UserProvider();
  UserModel? user;
  Widget changeWidget = const SizedBox();
  void getUser() async {
    UserModel userModel = await userProvider.getCurrentUser();
    setState(() {
      user = userModel;
      print(user);
    });
  }

  @override
  void initState() {
    super.initState();
    getUser();
  }

  @override
  Widget build(BuildContext context) {
    double deviceHeight = MediaQuery.of(context).size.height;
    double deviceWidth = MediaQuery.of(context).size.width;
    Mediaquery media =
        Mediaquery(mediaHeight: deviceHeight, mediaWidth: deviceWidth);

    return Center(
      child: SingleChildScrollView(
        child: Container(
          height: media.getHeight(height),
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
              Expanded(
                child: Center(
                  child: Text(
                    user == null ? "Loading..." : user?.name ?? "",
                    style: TextStyle(
                      fontSize: media.getwidht(25),
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Courgette',
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: media.getHeight(40),
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
                                fontSize: media.getwidht(16),
                                fontWeight: FontWeight.w600,
                                color: Colors.purple,
                              ),
                            ),
                            SizedBox(
                              width: media.getwidht(10),
                            ),
                            Text(
                              user == null ? "Loading..." : user?.name ?? "",
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
                                  ? Icon(
                                      Icons.arrow_circle_down_sharp,
                                      color: Color.fromRGBO(143, 148, 251, 1),
                                      size: media.getwidht(30),
                                    )
                                  : Icon(
                                      Icons.arrow_circle_right_sharp,
                                      color: Color.fromRGBO(143, 148, 251, 1),
                                      size: media.getwidht(30),
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
                                    onChanged: (value) => newUserName = value,
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText: "name",
                                      hintStyle: TextStyle(
                                        color: Colors.grey[400],
                                      ),
                                    ),
                                  )),
                            if (namePress)
                              Expanded(
                                child: Field(
                                  onClick: () {
                                    FocusScope.of(context).unfocus();
                                    userProvider
                                        .updateUserInfos({"name": newUserName});
                                    setState(() {
                                      namePress = false;
                                      user?.name = newUserName;
                                    });
                                  },
                                ),
                              ),
                          ],
                        ),
                        Divider(
                          height: media.getHeight(20),
                        ),
                        Row(
                          children: [
                            Text(
                              "email :",
                              style: TextStyle(
                                fontFamily: "Courgette",
                                fontSize: media.getHeight(18),
                                fontWeight: FontWeight.w600,
                                color: Colors.purple,
                              ),
                            ),
                            SizedBox(
                              width: media.getwidht(10),
                            ),
                            Text(
                              user == null ? "Loading..." : user?.email ?? "",
                              style: TextStyle(
                                fontFamily: 'Courgette',
                                fontWeight: FontWeight.w300,
                                color: Colors.grey[700],
                              ),
                            ),
                            const Spacer(),
                            GestureDetector(
                              onTap: () {
                                FocusScope.of(context).unfocus();
                                setState(() {
                                  emailPress = !emailPress;
                                  emailPress ? height += 80 : height -= 80;
                                });
                              },
                              child: emailPress
                                  ? Icon(
                                      Icons.arrow_circle_down_sharp,
                                      color: Color.fromRGBO(143, 148, 251, 1),
                                      size: media.getwidht(30),
                                    )
                                  : Icon(
                                      Icons.arrow_circle_right_sharp,
                                      color: Color.fromRGBO(143, 148, 251, 1),
                                      size: media.getwidht(30),
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
                                    onChanged: (value) => newEmail = value,
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText: "email",
                                      hintStyle: TextStyle(
                                        color: Colors.grey[400],
                                      ),
                                    ),
                                  )),
                            if (emailPress)
                              Expanded(child: Field(onClick: () {
                                FocusScope.of(context).unfocus();
                                userProvider
                                    .updateUserInfos({"email": newEmail});
                                setState(() {
                                  emailPress = false;
                                  user?.email = newEmail;
                                });
                              })),
                          ],
                        ),
                        Divider(
                          height: media.getHeight(20),
                        ),
                        Row(
                          children: [
                            Text(
                              "Password :",
                              style: TextStyle(
                                fontFamily: "Courgette",
                                fontSize: media.getwidht(16),
                                fontWeight: FontWeight.w600,
                                color: Colors.purple,
                              ),
                            ),
                            SizedBox(
                              width: media.getwidht(10),
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
                                  ? Icon(
                                      Icons.arrow_circle_down_sharp,
                                      color: Color.fromRGBO(143, 148, 251, 1),
                                      size: media.getwidht(30),
                                    )
                                  : Icon(
                                      Icons.arrow_circle_right_sharp,
                                      color: Color.fromRGBO(143, 148, 251, 1),
                                      size: media.getwidht(30),
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
                                    onChanged: (value) => newPassword,
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
                                          color:
                                              Color.fromRGBO(143, 148, 251, 1),
                                          size: media.getwidht(20),
                                        )
                                      : Icon(
                                          Icons.remove_red_eye_outlined,
                                          color:
                                              Color.fromRGBO(143, 148, 251, 1),
                                          size: media.getwidht(20),
                                        ),
                                ),
                              ),
                            if (passPress)
                              Expanded(
                                  flex: 2,
                                  child: Field(onClick: () {
                                    FocusScope.of(context).unfocus();
                                    userProvider.updateUserPassword(
                                        newPassword: newPassword);
                                    setState(() {
                                      passPress = false;
                                    });
                                  })),
                          ],
                        ),
                        Divider(
                          height: media.getHeight(20),
                        ),
                        Row(
                          children: [
                            Text(
                              "Age :",
                              style: TextStyle(
                                fontFamily: "Courgette",
                                fontSize: media.getwidht(16),
                                fontWeight: FontWeight.w600,
                                color: Colors.purple,
                              ),
                            ),
                            SizedBox(
                              width: media.getwidht(10),
                            ),
                            Text(
                              user == null
                                  ? "Loading..."
                                  : user?.age.toString() ?? "",
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
                                  ? Icon(
                                      Icons.arrow_circle_down_sharp,
                                      color: Color.fromRGBO(143, 148, 251, 1),
                                      size: media.getwidht(30),
                                    )
                                  : Icon(
                                      Icons.arrow_circle_right_sharp,
                                      color: Color.fromRGBO(143, 148, 251, 1),
                                      size: media.getwidht(30),
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
                                    onChanged: (value) =>
                                        newAge = int.parse(value),
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText: "age",
                                      hintStyle: TextStyle(
                                        color: Colors.grey[400],
                                      ),
                                    ),
                                  )),
                            if (agePress)
                              Expanded(child: Field(onClick: () {
                                FocusScope.of(context).unfocus();
                                userProvider.updateUserInfos({"age": newAge});
                                setState(() {
                                  agePress = false;
                                  user?.age = newAge;
                                });
                              })),
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
      ),
    );
  }
}
