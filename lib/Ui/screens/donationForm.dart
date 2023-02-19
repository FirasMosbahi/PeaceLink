import 'package:chat_for_peace/core/models/donation_model.dart';
import 'package:chat_for_peace/core/view-models/donation_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:scaffold_gradient_background/scaffold_gradient_background.dart';

import '../widgets/template.dat.dart';
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
                height: 40,
              ),
              Center(
                  child: Text(
                "Create Urgent Donation",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontFamily: "Courgette",
                  fontSize: 35,
                  color: Colors.white,
                ),
              )),
              SizedBox(
                height: 130,
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
                  padding: const EdgeInsets.all(18.0),
                  child: Container(
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 15, top: 15),
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
                          padding: const EdgeInsets.only(bottom: 15, top: 15),
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
                          padding: const EdgeInsets.only(bottom: 15, top: 15),
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
                          padding: const EdgeInsets.only(bottom: 15, top: 35),
                          child: GestureDetector(
                            onTap: () async {
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
                                        builder: (context) =>
                                            MyApp(index: 2, appBar: appBar)));
                              } catch (e) {
                                print(e.toString());
                              }
                            },
                            child: Container(
                              height: 50,
                              width: 300,
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
                                  "Create",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: "Courgette",
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              bottom: 15, top: 10, right: 20),
                          child: Align(
                            alignment: Alignment.centerRight,
                            child: GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            MyApp(index: 2, appBar: appBar)));
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
