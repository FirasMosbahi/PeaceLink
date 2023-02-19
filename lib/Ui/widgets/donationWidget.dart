import 'package:chat_for_peace/core/models/donation_model.dart';
import 'package:flutter/material.dart';

import '../screens/cardPaiement.dart';
import '../screens/donationForm.dart';

class DonationWidget extends StatelessWidget {
  final Donation donation;
  const DonationWidget({Key? key, required this.donation}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
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
            flex: 6,
            child: Container(
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10)),
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage("assets/img.jpg"),
                  )),
            ),
          ),
          Expanded(
            flex: 4,
            child: Container(
              child: Column(
                children: [
                  Text(
                    donation.description,
                    style: const TextStyle(
                      fontSize: 18,
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
                      Expanded(
                        child: Center(child: Text("0£")),
                        flex: 1,
                      ),
                      Expanded(
                          flex: 4,
                          child: Center(
                            child: LinearProgressIndicator(
                              value:
                                  donation.currentValue / donation.finalValue,
                              backgroundColor: Colors.black12,
                              valueColor:
                                  AlwaysStoppedAnimation<Color>(Colors.purple),
                            ),
                          )),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        flex: 2,
                        child: Center(child: Text("${donation.finalValue}£")),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 3,
                  ),
                  Text(
                    "category:    ${donation.category}",
                    style: TextStyle(
                        fontFamily: 'Courgette', fontWeight: FontWeight.w600),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 12,
          ),
          Expanded(
            flex: 2,
            child: Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => CardPaiement(
                                  amount: "", donation: donation)));
                    },
                    child: Container(
                      height: 50,
                      width: 220,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(10),
                            topRight: Radius.circular(10)),
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
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => DonationForm()));
                    },
                    child: Container(
                      height: 50,
                      width: 220,
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