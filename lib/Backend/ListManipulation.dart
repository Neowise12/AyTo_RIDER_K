import 'dart:math';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';

class ListManipulation extends StatefulWidget {
  const ListManipulation({Key? key}) : super(key: key);

  @override
  State<ListManipulation> createState() => _ListManipulationState();
}

class _ListManipulationState extends State<ListManipulation> {
  late Query _ref;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _ref = FirebaseDatabase.instance.ref().child("ONLINE").orderByChild("Name");
  }
  @override
  Widget build(BuildContext context) {

    FirebaseAnimatedList(
        query: _ref,
        itemBuilder: (BuildContext context, DataSnapshot snapshot,
            Animation<double> animation, int index) {
          Map? online = (snapshot.value) as Map;

    return Container();

  }
/*  double calculateDistance(lat1, lon1, lat2, lon2){
    var p = 0.017453292519943295;
    var a = 0.5 - cos((lat2 - lat1) * p)/2 +
        cos(lat1 * p) * cos(lat2 * p) *
            (1 - cos((lon2 - lon1) * p))/2;
    return 12742 * asin(sqrt(a));
  }*/


}
