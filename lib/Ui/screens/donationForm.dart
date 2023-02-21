import 'package:PeaceLink/core/models/donation_model.dart';
import 'package:PeaceLink/core/view-models/donation_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:scaffold_gradient_background/scaffold_gradient_background.dart';

import '../utilities/mediaQuery.dart';
import 'main_screen.dart';

class DonationForm extends StatefulWidget {
  @override
  State<DonationForm> createState() => _CardPaiementState();
}

class _CardPaiementState extends State<DonationForm> {
  String category = "disaster";
  String description = "";
  String finalValue = "";

  @override
  Widget build(BuildContext context) {
    double deviceHeight = MediaQuery.of(context).size.height;
    double deviceWidth = MediaQuery.of(context).size.width;
    Mediaquery media =
        Mediaquery(mediaHeight: deviceHeight, mediaWidth: deviceWidth);

    var items = ["disaster", "war", "hunger", "poverty"];
    return ScaffoldGradientBackground(
      gradient: const LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color(0xFF1e0059),
            Color(0xFF49125c),
            Color(0xFf3b246a),
            Color(0xFF926b9f),
          ],
          stops: [
            0,
            0.48,
            0.7,
            1
          ]),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: media.getHeight(40),
              ),
              Center(
                  child: Text(
                "Create Urgent Donation",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontFamily: "Courgette",
                  fontSize: media.getwidht(35),
                  color: Colors.white,
                ),
              )),
              SizedBox(
                height: media.getHeight(130),
              ),
              Container(
                height: deviceHeight * 0.53,
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
                child: Padding(
                  padding: EdgeInsets.all(media.getwidht(18)),
                  child: Container(
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                              bottom: media.getHeight(15),
                              top: media.getHeight(15)),
                          child: TextField(
                            onChanged: (value) => description = value,
                            minLines: 1,
                            maxLines: 9,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: "Description",
                              hintStyle: TextStyle(
                                color: Colors.grey[400],
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              bottom: media.getHeight(15),
                              top: media.getHeight(15)),
                          child: TextField(
                            onChanged: (value) => finalValue = value,
                            inputFormatters: [
                              FilteringTextInputFormatter.digitsOnly,
                            ],
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: "amount needed",
                              prefixIcon: Icon(
                                FontAwesomeIcons.sackDollar,
                                color: Colors.purple,
                              ),
                              hintStyle: TextStyle(
                                color: Colors.grey[400],
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              bottom: media.getHeight(15),
                              top: media.getHeight(15)),
                          child: DropdownButton(
                            iconEnabledColor: Colors.purple,
                            iconDisabledColor: Colors.purple,
                            iconSize: 30,
                            isExpanded: true,
                            value: category,
                            underline: SizedBox(),
                            hint: Text(
                              "Donation Catigory",
                              style: TextStyle(
                                color: Colors.grey[400],
                              ),
                            ),
                            items: items.map((String items) {
                              return DropdownMenuItem(
                                value: items,
                                child: Text(items),
                              );
                            }).toList(),
                            onChanged: (value) {
                              setState(() {
                                category = value ?? "";
                                print(category);
                              });
                            },
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              bottom: media.getHeight(15),
                              top: media.getHeight(15)),
                          child: GestureDetector(
                            onTap: () async {
                              FocusScope.of(context).unfocus();
                              try {
                                await Provider.of<DonationProvider>(context,
                                        listen: false)
                                    .addDonation(
                                        newDonation: Donation(
                                            category: category,
                                            description: description,
                                            finalValue:
                                                double.parse(finalValue)));
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => MyApp(index: 2)));
                              } catch (e) {
                                print(e.toString());
                              }
                            },
                            child: Container(
                              height: media.getHeight(50),
                              width: media.getwidht(300),
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
                              child: Center(
                                child: Text(
                                  "Create",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: "Courgette",
                                      fontSize: media.getwidht(20),
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              bottom: media.getHeight(15),
                              top: media.getHeight(10),
                              right: media.getwidht(20)),
                          child: Align(
                            alignment: Alignment.centerRight,
                            child: GestureDetector(
                              onTap: () {
                                FocusScope.of(context).unfocus();
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => MyApp(index: 2)));
                              },
                              child: const Text(
                                "retour",
                                style: TextStyle(
                                  color: Color.fromRGBO(143, 148, 251, 1),
                                  fontFamily: 'Courgette',
                                ),
                              ),
                            ),
                          ),
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
