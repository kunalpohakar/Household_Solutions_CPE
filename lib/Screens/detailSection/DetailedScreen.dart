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
            // Container(
            //   width: 375,
            //   height: 50,
            //   decoration: BoxDecoration(
            //     color: const Color(0xff217AF1),
            //     borderRadius: BorderRadius.circular(10.0),
            //   ),
            //   child: Center(
            //     child: Text(
            //       "Book Now",
            //       style: TextStyle(
            //         color: Colors.white,
            //         fontSize: 24.0,
            //         fontWeight: FontWeight.bold,
            //       ),
            //     ),
            //   ),
            // ),
            Padding(
              padding: EdgeInsets.only(top: 15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: () async {
                      await FirebaseFirestore.instance
                          .collection('wishlist')
                          .add({
                        'title': Get.arguments['title'],
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
                          value.dispatchPayment(599, 'Household Solutions',
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
                  //
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
