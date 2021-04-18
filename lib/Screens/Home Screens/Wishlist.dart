import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import 'package:hs/Screens/Home%20Screens/Search.dart';
import 'package:hs/Screens/detailSection/DetailedScreen.dart';
import 'package:hs/Services/DataController.dart';

class Wishlist extends StatefulWidget {
  Wishlist({Key key}) : super(key: key);

  @override
  _WishlistState createState() => _WishlistState();
}

class _WishlistState extends State<Wishlist> {
  @override
  Widget build(BuildContext context) {
    QuerySnapshot snapshotData;
    return Scaffold(
        backgroundColor: const Color(0xff25282B),
        appBar: AppBar(
          backgroundColor: const Color(0xff25282B),
          title: Text(
            "Wishlist",
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          actions: [
            IconButton(
              icon: Icon(Icons.search),
              onPressed: () {
                Get.to(
                  Search(),
                  transition: Transition.leftToRight,
                );
              },
            ),
          ],
        ),
        body: GetBuilder<DataController>(
            init: DataController(),
            builder: (value) {
              return new FutureBuilder(
                  future: value.getData("wishlist"),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(
                        child: CircularProgressIndicator(
                          backgroundColor: Colors.white,
                        ),
                      );
                    } else {
                      return ListView.builder(
                        itemCount: snapshot.data.length,
                        itemBuilder: (BuildContext context, int index) {
                          return GestureDetector(
                            onTap: () {
                              Get.to(
                                DetailedScreen(),
                                transition: Transition.downToUp,
                                arguments: snapshot.data[index],
                              );
                            },
                            child: Card(
                              color: Colors.transparent,
                              child: Container(
                                child: Row(
                                  children: [
                                    Column(
                                      children: [
                                        Container(
                                          height: 125.0,
                                          width: 125.0,
                                          decoration: BoxDecoration(
                                            image: DecorationImage(
                                              image: NetworkImage(snapshot
                                                  .data[index]
                                                  .data()['images']),
                                              fit: BoxFit.cover,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(5.0),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Column(
                                      children: [
                                        Text(
                                          snapshot.data[index].data()['title'],
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20.0,
                                          ),
                                        ),
                                        Text(
                                          snapshot.data[index].data()['offer'],
                                          style: TextStyle(
                                            color: Colors.grey.shade500,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        Row(
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 15.0),
                                              child: Icon(
                                                FontAwesomeIcons.rupeeSign,
                                                color: Colors.white,
                                                size: 16.0,
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 2.0),
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
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 10.0, left: 15.0),
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                    color: Colors.deepPurple,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                  ),
                                                  constraints: BoxConstraints(
                                                      maxWidth: 200.0),
                                                  // height: 30.0,
                                                  // width: 100.0,
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsets.all(5.0),
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
                                              //     ],
                                              //   ),
                                              // ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      );
                    }
                  });
            })
        /*SingleChildScrollView(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 400.0,
                width: 400.0,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      child: Icon(
                        EvaIcons.smartphoneOutline,
                        color: Colors.white,
                      ),
                      radius: 50.0,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20.0),
                      child: Text(
                        "Want to save something for later",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 15.0),
                      child: Text(
                        "Your wishlist shall go here",
                        style: TextStyle(
                          color: Colors.grey.shade500,
                          fontSize: 20.0,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  "Browes Categories",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              ListTile(
                leading:
                    Icon(Icons.security_outlined, color: Colors.grey.shade500),
                title: Text(
                  "Security",
                  style: TextStyle(color: Colors.grey.shade500, fontSize: 16.0),
                ),
              ),
              ListTile(
                leading: Icon(Icons.pest_control_outlined,
                    color: Colors.grey.shade500),
                title: Text(
                  "Pest Control",
                  style: TextStyle(color: Colors.grey.shade500, fontSize: 16.0),
                ),
              ),
              ListTile(
                leading: Icon(Icons.cleaning_services_outlined,
                    color: Colors.grey.shade500),
                title: Text(
                  "Cleaning",
                  style: TextStyle(color: Colors.grey.shade500, fontSize: 16.0),
                ),
              ),
              ListTile(
                leading: Icon(Icons.electrical_services_outlined,
                    color: Colors.grey.shade500),
                title: Text(
                  "Electricians",
                  style: TextStyle(color: Colors.grey.shade500, fontSize: 16.0),
                ),
              ),
              ListTile(
                leading:
                    Icon(Icons.carpenter_outlined, color: Colors.grey.shade500),
                title: Text(
                  "Carpenter",
                  style: TextStyle(color: Colors.grey.shade500, fontSize: 16.0),
                ),
              ),
              ListTile(
                leading: Icon(Icons.fitness_center_outlined,
                    color: Colors.grey.shade500),
                title: Text(
                  "Fitness Trainer",
                  style: TextStyle(color: Colors.grey.shade500, fontSize: 16.0),
                ),
              ),
              ListTile(
                leading:
                    Icon(Icons.plumbing_outlined, color: Colors.grey.shade500),
                title: Text(
                  "Plumbing",
                  style: TextStyle(color: Colors.grey.shade500, fontSize: 16.0),
                ),
              ),
              ListTile(
                leading: Icon(Icons.spa_outlined, color: Colors.grey.shade500),
                title: Text(
                  "Salon for Women",
                  style: TextStyle(color: Colors.grey.shade500, fontSize: 16.0),
                ),
              ),
              ListTile(
                leading: Icon(Icons.spa_sharp, color: Colors.grey.shade500),
                title: Text(
                  "Salon for Men",
                  style: TextStyle(color: Colors.grey.shade500, fontSize: 16.0),
                ),
              ),
            ],
          ),
        ),
      ),
   
  */
        );
  }
}
