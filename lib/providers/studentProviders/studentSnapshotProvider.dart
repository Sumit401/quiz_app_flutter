import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

class SnapshotProvider extends ChangeNotifier {
  late Stream<QuerySnapshot<Map<String, dynamic>>> firestoreSnapshots;

  void setfirestoreSnapshots(value) {
    firestoreSnapshots = value;
    notifyListeners();
  }
}
