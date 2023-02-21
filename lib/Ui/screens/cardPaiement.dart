import 'package:chat_for_peace/Ui/screens/main_screen.dart';
import 'package:chat_for_peace/core/models/donation_model.dart';
import 'package:chat_for_peace/core/view-models/donation_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:scaffold_gradient_background/scaffold_gradient_background.dart';

import '../utilities/mediaQuery.dart';

class CardPaiement extends StatefulWidget {
  String amount;
  Donation donation;
  CardPaiement({required this.amount, required this.donation});

  @override
  State<CardPaiement> createState() => _CardPaiementState();
}

class _CardPaiementState extends State<CardPaiement> {
  String donationValue = "";

  @override
  Widget build(BuildContext context) {
    double deviceHeight = MediaQuery.of(context).size.height;
    double deviceWidth = MediaQuery.of(context).size.width;
    Mediaquery media =
        Mediaquery(mediaHeight: deviceHeight, mediaWidth: deviceWidth);
    String DonateVal = "";
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
      appBar: AppBar(
        title: Center(
            child: Text(
          "Paiement",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontFamily: "Courgette",
            fontSize: media.getwidht(45),
          ),
        )),
        backgroundColor: const Color(0xFF1f005c),
        elevation: 0,
        automaticallyImplyLeading: false,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            height: deviceHeight * 0.58,
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
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly,
                          LengthLimitingTextInputFormatter(19),
                          CardEdit(),
                        ],
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Card number",
                          prefixIcon: Icon(
                            FontAwesomeIcons.wallet,
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
                      child: TextField(
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Full Name",
                          prefixIcon: Icon(
                            FontAwesomeIcons.user,
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
                      child: Row(
                        children: [
                          Expanded(
                            child: TextField(
                              inputFormatters: [
                                FilteringTextInputFormatter.digitsOnly,
                                LengthLimitingTextInputFormatter(4),
                              ],
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: "CVV",
                                prefixIcon: Icon(
                                  FontAwesomeIcons.creditCard,
                                  color: Colors.purple,
                                ),
                                hintStyle: TextStyle(
                                  color: Colors.grey[400],
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: TextField(
                              inputFormatters: [
                                FilteringTextInputFormatter.digitsOnly,
                                LengthLimitingTextInputFormatter(4),
                                CardYearEdit(),
                              ],
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: "MM/YY",
                                prefixIcon: Icon(
                                  FontAwesomeIcons.wallet,
                                  color: Colors.purple,
                                ),
                                hintStyle: TextStyle(
                                  color: Colors.grey[400],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    if (widget.amount == "")
                      Padding(
                        padding: EdgeInsets.only(
                            bottom: media.getHeight(15),
                            top: media.getHeight(15)),
                        child: TextField(
                          onChanged: (value) => donationValue = value,
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly,
                          ],
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Amount",
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
                    if (widget.amount != "")
                      Text(
                        widget.amount,
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            fontSize: media.getwidht(22),
                            color: Colors.pink,
                            fontWeight: FontWeight.w700,
                            fontFamily: 'Corugette'),
                      ),
                    Padding(
                      padding: EdgeInsets.only(
                          bottom: media.getHeight(15),
                          top: media.getHeight(35)),
                      child: GestureDetector(
                        onTap: () async {
                          FocusScope.of(context).unfocus();
                          if (widget.amount == "") {
                            Provider.of<DonationProvider>(context,
                                    listen: false)
                                .donate(
                                    value: double.parse(donationValue),
                                    donation: widget.donation);
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => MyApp(index: 2)));
                          } else {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => MyApp(index: 0)));
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
                              "Donate",
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
                    Spacer(),
                    Padding(
                      padding: EdgeInsets.only(
                          bottom: deviceHeight * 0.02,
                          top: deviceHeight * 0.015,
                          right: deviceWidth * 0.06),
                      child: Align(
                        alignment: Alignment.center,
                        child: GestureDetector(
                          onTap: () {
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
        ),
      ),
    );
  }
}

class CardEdit extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    if (newValue.selection.baseOffset == 0) return newValue;
    String input = newValue.text;
    StringBuffer buffer = StringBuffer();
    for (var i = 0; i < input.length; i++) {
      buffer.write(input[i]);
      int index = i + 1;
      if (index % 4 == 0 && input.length != index) {
        buffer.write("  ");
      }
    }
    return TextEditingValue(
        text: buffer.toString(),
        selection: TextSelection.collapsed(offset: buffer.toString().length));
  }
}

class CardYearEdit extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    if (newValue.selection.baseOffset == 0) return newValue;
    String input = newValue.text;
    StringBuffer buffer = StringBuffer();
    for (var i = 0; i < input.length; i++) {
      buffer.write(input[i]);
      int index = i + 1;
      if (index % 2 == 0 && input.length != index) {
        buffer.write("/");
      }
    }
    return TextEditingValue(
        text: buffer.toString(),
        selection: TextSelection.collapsed(offset: buffer.toString().length));
  }
}
