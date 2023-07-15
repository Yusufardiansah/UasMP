import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:uas_mp/app/controllers/auth_controller.dart';
import 'package:uas_mp/app/routes/app_pages.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  final authC = Get.find<AuthController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Selamat Datang'),
        centerTitle: true,
      ),
      body: ListView(
        scrollDirection: Axis.vertical,
        children: [
          Padding(
            padding: const EdgeInsets.all(25),
            child: Column(
              children: [
                Text(
                  "STMIK AMIK BANDUNG",
                  style: TextStyle(
                      fontSize: 30,
                      color: Colors.blue,
                      fontWeight: FontWeight.bold),
                ),
                Image.asset("assets/image.png"),
                SizedBox(
                  height: 25,
                ),
                TextField(
                  controller: controller.emailC,
                  decoration: InputDecoration(labelText: "Email"),
                ),
                TextField(
                  controller: controller.passC,
                  decoration: InputDecoration(labelText: "password"),
                ),
                SizedBox(
                  height: 50,
                ),
                ElevatedButton(
                  onPressed: () => authC.login(
                      controller.emailC.text, controller.passC.text),
                  child: Text("LOGIN"),
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Belum punya akun?"),
                    TextButton(
                        onPressed: () => Get.toNamed(Routes.SIGNUP),
                        child: Text("Buat akun"))
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
