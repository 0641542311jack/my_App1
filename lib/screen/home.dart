import 'package:flutter/material.dart';
import 'package:flutter_application_2/screen/login.dart';
import 'package:flutter_application_2/screen/register.dart';

class Homescreen extends StatelessWidget {
  const Homescreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 10, 36, 66),
        body: Padding(
          padding: const EdgeInsets.fromLTRB(10, 50, 10, 0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Image.asset(
                  "assets/images/imageHome.png",
                  width: 350,
                  height: 280,
                  fit: BoxFit.cover,
                ),
                SizedBox(
                  width: double.infinity,
                  height: 130, //ขนาดปุ่ม
                  child: Padding(
                      padding: EdgeInsets.only(top: 42),
                      child: Container(
                        decoration: BoxDecoration(boxShadow: [
                          BoxShadow(
                            color: Colors.black26.withOpacity(0.5), //สีเงา
                            spreadRadius: 3, //รัศมีการกระจาย
                            blurRadius: 30, //ความเบลอ
                            offset: Offset(0, 10),
                          ),
                        ]),
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return RegisterScreen();
                            }));
                          },
                          child: Text(
                            "สร้างบัญชี",
                            style: TextStyle(
                              fontSize: 25,
                              color: Color.fromARGB(255, 10, 36, 66),
                            ),
                          ),
                        ),
                      )),
                ),
                SizedBox(
                    width: double.infinity,
                    height: 110,
                    child: Padding(
                        padding: EdgeInsets.only(top: 22),
                        child: Container(
                          decoration: BoxDecoration(boxShadow: [
                            BoxShadow(
                              color: Colors.black26.withOpacity(0.5), //สีเงา
                              spreadRadius: 7, //รัศมีการกระจาย
                              blurRadius: 30, //ความเบลอ
                              offset: Offset(0, 10),
                            ),
                          ]),
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.pushReplacement(context,
                                  MaterialPageRoute(builder: (context) {
                                return loginscreen(); //เชื่อมไปหน้า login
                              }));
                            },
                            child: Text(
                              "เข้าสู่ระบบ",
                              style: TextStyle(
                                  fontSize: 25,
                                  color: const Color.fromARGB(255, 10, 36, 66)),
                            ),
                          ),
                        ))),
              ],
            ),
          ),
        ));
  }
}
