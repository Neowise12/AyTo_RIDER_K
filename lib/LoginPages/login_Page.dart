// ignore_for_file: file_names

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:rider/LoginPages/otp_Page.dart';
import 'package:rider/LoginPages/signUp_page.dart';
import 'package:rider/mainPage/mainpage.dart';
import '../Utilites/brand_colors.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late String smsCode;
  bool codeSent = false;
  var srm;
  final _codeController = TextEditingController();
  final _formkey = GlobalKey<FormState>();
  final _database = FirebaseDatabase.instance.ref();
  FirebaseAuth auth = FirebaseAuth.instance;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _activeListeners();
  }

  void _activeListeners() {
    final User? user = auth.currentUser;
    final id = user?.uid;
    _database.child('Driver/${user?.uid}/FirstName').onValue.listen((event) {
      final Object? description = event.snapshot.value ?? false;
      setState(() {
        print('Description=$description');
        srm = '$description';
      });
    });
  }

  Future<void> loginUser(String phone, BuildContext context) async {
    FirebaseAuth _auth = FirebaseAuth.instance;
    _auth.verifyPhoneNumber(
        phoneNumber: "+91${phone}",
        timeout: Duration(seconds: 60),
        verificationCompleted: (AuthCredential credential) async {
          UserCredential result = await _auth.signInWithCredential(credential);
          User? user = result.user;
          if (user != null) {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => MainPage()));
          }
        },
        verificationFailed: (FirebaseAuthException e) {
          print(e);
        },
        codeSent: (String verificationId, int? resendToken) {
          setState(() {
            this.codeSent = true;
          });
          showDialog(
              context: context,
              barrierDismissible: false,
              builder: (context) {
                return AlertDialog(
                  title: Text("Give the code?"),
                  content: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      TextField(
                        controller: _codeController,
                      ),
                    ],
                  ),
                  actions: <Widget>[
                    ElevatedButton(
                      style:
                          ElevatedButton.styleFrom(primary: BrandColors.button),
                      child: const Text(
                        "Confirm",
                        style: TextStyle(color: Colors.white),
                      ),
                      onPressed: () async {
                        final code = _codeController.text.trim();
                        AuthCredential credential =
                            PhoneAuthProvider.credential(
                                verificationId: verificationId, smsCode: code);

                        UserCredential result = await _auth
                            .signInWithCredential(credential)
                            .whenComplete(
                          () {
                            print('SRM=$srm');
                            if (srm.compareTo('false') == 0) {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const SignUp(),
                                ),
                              );
                            } else {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const MainPage(),
                                ),
                              );
                            }
                          },
                        );

                        User? user = result.user;
                      },
                    )
                  ],
                );
              });
        },
        codeAutoRetrievalTimeout: (String verificationId) {
          setState(() {
            //VerficationCode= verificationId;
          });
        });
  }

  @override
  Widget build(BuildContext context) {
    final mycontroller = TextEditingController();

    final button = SizedBox(
        width: 100,
        height: 35,
        child: ElevatedButton(
          onPressed: () {
            if (_formkey.currentState!.validate()) {
              final phone = mycontroller.text.trim();

              loginUser(phone, context);
            }
          },
          child: Text("Proceed"),
          style: ElevatedButton.styleFrom(
              primary: BrandColors.button, onPrimary: Colors.black),
        ));
    final countryCode = Container(
        child: const Padding(
      padding: EdgeInsets.all(8.0),
      child: Text(
        "+91",
        style: TextStyle(
          color: Colors.white,
          // fontSize: 28,
          fontWeight: FontWeight.w600,
        ),
      ),
    ));
    final phonenumber = Padding(
        padding: const EdgeInsets.all(5),
        child: TextFormField(
          keyboardType: TextInputType.phone,
          autofocus: false,
          //initialValue: '',
          controller: mycontroller,
          decoration: const InputDecoration(
            hintText: 'Phone Number',
            hintStyle:
                TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
            contentPadding: EdgeInsets.fromLTRB(10.0, 10.0, 20.0, 10.0),
            // border: OutlineInputBorder(borderRadius: BorderRadius.circular(30.0)
            // ),
          ),
          validator: (value) {
            if (value!.isEmpty) {
              return "This field cannot be empty";
            } else if (value.length != 10) {
              return "Invaild phone Number";
            }
            return null;
          },
        ));

    return Form(
      key: _formkey,
      child: Scaffold(
          resizeToAvoidBottomInset: true,
          body: SingleChildScrollView(
              padding: EdgeInsets.only(left: 24.0, right: 24.0),
              // shrinkWrap: false,
              child: Column(children: [
                const SizedBox(
                  width: 100,
                  height: 100,
                ),
                const Center(
                  child: Text(
                    "Welcome",
                    style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: BrandColors.enterphonenumber),
                  ),
                ),
                const SizedBox(
                  width: 350,
                  height: 50,
                ),
                Image.asset(
                  "assets/images/login1.png",
                  fit: BoxFit.cover,
                  height: 250,
                ),
                const SizedBox(
                  width: 500,
                  height: 50,
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(20.0, 20.0, 10.0, 10.0),
                    child: Text(
                      "Enter your phone number",
                      style: TextStyle(
                          color: BrandColors.enterphonenumber,
                          fontSize: 15,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: BrandColors.editText,
                    borderRadius: BorderRadius.circular(32.0),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      countryCode,
                      Flexible(child: phonenumber),
                    ],
                  ),
                ),
                const SizedBox(
                  width: 100,
                  height: 45,
                ),
                button,
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SignUp()),
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Center(
                      child: RichText(
                        text: const TextSpan(
                            text: "Don't have an account? ",
                            style: TextStyle(
                              color: Colors.black,
                            ),
                            children: <TextSpan>[
                              TextSpan(
                                  text: "Sign Up",
                                  style: TextStyle(
                                      color: BrandColors.signup,
                                      fontWeight: FontWeight.bold))
                            ]),
                      ),
                    ),
                  ),
                ),
              ]))),
    );
  }
}
