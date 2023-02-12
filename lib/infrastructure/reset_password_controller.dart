import 'package:final_project/infrastructure/database.dart';
import 'package:final_project/screens/password_reset_success.dart';
import 'package:final_project/style/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';

final reset = ChangeNotifierProvider((ref) => ChangePassword());

class ChangePassword extends ChangeNotifier {
  TextEditingController newPassword = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();
  bool isLockOne = false, isLockTwo = false;
  void changeOne() {
    isLockOne = !isLockOne;
    notifyListeners();
  }

  void changeTwo() {
    isLockTwo = !isLockTwo;
    notifyListeners();
  }

  Future<void> resetPassword(BuildContext context) async {
    if (newPassword.text == "") {
      Fluttertoast.showToast(
          msg: "Please Enter Password",
          backgroundColor: MyColors.green,
          fontSize: 15,
          textColor: MyColors.grey,
          gravity: ToastGravity.BOTTOM);
    } else if (confirmPassword.text == "") {
      Fluttertoast.showToast(
          msg: "Please Confirm Your Password",
          backgroundColor: MyColors.green,
          fontSize: 15,
          textColor: MyColors.grey,
          gravity: ToastGravity.BOTTOM);
    } else if (newPassword.text != confirmPassword.text) {
      Fluttertoast.showToast(
          msg: "Sorry, Password Doesn't Match",
          backgroundColor: MyColors.green,
          fontSize: 15,
          textColor: MyColors.grey,
          gravity: ToastGravity.BOTTOM);
    } else {
      await Database.database
          .collection("Users")
          .doc(Database.auth.currentUser!.uid)
          .update({"password": newPassword.text});
      await Database.auth
          .confirmPasswordReset(code: "", newPassword: newPassword.text);
      await Database.auth.currentUser!.updatePassword(newPassword.text);
      Fluttertoast.showToast(
          msg: "Reset Password Successfully",
          backgroundColor: MyColors.green,
          fontSize: 15,
          textColor: MyColors.grey,
          gravity: ToastGravity.BOTTOM);
      newPassword.clear();
      confirmPassword.clear();
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (context) => PasswordResetSuccess()));
    }
    notifyListeners();
  }
}
