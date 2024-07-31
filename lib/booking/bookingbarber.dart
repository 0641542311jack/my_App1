import 'package:flutter/material.dart';

class BookingBarber extends StatefulWidget {
  String service;
  BookingBarber({required this.service});

  @override
  State<BookingBarber> createState() => _BookingBarberState();
}

class _BookingBarberState extends State<BookingBarber> {
  DateTime _selectedDate = DateTime.now();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: _selectedDate,
        firstDate: DateTime(2024),
        lastDate: DateTime(2025));
        if (picked != null && picked != _selectedDate) {
          setState(() {
            _selectedDate = picked;
          });
        }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "เลือกการจองของคุณ",
          style: TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
        ),
        iconTheme:
            IconThemeData(color: const Color.fromARGB(255, 255, 255, 255)),
        backgroundColor: const Color.fromARGB(255, 4, 37, 72),
      ),
      backgroundColor: const Color.fromARGB(255, 4, 37, 72),
      body: Container(
        margin: EdgeInsets.only(left: 10, top: 0.5, right: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              child: Image.asset(
                "assets/images/shopbarber.png",
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "เบอร์โทรร้านตัดผม:0641542311",
              style: TextStyle(
                  color: const Color.fromARGB(255, 236, 236, 236),
                  fontSize: 10),
            ),
            SizedBox(
              height: 35,
            ),
            Container(
              padding: EdgeInsets.only(
                  top: 10, bottom: 10), //จัดตัวหนังสือในกรอบสี่เหลี่ยม

              decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 255, 153, 0),
                  borderRadius:
                      BorderRadius.circular(20)), //borderRadiusทำมุมโค้ง
              width: MediaQuery.of(context).size.width,
              child: Column(
                children: [
                  Text(
                    "Set a Date",
                    style: TextStyle(
                        color: const Color.fromARGB(255, 4, 37, 72),
                        fontSize: 20,
                        fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center, //จัดกึ่งกลาง
                    children: [
                      GestureDetector(
                        onTap: (){
                          _selectDate(context);
                        },
                        child: Icon(
                          Icons.calendar_month,
                          color: Colors.white,
                          size: 30,
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Text(
                        "${_selectedDate.day}/${_selectedDate.month}/${_selectedDate.year}", //แสดงวันเดือนปีปัจจุบัน
                        style: TextStyle(
                            color: const Color.fromARGB(255, 255, 255, 255),
                            fontSize: 30,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
