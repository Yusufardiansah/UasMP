import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:uas_mp/app/controllers/auth_controller.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  final authC = Get.find<AuthController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: RichText(
          text: TextSpan(
            text: "Hai, ",
            style: TextStyle(fontSize: 18),
            children: [
              TextSpan(
                text: "Mahasiswa",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              )
            ],
          ),
        ),
        centerTitle: false,
        actions: [
          Container(
            padding: EdgeInsets.only(right: 10),
            child: IconButton(
              // onPressed: () => authC.logout(), icon: Icon(Icons.exit_to_app)
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: Text("conform"),
                      content: Text("Yakin Keluar ?"),
                      actions: [
                        TextButton(
                            onPressed: () {
                              authC.logout();
                            },
                            child: Text("Keluar")),
                        TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: Text("Batal"))
                      ],
                      elevation: 0,
                    );
                  },
                );
              },
              icon: Icon(Icons.exit_to_app),
            ),
          )
        ],
        elevation: 0,
      ),
      body: Stack(
        children: [
          ClipPath(
            clipper: ClipPathClass(),
            child: Container(
              width: Get.width,
              height: 250,
              color: Colors.blue,
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 100),
            child: Column(
              children: [
                Container(
                    height: Get.height * 0.4,
                    child: Column(
                      children: [
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 25),
                          width: 500,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(40.0),
                                bottomRight: Radius.circular(40.0),
                                topLeft: Radius.circular(40.0),
                                bottomLeft: Radius.circular(40.0)),
                            gradient: LinearGradient(
                              colors: [Colors.white, Colors.white],
                            ),
                          ),
                          child: Column(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(
                                    top: 20, right: 8, left: 8, bottom: 3),
                                child: Text(
                                  "Selamat Datang",
                                  style: TextStyle(
                                      fontSize: 30,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              Container(
                                height: 300,
                                child: Image.asset(
                                  "assets/image.png",
                                  fit: BoxFit.contain,
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    )),
                Container(
                  height: 7,
                  color: Color(0xFFF1F2F6),
                ),
                Expanded(
                  child: ListView(
                    padding: EdgeInsets.symmetric(horizontal: 25, vertical: 30),
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          menu(
                            title: "Mahasiswa",
                            icon: IconButton(
                              onPressed: () {
                                authC.mhs();
                              },
                              icon: Icon(Icons.people),
                            ),
                          ),
                          menu(
                            title: "Jadwal",
                            icon: Icon(Icons.punch_clock),
                          ),
                          menu(
                            title: "Keuangan",
                            icon: Icon(Icons.money),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      // Row(
                      //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //   children: [
                      //     menu(
                      //       title: "Mahasiswa",
                      //       icon: Icon(
                      //         IconData(0xee35, fontFamily: 'MaterialIcons'),
                      //       ),
                      //     ),
                      //     menu(
                      //       title: "Jadwal",
                      //       icon: Icon(
                      //         IconData(0xe038, fontFamily: 'MaterialIcons'),
                      //       ),
                      //     ),
                      //     menu(
                      //       title: "Keuangan",
                      //       icon: Icon(
                      //         IconData(0xee33, fontFamily: 'MaterialIcons'),
                      //       ),
                      //     ),
                      //   ],
                      // ),
                      // SizedBox(
                      //   height: 40,
                      // ),
                      // Row(
                      //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //   children: [
                      //     menu(
                      //       title: "Mahasiswa",
                      //       icon: Icon(
                      //         IconData(0xee35, fontFamily: 'MaterialIcons'),
                      //       ),
                      //     ),
                      //     menu(
                      //       title: "Jadwal",
                      //       icon: Icon(
                      //         IconData(0xe038, fontFamily: 'MaterialIcons'),
                      //       ),
                      //     ),
                      //     menu(
                      //       title: "Keuangan",
                      //       icon: Icon(
                      //         IconData(0xee33, fontFamily: 'MaterialIcons'),
                      //       ),
                      //     ),
                      //   ],
                      // ),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class menu extends StatelessWidget {
  menu({
    super.key,
    required this.title,
    required this.icon,
  });
  final String title;
  final Widget icon;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          width: 50,
          height: 30,
          child: icon,
        ),
        SizedBox(height: 5),
        Text(
          title,
          style: TextStyle(fontSize: 20),
        ),
      ],
    );
  }
}

class ClipPathClass extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height - 60);
    path.quadraticBezierTo(
        size.width / 2, size.height, size.width, size.height - 60);
    path.lineTo(size.width, 0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    // TODO: implement shouldReclip
    throw UnimplementedError();
  }
}
