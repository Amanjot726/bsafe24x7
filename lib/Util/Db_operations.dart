import 'package:bsafe24x7/Util/Constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

fetchHelplineNumbers() {
  Stream<QuerySnapshot> stream = FirebaseFirestore.instance.collection(Util.HELPLINE_COLLECTION).snapshots();
  return stream;
}
