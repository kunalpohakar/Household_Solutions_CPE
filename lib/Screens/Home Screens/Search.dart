import 'package:flutter/material.dart';
import 'package:hs/Services/DataController.dart';
import 'package:hs/Screens/detailSection/DetailedScreen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class Search extends StatefulWidget {
  Search({Key key}) : super(key: key);

  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  final TextEditingController searchController = TextEditingController();
  QuerySnapshot snapshotData;
  bool isExcecuted = false;
  @override
  Widget build(BuildContext context) {
    Widget searchedData() {
      return ListView.builder(
        itemCount: snapshotData.docs.length,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {
              Get.to(DetailedScreen(),
                  transition: Transition.downToUp,
                  arguments: snapshotData.docs[index]);
            },
            child: ListTile(
                leading: CircleAvatar(
                  radius: 40.0,
                  backgroundImage: NetworkImage(
                    snapshotData.docs[index].data()['images'],
                  ),
                ),
                title: Text(
                  snapshotData.docs[index].data()['title'],
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 22.0,
                  ),
                ),
                subtitle: Text(
                  snapshotData.docs[index].data()['offer'],
                  style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.normal,
                    fontSize: 16.0,
                  ),
                )),
          );
        },
      );
    }

    return Scaffold(
      backgroundColor: const Color(0xff25282B),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.clear),
        onPressed: () {
          setState(() {
            isExcecuted = false;
          });
        },
      ),
      appBar: AppBar(
        backgroundColor: const Color(0xff25282B),
        actions: [
          GetBuilder<DataController>(
            init: DataController(),
            builder: (val) {
              return IconButton(
                  icon: Icon(Icons.search),
                  onPressed: () {
                    val.queryData(searchController.text).then((value) {
                      snapshotData = value;
                      setState(() {
                        isExcecuted = true;
                      });
                    });
                  });
            },
          )
        ],
        title: TextField(
          style: TextStyle(color: Colors.white),
          decoration: InputDecoration(
              hintText: "Search Courses.....",
              hintStyle: TextStyle(color: Colors.grey)),
          controller: searchController,
        ),
      ),
      body: isExcecuted
          ? searchedData()
          : SingleChildScrollView(
              child: Container(
                child: Center(
                  child: Column(
                    children: [
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
                        leading: Icon(Icons.security_outlined,
                            color: Colors.grey.shade500),
                        title: Text(
                          "Security",
                          style: TextStyle(
                              color: Colors.grey.shade500, fontSize: 16.0),
                        ),
                      ),
                      ListTile(
                        leading: Icon(Icons.pest_control_outlined,
                            color: Colors.grey.shade500),
                        title: Text(
                          "Pest Control",
                          style: TextStyle(
                              color: Colors.grey.shade500, fontSize: 16.0),
                        ),
                      ),
                      ListTile(
                        leading: Icon(Icons.cleaning_services_outlined,
                            color: Colors.grey.shade500),
                        title: Text(
                          "Cleaning",
                          style: TextStyle(
                              color: Colors.grey.shade500, fontSize: 16.0),
                        ),
                      ),
                      ListTile(
                        leading: Icon(Icons.electrical_services_outlined,
                            color: Colors.grey.shade500),
                        title: Text(
                          "Electricians",
                          style: TextStyle(
                              color: Colors.grey.shade500, fontSize: 16.0),
                        ),
                      ),
                      ListTile(
                        leading: Icon(Icons.carpenter_outlined,
                            color: Colors.grey.shade500),
                        title: Text(
                          "Carpenter",
                          style: TextStyle(
                              color: Colors.grey.shade500, fontSize: 16.0),
                        ),
                      ),
                      ListTile(
                        leading: Icon(Icons.fitness_center_outlined,
                            color: Colors.grey.shade500),
                        title: Text(
                          "Fitness Trainer",
                          style: TextStyle(
                              color: Colors.grey.shade500, fontSize: 16.0),
                        ),
                      ),
                      ListTile(
                        leading: Icon(Icons.plumbing_outlined,
                            color: Colors.grey.shade500),
                        title: Text(
                          "Plumbing",
                          style: TextStyle(
                              color: Colors.grey.shade500, fontSize: 16.0),
                        ),
                      ),
                      ListTile(
                        leading: Icon(Icons.spa_outlined,
                            color: Colors.grey.shade500),
                        title: Text(
                          "Salon for Women",
                          style: TextStyle(
                              color: Colors.grey.shade500, fontSize: 16.0),
                        ),
                      ),
                      ListTile(
                        leading:
                            Icon(Icons.spa_sharp, color: Colors.grey.shade500),
                        title: Text(
                          "Salon for Men",
                          style: TextStyle(
                              color: Colors.grey.shade500, fontSize: 16.0),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
    );
  }
}
