import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/model/profile.dart';
import 'package:flutter_application_2/screen/home.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:form_field_validator/form_field_validator.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
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
                          "assets/images/adduser.png",
                          width: 300,
                          height: 210,
                          fit: BoxFit.cover,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 25, left: 10, right: 20),
                          child: Form(
                            key: formKey,
                            child: SingleChildScrollView(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("E-mail", style: TextStyle(fontSize: 20,color: const Color.fromARGB(255, 255, 255, 255))),
                                  TextFormField(
                                    style: TextStyle(color: Colors.white),//เปลี่ยนสีข้อความที่กรอกข้อความ
                                    validator: MultiValidator([
                                      RequiredValidator(
                                          errorText: "กรุณาป้อนอีเมล"),
                                      EmailValidator(
                                          errorText: "อีเมลไม่ถูกต้อง")
                                    ]),
                                    keyboardType: TextInputType.emailAddress,
                                    onSaved: (email) {
                                      profile.email = email!;
                                    },
                                  ),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  Text("Password",
                                      style: TextStyle(fontSize: 20,
                                      color: Colors.white)),
                                  TextFormField(
                                    style: TextStyle(color: const Color.fromARGB(255, 255, 255, 255)),//เปลี่ยนสีข้อความที่กรอกข้อความ
                                    validator: RequiredValidator(
                                        errorText: "กรุณาป้อนรหัสผ่าน"),
                                    obscureText: true,
                                    onSaved: (password) {
                                      profile.password = password!;
                                    },
                                  ),
                                  SizedBox(
                                    width: 400,
                                    height: 100,
                                    child: Padding(
                                        padding: EdgeInsets.only(top: 55),
                                        child: ElevatedButton(
                                          onPressed: () async {
                                            //สร้างแอคเค้าก่อนค่อยเคลียแบบฟอรม
                                            if (formKey.currentState!
                                                .validate()) {
                                              formKey.currentState
                                                  ?.save(); //กดลงทะเบียนข้อมูลก็ไปทำงานที่ ไฟเยอร์เบรด ให้สร้างบัญชีผู้ใช้

                                              // กรอกข้อมูลแล้วสำเร็จและจะresetข้อมูล
                                              try {
                                                await FirebaseAuth.instance
                                                    .createUserWithEmailAndPassword(
                                                        email: profile.email,
                                                        password:
                                                            profile.password)
                                                    .then((value) {
                                                  formKey.currentState?.reset();
                                                  Fluttertoast.showToast(
                                                      //สร้างกล่องแจ้งเตือน
                                                      msg:
                                                          "สร้างบัญชีผู้ใช้เรียบร้อยแล้ว",
                                                      gravity:
                                                          ToastGravity.TOP);
                                                  Navigator.pushReplacement(
                                                      context, //สร้างบัญชีเรียบร้อยแล้วจะเด้งกลับไปหน้าที่ลิ้งค์ไว้*HomeScreen
                                                      MaterialPageRoute(
                                                          builder: (context) {
                                                    return Homescreen();
                                                  }));
                                                });
                                              } on FirebaseAuthException catch (e) {
                                                //catch  ถ้ามีข้อผิดพลาด ให้ print
                                                print(e.code);

                                                String message = '';
                                                if (e.code ==
                                                    'email-already-in-use') {
                                                  message =
                                                      "มีE-mailนี้ในระบบแล้ว โปรดใช้บัญชีอื่น";
                                                } else if (e.code ==
                                                    'weak-password') {
                                                  message =
                                                      'รหัสผ่านต้องมีความยาว 6 ตัวอักษรขึ้นไป';
                                                }

                                                Fluttertoast.showToast(
                                                    //สร้างกล่องแจ้งเตือน
                                                    msg: message,
                                                    gravity: ToastGravity.TOP);
                                              }
                                            }
                                          },
                                          child: Text(
                                            "Sign Up",
                                            style: TextStyle(
                                                color: const Color.fromARGB(
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
