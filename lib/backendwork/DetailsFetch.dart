import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'dart:core';

class Details extends StatefulWidget {
  const Details({Key? key}) : super(key: key);

  @override
  _DetailsState createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  late Query _ref ;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _ref = FirebaseDatabase.instance.ref().child("ONLINE").orderByChild("UID");

  }
  Widget _detailsItem({required Map online}){
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 100,
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(Icons.person),
                SizedBox(width:6,),
                // online!["states"] == 1?Text(online["UID"]):Text(online["UID"]),
                Text(online["UID"], style: TextStyle(fontSize: 16),),
              ],
            )





          ],
        ),

      ),
    );

  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Container(
        height: double.infinity ,
        child: FirebaseAnimatedList(query: _ref,itemBuilder: (BuildContext context ,DataSnapshot snapshot, Animation<double>animation,int index){
          var online = snapshot.value as Map;
          var online2;

          if(online["state"]==1){
             online2 = online;

          }

          return _detailsItem(online:online2 );


        }, ),

      ),
    );

  }
}






















// import 'package:firebase_database/firebase_database.dart';
//
// class Need {
//   var id;
//   var lat;
//   var long;
//   var state;
//
//
//   Need(this.id, this.lat, this.long, this.state);
//
//   Need.fromSnapshot(DataSnapshot snapshot) :
//         id = snapshot.key,
//         lat = snapshot.value["lat"],
//         long = snapshot.value["long"],
//         state= snapshot.value["state"];
//
//   toJson() {
//     return {
//       "lat": lat,
//       "long": long,
//       "state": state,
//     };
//   }
// }
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
// /*
// class Need {
//   var id;
//   var lat;
//   var long;
//   var state;
//
//   Need({
//     required this.id,
//     required this.lat,
//     required this.long,
//     required this.state,
//   });
//
//   */
// /*Need.fromSnapshot(DataSnapshot snapshot, this.lat, this.long, this.state) :
//         id = snapshot.key,
//         lat = snapshot.value,
//         long = snapshot.value,
//         state = snapshot.value;*//*
//
//
//   Future<DatabaseEvent> getItems() {
//     return FirebaseDatabase().reference().child("items").once();
//   }
//
//
//   toJson() {
//     return {
//       "lat": lat,
//       "long": long,
//       "state": state,
//     };
//   }
//
//   print(getItems()) {
//     // TODO: implement print
//     throw UnimplementedError();
//   }
// }*/
