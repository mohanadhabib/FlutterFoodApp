import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:final_project/infrastructure/database.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final getProvider =
    ChangeNotifierProvider<GetPhoneAndEmail>((ref) => GetPhoneAndEmail());

class GetPhoneAndEmail extends ChangeNotifier {
  String? phone, email;
  Future<void> getPhoneEmail() async {
    DocumentSnapshot? snapshot = await Database.database
        .collection("Users")
        .doc(Database.auth.currentUser!.uid)
        .get();
    phone = snapshot['mobile phone'];
    email = snapshot['email'];
    notifyListeners();
  }
}
