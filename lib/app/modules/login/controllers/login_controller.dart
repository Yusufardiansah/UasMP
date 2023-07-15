import 'package:get/get.dart';
import 'package:flutter/material.dart';

class LoginController extends GetxController {
  TextEditingController emailC = TextEditingController(text: "coba@gmail.com");
  TextEditingController passC = TextEditingController(text: "12341234");

  @override
  void onClose() {
    emailC.dispose();
    passC.dispose();
    super.onClose();
  }
}
