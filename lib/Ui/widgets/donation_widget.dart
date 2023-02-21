import 'package:PeaceLink/core/models/donation_model.dart';
import 'package:flutter/material.dart';

import '../screens/card_payement.dart';
import '../screens/donation_form.dart';
import '../utilities/mediaQuery.dart';

class DonationWidget extends StatelessWidget {
  final Donation donation;
  const DonationWidget({Key? key, required this.donation}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double deviceHeight = MediaQuery.of(context).size.height;
    double deviceWidth = MediaQuery.of(context).size.width;
    Mediaquery media =
        Mediaquery(mediaHeight: deviceHeight, mediaWidth: deviceWidth);
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
        boxShadow: const [
          BoxShadow(
            color: Color.fromRGBO(143, 148, 251, 2),
            blurRadius: 20.0,
            offset: Offset(0, 10),
          ),
        ],
      ),
      child: Column(
        children: [
          Expanded(
            flex: 6,
            child: Container(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                ),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage("assets/img.jpg"),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 4,
            child: Container(
              child: Column(
                children: [
                  Text(
                    donation.description,
                    style: TextStyle(
                      fontSize: media.getwidht(18),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "${donation.currentValue}£ fund was raised ",
                    style: const TextStyle(
                      color: Colors.black54,
                    ),
                  ),
                  Row(
                    children: [
                      const Expanded(
                        flex: 1,
                        child: Center(
                          child: Text("0£"),
                        ),
                      ),
                      Expanded(
                        flex: 4,
                        child: Center(
                          child: LinearProgressIndicator(
                            value: donation.currentValue / donation.finalValue,
                            backgroundColor: Colors.black12,
                            valueColor: const AlwaysStoppedAnimation<Color>(
                                Colors.purple),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: media.getwidht(10),
                      ),
                      Expanded(
                        flex: 2,
                        child: Center(
                          child: Text("${donation.finalValue}£"),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: media.getHeight(3),
                  ),
                  Text(
                    "category:    ${donation.category}",
                    style: const TextStyle(
                        fontFamily: 'Courgette', fontWeight: FontWeight.w600),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: media.getHeight(12),
          ),
          Expanded(
            flex: 2,
            child: Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              CardPayment(amount: "", donation: donation),
                        ),
                      );
                    },
                    child: Container(
                      height: media.getHeight(50),
                      width: media.getwidht(220),
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(10),
                          topRight: Radius.circular(10),
                        ),
                        gradient: LinearGradient(
                          colors: [
                            Color.fromRGBO(143, 148, 251, 1),
                            Color.fromRGBO(143, 148, 251, 0.9),
                            Color.fromRGBO(143, 148, 251, 0.2),
                          ],
                        ),
                      ),
                      child: const Center(
                        child: Text(
                          "Donate",
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: media.getwidht(10),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const DonationForm(),
                        ),
                      );
                    },
                    child: Container(
                      height: media.getHeight(50),
                      width: media.getwidht(220),
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(10),
                            topLeft: Radius.circular(10)),
                        gradient: LinearGradient(
                          colors: [
                            Color.fromRGBO(143, 148, 251, 0.2),
                            Color.fromRGBO(143, 148, 251, 0.9),
                            Color.fromRGBO(143, 148, 251, 1),
                          ],
                        ),
                      ),
                      child: const Center(
                        child: Text(
                          "Create ",
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
