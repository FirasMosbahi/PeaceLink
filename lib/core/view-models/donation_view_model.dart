import 'package:PeaceLink/core/models/donation_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';

//This class contains all the logic operations related to the donations
class DonationProvider extends ChangeNotifier {
  List<Donation> donations = [];
  bool hasLoaded = true;
  bool init = true;
  Future<bool> getDonations() async {
    if (init) {
      CollectionReference<Map<String, dynamic>> snapshotsReference =
          FirebaseFirestore.instance.collection('donations');
      QuerySnapshot<Map<String, dynamic>> snapshot =
          await snapshotsReference.get();
      snapshot.docs.forEach((element) {
        if (donations.where((e) => e.id == element.id).isEmpty) {
          donations.add(Donation.fromJson(element.data()));
          hasLoaded = false;
        }
        if (!hasLoaded) {
          hasLoaded = true;
          notifyListeners();
        }
      });
    }
    return true;
  }

  Future<bool> getDonationsByCategory(String category) async {
    init = false;
    donations = [];
    Query<Map<String, dynamic>> snapshotsReference = FirebaseFirestore.instance
        .collection('donations')
        .where("category", isEqualTo: category);
    QuerySnapshot<Map<String, dynamic>> snapshot =
        await snapshotsReference.get();
    snapshot.docs.forEach((element) {
      if (donations.where((e) => e.id == element.id).isEmpty) {
        donations.add(
          Donation.fromJson(
            element.data(),
          ),
        );
        hasLoaded = false;
      }
      if (!hasLoaded) {
        hasLoaded = true;
        notifyListeners();
      }
    });
    return true;
  }

  Future<bool> donate(
      {required double value, required Donation donation}) async {
    double currentDonations = donation.currentValue;
    DocumentReference doc =
        FirebaseFirestore.instance.collection('donations').doc(donation.id);
    currentDonations += value;
    await doc.update({"currentValue": currentDonations});
    if (currentDonations >= donation.finalValue) {
      await doc.delete();
    }
    donations = [];
    hasLoaded = false;
    await getDonations();
    return true;
  }

  Future<bool> addDonation({required Donation newDonation}) async {
    newDonation.id = DateTime.now().toString() +
        (FirebaseAuth.instance.currentUser?.uid ?? "");
    newDonation.creator = FirebaseAuth.instance.currentUser?.uid ?? "";
    await FirebaseFirestore.instance
        .collection('donations')
        .doc(newDonation.id)
        .set(newDonation.toJson());
    return true;
  }
}
