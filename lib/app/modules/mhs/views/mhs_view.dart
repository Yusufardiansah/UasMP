import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../controllers/auth_controller.dart';
import '../controllers/mhs_controller.dart';

class MhsView extends GetView<MhsController> {
  final authC = Get.find<AuthController>();
  MhsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Container(
            padding: EdgeInsets.only(right: 10),
            child: IconButton(
              onPressed: () {
                authC.backm();
              },
              icon: Icon(Icons.exit_to_app),
            ),
          )
        ],
        elevation: 0,
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: 50,
            ),
            Column(
              children: [
                Container(
                  height: 200,
                  width: 200,
                  child: CircleAvatar(
                      child: Icon(
                    Icons.person,
                    size: 200,
                  )),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "NAMA MAHASISWA",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                )
              ],
            ),
            SizedBox(height: 10),
            Column(
              children: [
                Container(
                  height: 200,
                  width: 200,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        "NPM               : 2142026",
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 5),
                      Text(
                        "tmp/tgl lahir : ciamis",
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 5),
                      Text(
                        "alamat           : bandung",
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 5),
                      Text(
                        "email             : yusuf@gmail.com",
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
