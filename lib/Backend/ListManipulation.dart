import 'dart:math';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ListManipulation extends StatefulWidget {
  const ListManipulation({Key? key}) : super(key: key);

  @override
  State<ListManipulation> createState() => _ListManipulationState();
}

class _ListManipulationState extends State<ListManipulation> {

  final FirebaseAuth _auth = FirebaseAuth.instance;

  late List lst=[];
  void Bis() async {
    final User user = _auth.currentUser!;
    final id = user.uid;

     DatabaseReference dref =
    FirebaseDatabase.instance.ref().child("ONLINE");


    dref.onValue.listen((event) {
      for (final child in event.snapshot.children) {
        lst.add(child);

      }
    }, onError: (error) {
      // Error.
    });
   print(lst);
  }

/* dref.addListenerForSingleValueEvent( ValueEventListener() {
    @Override
    public void onDataChange(DataSnapshot dataSnapshot) {
    for (DataSnapshot postSnapshot : dataSnapshot.getChildren()) {
    Map<Double,Double,String> map = (Map) postSnapshot.getValue();
    if (map != null) {
    String UID=map.get('uid')
    Double lat = map.get("lat");
    Double long = map.get("long");
    }
    }
    }

    @Override
    public void onCancelled(DatabaseError databaseError) {
    }
  });*/


  @override
  Widget build(BuildContext context) {

    /*FirebaseAnimatedList(
        query: _ref,
        itemBuilder: (BuildContext context, DataSnapshot snapshot,
            Animation<double> animation, int index) {
          Map? online = (snapshot.value) as Map;*/
    Bis();
    return Scaffold();
          Future<dynamic> fileContains(String path, String needle) async {

          }

  }
/*  double calculateDistance(lat1, lon1, lat2, lon2){
    var p = 0.017453292519943295;
    var a = 0.5 - cos((lat2 - lat1) * p)/2 +
        cos(lat1 * p) * cos(lat2 * p) *
            (1 - cos((lon2 - lon1) * p))/2;
    return 12742 * asin(sqrt(a));
  }*/


}
