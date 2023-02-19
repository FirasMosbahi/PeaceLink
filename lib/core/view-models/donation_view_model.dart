import 'package:chat_for_peace/core/models/donation_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';

class DonationProvider extends ChangeNotifier {
  List<Donation> donations = [];
  bool hasLoaded = true;
  bool init = true;
  Future<bool> getDonations() async {
    if (init) {
      final snapshotsReference =
          FirebaseFirestore.instance.collection('donations');
      final snapshot = await snapshotsReference.get();
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
    print("start");
    donations = [];
    final snapshotsReference = FirebaseFirestore.instance
        .collection('donations')
        .where("category", isEqualTo: category);
    print(0);
    final snapshot = await snapshotsReference.get();
    print(1);
    snapshot.docs.forEach((element) {
      print(2);
      print(element.data());
      if (donations.where((e) => e.id == element.id).isEmpty) {
        donations.add(Donation.fromJson(element.data()));
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
    print("getting doc");
    currentDonations += value;
    await doc.update({"currentValue": currentDonations});

    print("loaded");
    print("updating doc");
    if (currentDonations >= donation.finalValue) {
      await doc.delete();
      print("deleting doc");
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
