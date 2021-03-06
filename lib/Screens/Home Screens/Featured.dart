// import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:giffy_dialog/giffy_dialog.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hs/Screens/Home%20Screens/Search.dart';
import 'package:hs/Screens/detailSection/DetailedScreen.dart';
import 'package:hs/Services/DataController.dart';
// import 'package:material_floating_search_bar/material_floating_search_bar.dart';
import 'package:page_transition/page_transition.dart';

class Featured extends StatefulWidget {
  Featured({Key key}) : super(key: key);

  @override
  _FeaturedState createState() => _FeaturedState();
}

class _FeaturedState extends State<Featured> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff25282B),
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: const Color(0xff25282B),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () => Navigator.pushReplacement(
                context,
                PageTransition(
                    child: Search(),
                    type: PageTransitionType.leftToRightWithFade)),
          ),
        ],
        title: Text(
          "Home",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(
                left: 8.0,
                right: 8.0,
              ),
              child: Container(
                height: 300.0,
                width: 400.0,
                child: Image(
                  image: AssetImage('images/banner.png'),
                ),
                // color: Colors.cyan,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 60.0,
                width: 400.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(7.0),
                  color: const Color(0xff145DA0),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          FontAwesomeIcons.ticketAlt,
                          color: Color(0xffBFD8F9),
                        ),
                        SizedBox(
                          width: 15.0,
                        ),
                        Text(
                          "Services now on sale",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 21.0,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          width: 15.0,
                        ),
                        Icon(
                          FontAwesomeIcons.ticketAlt,
                          color: Color(0xffBFD8F9),
                        ),
                      ],
                    ),
                    Text(
                      "2 Day's Left!",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 11.0, top: 8.0),
              child: Text(
                "Featured",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 21.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(
              height: 350.0,
              width: 500.0,
              child: GetBuilder<DataController>(
                init: DataController(),
                builder: (value) {
                  return FutureBuilder(
                    future: value.getData("featured"),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Center(
                          child: CircularProgressIndicator(
                            backgroundColor: Colors.white,
                          ),
                        );
                      } else {
                        return new ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: snapshot.data.length,
                          itemBuilder: (BuildContext context, int index) {
                            return GestureDetector(
                              onTap: () {
                                Get.to(() => DetailedScreen(),
                                    transition: Transition.leftToRightWithFade,
                                    arguments: snapshot.data[index]);
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(10.0),
                                        child: Container(
                                          height: 120.0,
                                          width: 200.0,
                                          decoration: BoxDecoration(
                                            image: DecorationImage(
                                              fit: BoxFit.fitWidth,
                                              image: NetworkImage(snapshot
                                                  .data[index]
                                                  .data()["images"]),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            top: 8.0, left: 10.0),
                                        child: Container(
                                          constraints:
                                              BoxConstraints(maxWidth: 200.0),
                                          child: Text(
                                            snapshot.data[index]
                                                .data()["title"],
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 18.0,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            top: 8.0, left: 10.0),
                                        child: Container(
                                          // constraints:
                                          //     BoxConstraints(maxWidth: 200.0),
                                          child: Text(
                                            snapshot.data[index]
                                                .data()["offer"],
                                            style: TextStyle(
                                              color: Colors.grey,
                                              fontSize: 16.0,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Row(
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsets.only(left: 10.0),
                                            child: Icon(
                                              FontAwesomeIcons.rupeeSign,
                                              color: Colors.white,
                                              size: 16.0,
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(top: 2.0),
                                            child: Container(
                                              // constraints:
                                              //     BoxConstraints(maxWidth: 200.0),
                                              child: Text(
                                                snapshot.data[index]
                                                    .data()["price"],
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 18.0,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            top: 5.0, left: 8.0),
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
                                              snapshot.data[index]
                                                  .data()["ratings"],
                                              style: TextStyle(
                                                color: Colors.grey,
                                                fontSize: 15.0,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            top: 10.0, left: 10.0),
                                        child: Container(
                                          decoration: BoxDecoration(
                                            color: Colors.red,
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                          constraints:
                                              BoxConstraints(maxWidth: 200.0),
                                          // height: 30.0,
                                          // width: 100.0,
                                          child: Padding(
                                            padding: EdgeInsets.all(5.0),
                                            child: Text(
                                              snapshot.data[index]
                                                  .data()["tag"],
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
                              ),
                            );
                          },
                        );
                      }
                    },
                  );
                },
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(11.0),
                  child: Container(
                    height: 250.0,
                    width: 400.0,
                    // decoration: BoxDecoration(
                    //   borderRadius: BorderRadius.circular(10.0),
                    color: Colors.black,

                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "Top Companies trust HS",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 22.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          height: 45.0,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Icon(
                                FontAwesomeIcons.pizzaSlice,
                                color: Colors.grey,
                                size: 40.0,
                              ),
                              Icon(
                                FontAwesomeIcons.creativeCommonsRemix,
                                color: Colors.grey,
                                size: 40.0,
                              ),
                              Icon(
                                FontAwesomeIcons.pizzaSlice,
                                color: Colors.grey,
                                size: 40.0,
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 40.0,
                        ),
                        TextButton(
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (_) => NetworkGiffyDialog(
                                image: Image.network(
                                  'https://media.giphy.com/media/ignaF0h8CcPt5OT4DL/giphy.gif',
                                  fit: BoxFit.cover,
                                ),
                                title: Text(
                                  "Comming Soon...",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: const Color(0xff217AF1),
                                    fontSize: 30.0,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                description: Text(
                                  'You can do Business with HS',
                                  textAlign: TextAlign.center,
                                ),
                                onlyCancelButton: true,
                                buttonCancelColor: Color(0xff217AF1),
                                entryAnimation: EntryAnimation.BOTTOM_LEFT,
                              ),
                            );
                          },
                          child: Text(
                            "Try HS for Business",
                            style: TextStyle(
                              color: const Color(0xff217AF1),
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 11.0, top: 8.0),
              child: Text(
                "Top Services",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 21.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(
              height: 325.0,
              width: 500.0,
              child: GetBuilder<DataController>(
                init: DataController(),
                builder: (value) {
                  return FutureBuilder(
                    future: value.getData("top"),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Center(
                          child: CircularProgressIndicator(
                            backgroundColor: Colors.white,
                          ),
                        );
                      } else {
                        return new ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: snapshot.data.length,
                          itemBuilder: (BuildContext context, int index) {
                            return GestureDetector(
                              onTap: () {
                                Get.to(() => DetailedScreen(),
                                    transition: Transition.leftToRightWithFade,
                                    arguments: snapshot.data[index]);
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(10.0),
                                        child: Container(
                                          height: 120.0,
                                          width: 200.0,
                                          decoration: BoxDecoration(
                                            image: DecorationImage(
                                              fit: BoxFit.fitWidth,
                                              image: NetworkImage(snapshot
                                                  .data[index]
                                                  .data()["images"]),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            top: 8.0, left: 10.0),
                                        child: Container(
                                          constraints:
                                              BoxConstraints(maxWidth: 200.0),
                                          child: Text(
                                            snapshot.data[index]
                                                .data()["title"],
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 18.0,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            top: 8.0, left: 10.0),
                                        child: Container(
                                          // constraints:
                                          //     BoxConstraints(maxWidth: 200.0),
                                          child: Text(
                                            snapshot.data[index]
                                                .data()["offer"],
                                            style: TextStyle(
                                              color: Colors.grey,
                                              fontSize: 16.0,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Row(
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsets.only(left: 10.0),
                                            child: Icon(
                                              FontAwesomeIcons.rupeeSign,
                                              color: Colors.white,
                                              size: 16.0,
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(top: 2.0),
                                            child: Container(
                                              // constraints:
                                              //     BoxConstraints(maxWidth: 200.0),
                                              child: Text(
                                                snapshot.data[index]
                                                    .data()["price"],
                                                style: TextStyle(
                                                  color: Colors.grey,
                                                  fontSize: 18.0,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            top: 5.0, left: 8.0),
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
                                              snapshot.data[index]
                                                  .data()["ratings"],
                                              style: TextStyle(
                                                color: Colors.grey,
                                                fontSize: 15.0,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            top: 10.0, left: 10.0),
                                        child: Container(
                                          decoration: BoxDecoration(
                                            color: Colors.teal,
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                          constraints:
                                              BoxConstraints(maxWidth: 200.0),
                                          // height: 20.0,
                                          // width: 70.0,
                                          child: Padding(
                                            padding: EdgeInsets.all(5.0),
                                            child: Text(
                                              snapshot.data[index]
                                                  .data()["tag"],
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
                              ),
                            );
                          },
                        );
                      }
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
