import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:chat_for_peace/core/models/donation_model.dart';

class DonationProvider extends ChangeNotifier {
  List<Donation> donations = [];
  void getDonations() async {
    final snapshotsReference =
        FirebaseFirestore.instance.collection('donations');
    final snapshot = await snapshotsReference.get();
    snapshot.docs.forEach((element) {
      donations.add(Donation.fromJson(element.data()));
    });
    notifyListeners();
    FirebaseFirestore.instance.runTransaction((Transaction tx) async {
      snapshotsReference.snapshots().listen((querySnapshot) {
        donations = [];
        snapshot.docs.forEach((element) {
          donations.add(Donation.fromJson(element.data()));
        });
        notifyListeners();
      });
    });
  }

  void donate({required double value, required int index}) async {
    double currentDonations = donations[index].currentValue;
    DocumentReference doc =
        FirebaseFirestore.instance.collection('donations').doc(index.toString());
    await doc.update({"currentValue": currentDonations + value});
    if (currentDonations + value >= donations[index].finalValue) {
      doc.delete();
    }
  }

  void addDonation({required Donation newDonation}) {
    FirebaseFirestore.instance
        .collection('donations')
        .doc(donations.length.toString())
        .set(newDonation.toJson());
  }
}
