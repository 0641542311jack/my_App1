import 'package:flutter/material.dart';

class Booking extends StatefulWidget {
  String service;
  Booking({required this.service});
  

  @override
  State<Booking> createState() => _BookingState();
}

class _BookingState extends State<Booking> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 4, 37, 72),
      body: Container(
        margin: EdgeInsets.only(left: 10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          GestureDetector(
            onTap: (){
              Navigator.pop(context);
            },
            child: Padding(
              padding: const EdgeInsets.only(left: 10.0, top: 60.0),   
              child: Icon(Icons.arrow_back_ios_new_rounded,color: Colors.white, size: 30,),   //ปุ่มย้อนกลับ
            ),
          ),
          SizedBox(height: 30.0,),
          Text("เลือกร้านตัดผม",style: TextStyle(color: Colors.white, fontSize: 25),)
        ],),
      ),
      
    );
  }
}