import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rider/Utilites/brand_colors.dart';

class ViewProfile extends StatefulWidget {
  const ViewProfile({Key? key}) : super(key: key);

  @override
  _ViewProfileState createState() => _ViewProfileState();
}

class _ViewProfileState extends State<ViewProfile> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Drivers name"),
          backgroundColor: BrandColors.enterphonenumber,
        ),
        body: Container(
          child: Center(
            child: Column(
              children: [
                const SizedBox(
                  height: 50,
                  width: 50,
                ),
                Image.asset(
                  "assets/images/user.png",
                  height: 100,
                  width: 100,
                ),
                const SizedBox(
                  height: 50,
                  width: 50,
                ),
                const Text(
                  "Name",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                ),
                const SizedBox(
                  height: 10,
                  width: 50,
                ),
                const Text(
                  "about..............\n..............\n..........\n",
                  style: TextStyle( fontSize: 25),
                ),
                const SizedBox(
                  height: 50,
                  width: 50,
                ),
                const CircleAvatar(
                  child: Icon(Icons.call,
                  color: Colors.green,
                  ),
                  backgroundColor: BrandColors.button,
                  radius: 25
                ),
                const SizedBox(
                  height: 8,
                  width: 50,
                ),
                const Text("Make a Call",
                style: TextStyle(
                  color: BrandColors.enterphonenumber
                ),)

              ],
            ),
          ),
        ),
      ),
    );
  }
}
