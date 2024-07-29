import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/model/profile.dart';
import 'package:flutter_application_2/screen/welcome.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:form_field_validator/form_field_validator.dart';

class loginscreen extends StatefulWidget {
  const loginscreen({super.key});

  @override
  State<loginscreen> createState() => _loginscreenState();
}

class _loginscreenState extends State<loginscreen> {
  final formKey = GlobalKey<FormState>();
  Profile profile = Profile(email: '', password: '');
  final Future<FirebaseApp> firebase = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: firebase,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Scaffold(
              appBar: AppBar(
                title: Text("Error"),
              ),
              body: Center(
                child: Text("${snapshot.error}"),
              ),
            );
          }
          if (snapshot.connectionState == ConnectionState.done) {
            //เช็คข้อผิดพลาด ไฟเยอร์เบด
            return Scaffold(
              body: Container(
                padding: EdgeInsets.only(top: 40, left: 20),
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    gradient: LinearGradient(colors: [
                  Color.fromARGB(255, 10, 36, 66),
                  Color.fromARGB(255, 10, 36, 66)
                ])),
                child: Column(
                  children: [
                    Image.asset(
                      "assets/images/login.png",
                      width: 300,
                      height: 210,
                      fit: BoxFit.cover,
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 25, left: 10, right: 20),
                      child: Form(
                        key: formKey,
                        child: SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("E-mail",
                                  style: TextStyle(
                                      fontSize: 20,
                                      color:
                                          Color.fromARGB(255, 255, 255, 255))),
                              TextFormField(
                                style: TextStyle(
                                    color: Colors
                                        .white), //เปลี่ยนสีข้อความที่กรอกข้อความ
                                validator: MultiValidator([
                                  RequiredValidator(
                                      errorText: "กรุณาป้อนอีเมล"),
                                  EmailValidator(errorText: "อีเมลไม่ถูกต้อง")
                                ]),
                                keyboardType: TextInputType.emailAddress,
                                onSaved: (email) {
                                  profile.email = email!;
                                },
                              ),
                              SizedBox(
                                height: 25,
                              ),
                              Text("Password",
                                  style: TextStyle(
                                      fontSize: 20,
                                      color:
                                          Color.fromARGB(255, 255, 255, 255))),
                              TextFormField(
                                style: TextStyle(
                                    color: Colors
                                        .white), //เปลี่ยนสีข้อความที่กรอกข้อความ
                                validator: RequiredValidator(
                                    errorText: "กรุณาป้อนรหัสผ่าน"),
                                obscureText: true,
                                onSaved: (password) {
                                  profile.password = password!;
                                },
                              ),
                              SizedBox(
                                  width: 400,
                                  height: 100, //ขนาดของปุ่ม
                                  child: Padding(
                                      padding: EdgeInsets.only(
                                          top: 55), //ปรับตำแหน่งขึ้นลงของปุ่ม
                                      child: ElevatedButton(
                                        onPressed: () async {
                                          //สร้างแอคเค้าก่อนค่อยเคลียแบบฟอรม
                                          if (formKey.currentState!
                                              .validate()) {
                                            formKey.currentState?.save();
                                            //กดลงทะเบียนข้อมูลก็ไปทำงานที่ ไฟเยอร์เบรด ให้าร้างบัญชีผู้ใช้

                                            try {
                                              await FirebaseAuth.instance
                                                  .signInWithEmailAndPassword(
                                                      email: profile.email,
                                                      password:
                                                          profile.password)
                                                  .then((value) {
                                                formKey.currentState?.reset();
                                                Navigator.pushReplacement(
                                                    context, MaterialPageRoute(
                                                        builder: (context) {
                                                  return WelcomeScreen();
                                                }));
                                              });
                                            } on FirebaseAuthException catch (e) {
                                              //catch  ถ้ามีข้อผิดพลาด ให้ print
                                              // print(e.message);
                                              print(e.code);
                                              String message = '';

                                              Fluttertoast.showToast(
                                                  msg: "เกิดข้อผิดพลาด เนื่องจากกรอก E-mail หรือ Plassword ไม่ถูกต้อง",
                                                  gravity: ToastGravity.CENTER);
                                            }
                                          }
                                        },
                                        child: Text(
                                          "Login",
                                          style: TextStyle(
                                              color: Color.fromARGB(
                                                  255, 1, 51, 105)),
                                        ),
                                      )))
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          }
          return Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        });
  }
}
