import 'package:chat_for_peace/Ui/widgets/donationWidget.dart';
import 'package:chat_for_peace/core/view-models/donation_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_carousel_slider/carousel_slider.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

import '../widgets/template.dat.dart';
import 'main_screen.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
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
                  margin: const EdgeInsets.only(top: 35, left: 40, right: 40),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 7),
                          child: Container(
                            height: 60,
                            width: 70,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: const Color.fromRGBO(143, 148, 251, 0.2),
                            ),
                            child: const Icon(
                              FontAwesomeIcons.wallet,
                              size: 35,
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
                                padding: const EdgeInsets.all(15.0),
                                child: Text(
                                  "We make a living by what we get . We make a life by what we give 🥰",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontFamily: 'Courgette',
                                      fontWeight: FontWeight.bold,
                                      color: Colors.grey[500],
                                      letterSpacing: 0.2),
                                ),
                              ),
                              const Spacer(),
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              MyApp(index: 0, appBar: appBar)));
                                },
                                child: Container(
                                  height: 50,
                                  width: 120,
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
                              const SizedBox(
                                height: 20,
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ))),
          const SizedBox(
            height: 20,
          ),
          Expanded(
            flex: 2,
            child: Container(
              margin: const EdgeInsets.only(top: 35, left: 40, right: 40),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Expanded(
                      child: Text(
                    "Urgent Donation",
                    style: TextStyle(fontSize: 18, color: Colors.pinkAccent),
                  )),
                  Expanded(
                    child: Row(
                      children: [
                        Expanded(
                          child: GestureDetector(
                            onTap: () {},
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
                        const SizedBox(
                          width: 14,
                        ),
                        Expanded(
                          child: GestureDetector(
                            onTap: () {},
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
                        const SizedBox(
                          width: 14,
                        ),
                        Expanded(
                          child: GestureDetector(
                            onTap: () {},
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
                        const SizedBox(
                          width: 12,
                        ),
                        Expanded(
                          child: GestureDetector(
                            onTap: () {},
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
                  const SizedBox(
                    width: double.infinity,
                    height: 30,
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
          const SizedBox(
            height: 50,
          ),
        ],
      );
    });
  }
}
