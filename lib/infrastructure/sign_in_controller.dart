import 'package:final_project/infrastructure/database.dart';
import 'package:final_project/screens/home_screen.dart';
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
    if (email!.text == await getEmail() &&
        password!.text == await getPassword()) {
      Fluttertoast.showToast(
          msg: "Sign In Successfully",
          backgroundColor: MyColors.green,
          fontSize: 15,
          textColor: MyColors.grey,
          gravity: ToastGravity.BOTTOM);
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => HomeScreen()));
    } else if (email!.text != await getEmail()) {
      Fluttertoast.showToast(
          msg: "Invalid Email",
          backgroundColor: MyColors.green,
          fontSize: 15,
          textColor: MyColors.grey,
          gravity: ToastGravity.BOTTOM);
    } else if (password!.text != await getPassword()) {
      Fluttertoast.showToast(
          msg: "Wrong Password",
          backgroundColor: MyColors.green,
          fontSize: 15,
          textColor: MyColors.grey,
          gravity: ToastGravity.BOTTOM);
    }
  }
}
