// ignore: file_names
// ignore_for_file: file_names

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:rider/LoginPages/login_Page.dart';
import 'package:rider/Utilites/brand_colors.dart';
import 'package:rider/mainPage/mainpage.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final GlobalKey<ScaffoldState> scaffoldkey = new GlobalKey<ScaffoldState>();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  var firstNameController = TextEditingController();
  var lastNameController = TextEditingController();

  //var phoneController = TextEditingController();
  var emailController = TextEditingController();

  void showSnackBar(String title) {
    final snackBar = SnackBar(
        content: Text(
      title,
      textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: 15,
      ),
    ));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  void registerUser() async {
    final User user = _auth.currentUser!;
    final id = user.uid;

    DatabaseReference dref =
        FirebaseDatabase.instance.ref().child("rider/${user.uid}");
    Map map = {
      'FirstName': firstNameController.text,
      'LastName': lastNameController.text,
      'phoneNumber': user.phoneNumber,
      'Email': emailController.text,
    };
    dref.set(map);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              width: 50,
              height: 50,
            ),
            const Center(
              child: Text(
                "Sign Up",
                style: TextStyle(
                    fontSize: 28, color: BrandColors.enterphonenumber),
              ),
            ),
            EditTextMy.space,
            Image.asset(
              "assets/images/login1.png",
              fit: BoxFit.cover,
              height: 100,
            ),
            EditTextMy.space,
            Container(
              width: 350,
              height: 50,
              decoration: BoxDecoration(
                color: BrandColors.editText,
                borderRadius: BorderRadius.circular(5),
              ),
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: TextFormField(
                  controller: firstNameController,
                  decoration: const InputDecoration(
                      hintText: "First Name",
                      hintStyle: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.w600)),
                ),
              ),
            ),
            EditTextMy.space,
            Container(
              width: 350,
              height: 50,
              decoration: BoxDecoration(
                color: BrandColors.editText,
                borderRadius: BorderRadius.circular(5),
              ),
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: TextFormField(
                  controller: lastNameController,
                  decoration: const InputDecoration(
                      hintText: "Last Name",
                      hintStyle: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.w600)),
                ),
              ),
            ),
            EditTextMy.space,
            // Container(
            //   width: 250,
            //   height: 50,
            //   decoration: BoxDecoration(
            //     color: BrandColors.editText,
            //     borderRadius: BorderRadius.circular(5),
            //   ),
            //   child: Padding(
            //       padding: const EdgeInsets.all(10),
            //       child: TextFormField(
            //         controller: phoneController,
            //         decoration: const InputDecoration(
            //             hintText: "Phone",
            //             hintStyle: TextStyle(
            //                 color: Colors.white,
            //                 fontWeight: FontWeight.w600
            //             )
            //         ),
            //       )
            //   ),
            // ),
            Container(
              width: 350,
              height: 50,
              decoration: BoxDecoration(
                color: BrandColors.editText,
                borderRadius: BorderRadius.circular(5),
              ),
              child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: TextFormField(
                    controller: emailController,
                    decoration: const InputDecoration(
                        hintText: "Email ID",
                        hintStyle: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.w600)),
                  )),
            ),

            EditTextMy.space,
            EditTextMy.space,
            SizedBox(
                width: 100,
                height: 35,
                child: ElevatedButton(
                  onPressed: () {
                    // if(phoneController.text.length !=10){
                    //   showSnackBar("Invalid Phone Number");
                    //   return;
                    // }
                    if (firstNameController.text.length == 0) {
                      showSnackBar("This field cannot be empty");
                      return;
                    }
                    if (!emailController.text.contains("@")) {
                      showSnackBar("Invaild Email ID");
                      return;
                    }

                    registerUser();
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => MainPage()));
                    //DatabaseReference dref =FirebaseDatabase.instance.ref().child("Rider");
                  },
                  child: Text("Proceed"),
                  style: ElevatedButton.styleFrom(
                      primary: BrandColors.button, onPrimary: Colors.black),
                ))
          ],
        ),
      ),
    );
  }
}

class EditTextMy {
  static const space = SizedBox(
    width: 28,
    height: 45,
  );
}
