import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:hs/Services/PaymentGateway.dart';

class DetailedScreen extends StatefulWidget {
  @override
  _DetailedScreenState createState() => _DetailedScreenState();
}

class _DetailedScreenState extends State<DetailedScreen> {
  DateTime dateTime = DateTime.now();
  TimeOfDay timeOfDay = TimeOfDay.now();

  // @override
  // void initState() {
  //   super.initState();
  //   pickedDate = new DateTime.now();
  //   time = new TimeOfDay.now();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff25282B),
      appBar: AppBar(
        backgroundColor: const Color(0xff25282B),
        elevation: 0.0,
        actions: [
          IconButton(
            icon: Icon(Icons.share_outlined),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(bottom: 15.0),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.all(10.0),
                child: Text(
                  Get.arguments['title'],
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 25.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10.0),
                child: Text(
                  Get.arguments['description'],
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 18.0,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 5.0, left: 8.0),
                child: Row(
                  children: [
                    Icon(
                      FontAwesomeIcons.star,
                      color: const Color(0xffFCC100),
                      size: 18.0,
                    ),
                    Icon(
                      FontAwesomeIcons.star,
                      color: const Color(0xffFCC100),
                      size: 18.0,
                    ),
                    Icon(
                      FontAwesomeIcons.star,
                      color: const Color(0xffFCC100),
                      size: 18.0,
                    ),
                    Icon(
                      FontAwesomeIcons.star,
                      color: const Color(0xffFCC100),
                      size: 18.0,
                    ),
                    Icon(
                      FontAwesomeIcons.starHalf,
                      color: const Color(0xffFCC100),
                      size: 18.0,
                    ),
                    Text(
                      Get.arguments["ratings"],
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 15.0,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0, left: 15.0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.deepPurple,
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        constraints: BoxConstraints(maxWidth: 200.0),
                        // height: 30.0,
                        // width: 100.0,
                        child: Padding(
                          padding: EdgeInsets.all(5.0),
                          child: Text(
                            Get.arguments["tag"],
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16.0,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10.0),
                child: Container(
                  height: 300,
                  width: 600,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.fitWidth,
                      image: NetworkImage(
                        Get.arguments['images'],
                      ),
                    ),
                  ),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  // RaisedButton(
                  //   child: Text(
                  //     'Select Date...',
                  //     style: TextStyle(color: Colors.white),
                  //   ),
                  //   onPressed: () => showBottomSheet(
                  //     context: context,
                  //     builder: (context) => Container(
                  //       child: buildDatePicker(),
                  //     ),
                  //   ),
                  // ),

                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  //   children: [
                  //     Text(
                  //       _dateTime == null
                  //           ? 'Date : ${_dateTime.year} - ${_dateTime.month} - ${_dateTime.day}'
                  //           : _dateTime.toString(),
                  //       style: TextStyle(color: Colors.white),
                  //     ),
                  //     FlatButton(
                  //       child: Text('Pick a Date...'),
                  //       onPressed: () {
                  //         showDatePicker(
                  //           context: context,
                  //           initialDate: _dateTime,
                  //           firstDate: DateTime(DateTime.now().year - 1),
                  //           lastDate: DateTime(DateTime.now().year + 5),
                  //         ).then(
                  //           (date) {
                  //             setState(() {
                  //               _dateTime = date;
                  //             });
                  //           },
                  //         );
                  //       },
                  //     ),
                  //   ],
                  // ),

                  ListTile(
                      title: Text(
                        (" Date : ${dateTime.year} - ${dateTime.month} - ${dateTime.day}"),
                        style: TextStyle(color: Colors.white),
                      ),
                      trailing: Icon(
                        Icons.date_range_sharp,
                        color: Colors.white,
                      ),
                      onTap: () async {
                        DateTime date = await showDatePicker(
                          context: context,
                          initialDate: dateTime,
                          firstDate: new DateTime(DateTime.now().year - 1),
                          lastDate: new DateTime(DateTime.now().year + 5),
                        );

                        if (date != null)
                          setState(() {
                            dateTime = date;
                          });
                      }),
                  ListTile(
                    title: Text(
                      " Time : ${timeOfDay.hour}:${timeOfDay.minute}",
                      style: TextStyle(color: Colors.white),
                    ),
                    trailing: Icon(
                      Icons.timelapse_sharp,
                      color: Colors.white,
                    ),
                    onTap: () async {
                      TimeOfDay t = await showTimePicker(
                        context: context,
                        initialTime: timeOfDay,
                      );

                      if (t != null)
                        setState(() {
                          timeOfDay = t;
                        });
                    },
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(top: 15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    GestureDetector(
                      onTap: () async {
                        await FirebaseFirestore.instance
                            .collection("wishlist")
                            .add({
                          'title': Get.arguments["title"],
                          'images': Get.arguments['images'],
                          'tag': Get.arguments['tag'],
                          'ratings': Get.arguments['ratings'],
                          'price': Get.arguments['price'],
                          'offer': Get.arguments['offer'],
                        }).whenComplete(() {
                          Get.snackbar("Woohhoo",
                              '${Get.arguments['title']} is added to Wishlist',
                              colorText: Colors.black,
                              snackPosition: SnackPosition.TOP,
                              backgroundColor: Color(0xffBFD8F9));
                          //0xffCEE3FF
                        });
                      },
                      child: Container(
                        width: 170.0,
                        height: 50.0,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          color: Color(0xffBFD8F9),
                        ),
                        child: Center(
                          child: Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              "Add To Wishlist",
                              style: TextStyle(
                                color: Color(0xff217AF1),
                                fontWeight: FontWeight.bold,
                                fontSize: 18.0,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    GetBuilder<PaymentGateway>(
                      init: PaymentGateway(),
                      builder: (value) {
                        return GestureDetector(
                          onTap: () {
                            value.dispatchPayment(599.0, 'Household Solutions',
                                1234567890, 'test_HS@gmail.com', 'Google Pay');
                          },
                          child: Container(
                            width: 170.0,
                            height: 50.0,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                              color: const Color(0xff217AF1),
                            ),
                            child: Center(
                              child: Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text(
                                  "Book Now",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18.0,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Widget buildDatePicker() => SizedBox(
  //       height: 160.0,
  //       child: CupertinoDatePicker(
  //         minimumYear: DateTime.now().year,
  //         maximumYear: 2025,
  //         initialDateTime: dateTime,
  //         mode: CupertinoDatePickerMode.date,
  //         onDateTimeChanged: (dateTime) =>
  //             setState(() => this.dateTime = dateTime),
  //       ),
  //     );

  // _pickDate() async {
  //   DateTime date = await showDatePicker(
  //     context: context,
  //     initialDate: pickedDate,
  //     firstDate: new DateTime(DateTime.now().year - 1),
  //     lastDate: new DateTime(DateTime.now().year + 5),
  //   );

  //   if (date != null)
  //     setState(() {
  //       pickedDate = date;
  //     });
  // }

  // _pickTime() async {
  //   TimeOfDay t = await showTimePicker(
  //     context: context,
  //     initialTime: time,
  //   );

  //   if (t != null)
  //     setState(() {
  //       time = t;
  //     });
  // }
}
