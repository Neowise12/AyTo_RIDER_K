import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:rider/Utilites/brand_colors.dart';
import 'package:url_launcher/url_launcher.dart';

class Ambulance extends StatefulWidget {
  const Ambulance({Key? key}) : super(key: key);

  @override
  _AmbulanceState createState() => _AmbulanceState();
}

class _AmbulanceState extends State<Ambulance> {

  late Query _ref;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _ref = FirebaseDatabase.instance.ref().child("Ambulance").orderByChild("Name");

  }
  Widget _detailsItem2({required Map online}) {
    final call = online['PhoneNumber'];
    return ListTile(
      leading: Icon(Icons.person),
      title: Text(
        online["Name"],
        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
      ),
      subtitle: online["state"] == 1
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
      trailing: Wrap(
        spacing: 12,
        children: [
          InkWell(
            child: const Icon(
              Icons.add_call,
              color: Colors.green,
            ),
            onTap: () {
              if (online["state"] == 0) {
                showDialog(
                    context: context,
                    barrierDismissible: false,
                    builder: (context) {
                      return AlertDialog(
                        title: Text("The driver is offline"),
                        content: Text("Still you want to place call"),
                        actions: [
                          TextButton(
                            child: const Text(
                              "Call",
                              style: TextStyle(color: Colors.green),
                            ),
                            onPressed: () {
                              _makingPhoneCall(phoneNumber: call);
                            },
                          )
                        ],
                      );
                    });
              } else {
                _makingPhoneCall(phoneNumber: call);
              }
            },
          ),
          const Icon(
            Icons.notifications_active,
            color: Colors.amber,
          )
        ],
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
        title: const Text("Ambulance"),
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

            //print(filteredMap);
            print(_ref);

            return _detailsItem2(online: online);
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
