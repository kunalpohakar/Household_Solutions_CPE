import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/state_manager.dart';

class DataController extends GetxController {
  Future getData(String collection) async {
    QuerySnapshot snapshot =
        await FirebaseFirestore.instance.collection(collection).get();
    return snapshot.docs;
  }

  Future queryData(String queryString) async {
    return FirebaseFirestore.instance
        .collection('featured')
        .where('title', isGreaterThanOrEqualTo: queryString)
        .get();
  }

  // @override
  // void onInit() {
  //   super.onInit();
  // }

  // @override
  // void onClose() {
  //   super.onClose();
  // }

  // @override
  // void onReady() {
  //   super.onReady();
  // }
}
