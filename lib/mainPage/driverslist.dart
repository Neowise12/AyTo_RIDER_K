import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:rider/Utilites/brand_colors.dart';
import 'package:rider/mainPage/viewdriversprofile.dart';

class DriversList extends StatefulWidget {
  const DriversList({Key? key}) : super(key: key);

  @override
  _DriversListState createState() => _DriversListState();
}

class _DriversListState extends State<DriversList> {
  final fb = FirebaseDatabase.instance.ref().child("ONLINE");
  @override
  // void initState() {
  //   super.initState();
  //   fb.once().then((DataSnapshot snap) {
  //     var data = snap.value;
  //     list.clear();
  //     data.forEach(key,value){
  //       print(value["UID"]);
  //       MyModel model = new MyModel(
  //
  //       );
  //
  //     }
  //   }
  //
  //
  // }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Divers Available"),
          backgroundColor: BrandColors.enterphonenumber,
        ),
        body: ListView.builder(
            itemCount: 50,
            itemBuilder: (BuildContext context, int index) {
              return InkWell(
                onTap: (){
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => ViewProfile()));
                },
                child: const ListTile(
                  leading: Icon(Icons.person),
                  trailing: Icon(
                    Icons.circle,
                    color: Colors.green,
                  ),
                  title: Text("Name"),
                  subtitle: Text("View profile"),
                ),
              );
            }),
      ),
    );
  }
}
