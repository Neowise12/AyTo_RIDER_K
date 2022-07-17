import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'dart:core';

import 'package:rider/Utilites/brand_colors.dart';

import 'package:url_launcher/url_launcher.dart';

class Details extends StatefulWidget {
  const Details({Key? key}) : super(key: key);

  @override
  _DetailsState createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  late Query _ref;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _ref = FirebaseDatabase.instance.ref().child("ONLINE").orderByChild("Name");
  }


  Widget _detailsItem({required Map online}) {
    final call = online['PhoneNumber'];
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Container(
        height: 45,
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              color: Colors.white,
              child: Row(
                children: [
                  const Icon(Icons.person),
                  const SizedBox(
                    width: 10,
                  ),

                  Text(
                    online["Name"],
                    style: const TextStyle(fontSize: 16,
                    fontWeight: FontWeight.bold),

                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  online["state"] == 1
                      ? const Text(
                          "Online",
                          style: TextStyle(
                            color: Colors.green,
                            fontWeight: FontWeight.w300,
                          ),
                        )
                      : const Text(
                          "Offline",
                          style: TextStyle(
                            color: Colors.red,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                  const SizedBox(
                    width: 30,
                  ),
                  InkWell(

                    child: const Icon(Icons.add_call, color: Colors.green,),
                    onTap: (){
                      _makingPhoneCall(phoneNumber: call);


                    },

                  ),


                  //online["states"] == 1? Icon(Icons.online_prediction):Icon(Icons.offline_bolt),
                ],
              ),
            ),
            const Divider(
              height: 20,
              thickness: 2,
              //indent: 20,
              endIndent: 0,
              color: Colors.black,
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //leading: IconButton(
        //   icon: Icon(Icons.arrow_back, color: Colors.white),
        //   onPressed: () =>Navigator.pop(
        //       context, MaterialPageRoute(builder: (context) => MainPage()))
        // ),
        title: const Text("Drivers Available"),
        backgroundColor: BrandColors.enterphonenumber,
      ),
      // ignore: sized_box_for_whitespace
      body: Container(
        height: double.infinity,
        child: FirebaseAnimatedList(
          query: _ref,
          itemBuilder: (BuildContext context, DataSnapshot snapshot,
              Animation<double> animation, int index) {
            Map? online = (snapshot.value) as Map;

            Map? filteredMap;

            if (online["state"] == 1) {
              filteredMap = Map.from(online);
            }

            print(filteredMap);

            return _detailsItem(online: online);
          },
        ),
      ),
    );

  }
  _makingPhoneCall({required  phoneNumber}) async {
    var url = Uri.parse("tel:$phoneNumber");
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      throw 'Could not launch $url';
    }
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
