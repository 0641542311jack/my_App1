import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/screen/booking.dart';
import 'package:flutter_application_2/screen/hair.dart';
import 'package:flutter_application_2/screen/home.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  final auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 4, 37, 72),
      body: Container(
        margin: EdgeInsets.only(top: 40, left: 20, right: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Welcome",
                  style: TextStyle(
                      color: const Color.fromARGB(255, 255, 255, 255),
                      fontSize: 20,
                      fontWeight: FontWeight.w500),
                )
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Divider(
              color: Colors.black, //เส้น
            ),
            Text(
              "Services",
              style: TextStyle(
                  color: const Color.fromARGB(255, 255, 153, 0),
                  fontSize: 24,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Flexible(
                  fit: FlexFit.tight,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  Hair(service: "ทรงผมแนะนำ")));
                    },
                    child: Container(
                      height: 130,
                      width: 150,
                      decoration: BoxDecoration(
                          color: Color.fromARGB(255, 255, 153, 0),
                          borderRadius: BorderRadius.circular(
                              15), //ทำให้ปุ่มโค้งไม่เป็นเหลี่ยม
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.6), // สีของเงา
                              spreadRadius: 5, // การกระจายของเงา
                              blurRadius: 20, // การเบลอของเงา
                              offset: Offset(0, 3), // ตำแหน่งของเงา
                            )
                          ]),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            "assets/images/h11.png",
                            width: 80,
                            height: 80,
                          ),
                          SizedBox(
                            height: 0.1,
                          ),
                          Text(
                            "ทรงผมแนะนำ",
                            style: TextStyle(
                                color: const Color.fromARGB(255, 255, 255, 255),
                                fontSize: 18,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                Flexible(
                  fit: FlexFit.tight,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  Booking(service: "จองร้านตัดผม")));
                    },
                    child: Container(
                      height: 130,
                      width: 150,
                      decoration: BoxDecoration(
                          color: Color.fromARGB(255, 255, 153, 0),
                          borderRadius: BorderRadius.circular(15),//ทำให้ปุ่มโค้งไม่เป็นเหลี่ยม
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.6), // สีของเงา
                              spreadRadius: 5, // การกระจายของเงา
                              blurRadius: 20, // การเบลอของเงา
                              offset: Offset(0, 3), // ตำแหน่งของเงา
                            )
                          ]), 
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            "assets/images/shop1.png",
                            width: 80,
                            height: 80,
                          ),
                          SizedBox(
                            height: 0.5,
                          ),
                          Text(
                            "จองร้านตัดผม",
                            style: TextStyle(
                                color: const Color.fromARGB(255, 255, 255, 255),
                                fontSize: 18,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Flexible(
                  fit: FlexFit.tight,
                  child: Container(
                    height: 130,
                    width: 150,
                    decoration: BoxDecoration(
                        color: Color.fromARGB(255, 255, 153, 0),
                        borderRadius: BorderRadius.circular(15),//ทำให้ปุ่มโค้งไม่เป็นเหลี่ยม
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.6), // สีของเงา
                            spreadRadius: 5, // การกระจายของเงา
                            blurRadius: 20, // การเบลอของเงา
                            offset: Offset(0, 3), // ตำแหน่งของเงา
                          )
                        ]), 
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          "assets/images/H2.png",
                          width: 140,
                          height: 80,
                        ),
                        SizedBox(
                          height: 0.1,
                        ),
                        Text(
                          "แนะนำโครงหน้า",
                          style: TextStyle(
                              color: const Color.fromARGB(255, 255, 255, 255),
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                Flexible(
                  fit: FlexFit.tight,
                  child: Container(
                    height: 130,
                    width: 150,
                    decoration: BoxDecoration(
                        color: Color.fromARGB(255, 255, 153, 0),
                        borderRadius: BorderRadius.circular(15), //ทำให้ปุ่มโค้งไม่เป็นเหลี่ยม
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.6), // สีของเงา
                            spreadRadius: 5, // การกระจายของเงา
                            blurRadius: 20, // การเบลอของเงา
                            offset: Offset(0, 3), // ตำแหน่งของเงา
                          )
                        ]),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          "assets/images/hair2.png",
                          width: 175,
                          height: 90,
                        ),
                        SizedBox(
                          height: 0.5,
                        ),
                        Text(
                          "จองร้านตัดผม",
                          style: TextStyle(
                              color: const Color.fromARGB(255, 255, 255, 255),
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
