import 'package:final_project/infrastructure/database.dart';
import 'package:final_project/screens/home_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../style/colors.dart';

final signInProvider =
    ChangeNotifierProvider<SignInController>((ref) => SignInController());

class SignInController extends ChangeNotifier {
  TextEditingController? email = TextEditingController();
  TextEditingController? password = TextEditingController();
  bool visible = true;
  void disablePass() {
    visible = !visible;
    notifyListeners();
  }

  Future<String> getEmail() async {
    var email = await Database.database
        .collection("Users")
        .doc(Database.auth.currentUser!.uid)
        .get();
    return email['email'];
  }

  Future<String> getPassword() async {
    var password = await Database.database
        .collection("Users")
        .doc(Database.auth.currentUser!.uid)
        .get();
    return password['password'];
  }

  Future<void> signIn(BuildContext context) async {
    try {
      await Database.auth.signInWithEmailAndPassword(
          email: email!.text, password: password!.text);
      Fluttertoast.showToast(
          msg: "Sign In Successfully",
          backgroundColor: MyColors.green,
          fontSize: 15,
          textColor: MyColors.grey,
          gravity: ToastGravity.BOTTOM);
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => HomeScreen()));
    } on FirebaseAuthException catch (e) {
      Fluttertoast.showToast(
          msg: e.code.toString().toUpperCase(),
          backgroundColor: MyColors.green,
          fontSize: 15,
          textColor: MyColors.grey,
          gravity: ToastGravity.BOTTOM);
    }
  }
}
