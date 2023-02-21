import 'dart:async';

import 'package:PeaceLink/Ui/widgets/donationWidget.dart';
import 'package:PeaceLink/core/view-models/donation_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_carousel_slider/carousel_slider.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

import '../utilities/mediaQuery.dart';
import 'main_screen.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool animate = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      animate = false;
    });

    Timer(
        const Duration(milliseconds: 600),
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

    return Consumer<DonationProvider>(
        builder: (context, donationProvider, child) {
      donationProvider.getDonations();
      return Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
              flex: 1,
              child: Container(
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
                  margin: EdgeInsets.only(
                      top: media.getHeight(35),
                      left: media.getwidht(40),
                      right: media.getwidht(40)),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: Padding(
                          padding: EdgeInsets.only(left: media.getwidht(7)),
                          child: Container(
                            height: deviceHeight * 0.08,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: const Color.fromRGBO(143, 148, 251, 0.2),
                            ),
                            child: Icon(
                              FontAwesomeIcons.wallet,
                              size: deviceWidth * 0.075,
                              color: Color.fromRGBO(143, 148, 251, 1),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 4,
                        child: Container(
                          child: Column(
                            children: [
                              Padding(
                                padding: EdgeInsets.all(deviceWidth * 0.035),
                                child: AnimatedOpacity(
                                  duration: const Duration(milliseconds: 800),
                                  opacity: animate ? 1 : 0,
                                  curve: Curves.easeOutSine,
                                  child: Text(
                                    "We make a living by what we get . We make a life by what we give 🥰",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontSize: deviceWidth * 0.04,
                                        fontFamily: 'Courgette',
                                        fontWeight: FontWeight.bold,
                                        color: Colors.grey[500],
                                        letterSpacing: 0.2),
                                  ),
                                ),
                              ),
                              const Spacer(),
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              MyApp(index: 0)));
                                },
                                child: Container(
                                  height: deviceHeight * 0.06,
                                  width: deviceWidth * 0.3,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    gradient: const LinearGradient(
                                      colors: [
                                        Color.fromRGBO(143, 148, 251, 0.4),
                                        Color.fromRGBO(143, 148, 251, 1),
                                        Color.fromRGBO(143, 148, 251, 1),
                                        Color.fromRGBO(143, 148, 251, 0.4),
                                      ],
                                    ),
                                  ),
                                  child: const Center(
                                    child: Text(
                                      "Donate",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: deviceHeight * 0.02,
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ))),
          SizedBox(
            height: deviceHeight * 0.015,
          ),
          Expanded(
            flex: 2,
            child: Container(
              margin: EdgeInsets.only(
                  top: deviceHeight * 0.015,
                  left: deviceWidth * 0.09,
                  right: deviceWidth * 0.09),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                      child: Text(
                    "Urgent Donation",
                    style: TextStyle(
                        fontSize: deviceWidth * 0.06, color: Colors.pinkAccent),
                  )),
                  Expanded(
                    flex: 2,
                    child: Column(
                      children: [
                        Expanded(
                          child: Row(
                            children: [
                              Expanded(
                                child: GestureDetector(
                                  onTap: () async {
                                    try {
                                      await donationProvider
                                          .getDonationsByCategory("disaster");
                                    } catch (e) {
                                      print(e.toString());
                                    }
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                      gradient: const LinearGradient(
                                        colors: [
                                          Color.fromRGBO(190, 120, 251, 0.6),
                                          Color.fromRGBO(190, 120, 251, 0.4),
                                          Color.fromRGBO(190, 120, 251, 0.8),
                                        ],
                                      ),
                                    ),
                                    child: const Center(
                                      child: Text(
                                        "Disaster",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: deviceWidth * 0.05,
                              ),
                              Expanded(
                                child: GestureDetector(
                                  onTap: () async {
                                    try {
                                      await donationProvider
                                          .getDonationsByCategory("war");
                                    } catch (e) {
                                      print(e.toString());
                                    }
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                      gradient: const LinearGradient(
                                        colors: [
                                          Color.fromRGBO(190, 120, 251, 0.6),
                                          Color.fromRGBO(190, 120, 251, 0.4),
                                          Color.fromRGBO(190, 120, 251, 0.8),
                                        ],
                                      ),
                                    ),
                                    child: const Center(
                                      child: Text(
                                        "Wars",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: deviceWidth * 0.05,
                              ),
                              Expanded(
                                child: GestureDetector(
                                  onTap: () async {
                                    try {
                                      await donationProvider
                                          .getDonationsByCategory("poverty");
                                    } catch (e) {
                                      print(e.toString());
                                    }
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                      gradient: const LinearGradient(
                                        colors: [
                                          Color.fromRGBO(190, 120, 251, 0.6),
                                          Color.fromRGBO(190, 120, 251, 0.4),
                                          Color.fromRGBO(190, 120, 251, 0.8),
                                        ],
                                      ),
                                    ),
                                    child: const Center(
                                      child: Text(
                                        "Poverty",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: deviceWidth * 0.045,
                              ),
                              Expanded(
                                child: GestureDetector(
                                  onTap: () async {
                                    try {
                                      await donationProvider
                                          .getDonationsByCategory("hunger");
                                    } catch (e) {
                                      print(e.toString());
                                    }
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                      gradient: const LinearGradient(
                                        colors: [
                                          Color.fromRGBO(190, 120, 251, 0.6),
                                          Color.fromRGBO(190, 120, 251, 0.4),
                                          Color.fromRGBO(190, 120, 251, 0.8),
                                        ],
                                      ),
                                    ),
                                    child: const Center(
                                      child: Text(
                                        "Hunger",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: deviceWidth * 0.05,
                          height: deviceHeight * 0.015,
                        ),
                        Expanded(
                          child: GestureDetector(
                            onTap: () async {
                              try {
                                donationProvider.init = true;
                                await donationProvider.getDonations();
                              } catch (e) {
                                print(e.toString());
                              }
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                gradient: const LinearGradient(
                                  colors: [
                                    Color.fromRGBO(190, 120, 251, 0.6),
                                    Color.fromRGBO(190, 120, 251, 0.4),
                                    Color.fromRGBO(190, 120, 251, 0.8),
                                  ],
                                ),
                              ),
                              child: const Center(
                                child: Text(
                                  "ALL",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: double.infinity,
                    height: deviceHeight * 0.025,
                  ),
                  Expanded(
                      flex: 7,
                      child: CarouselSlider(
                        unlimitedMode: true,
                        children: donationProvider.donations
                            .map((e) => DonationWidget(
                                  donation: e,
                                ))
                            .toList(),
                      ))
                ],
              ),
            ),
          ),
          SizedBox(
            height: deviceHeight * 0.02,
          ),
        ],
      );
    });
  }
}
