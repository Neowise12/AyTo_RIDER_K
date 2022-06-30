// ignore_for_file: file_names

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pin_put/pin_put.dart';
import 'package:rider/LoginPages/signUp_page.dart';
import 'package:rider/Utilites/brand_colors.dart';
import 'package:rider/mainPage/mainpage.dart';

class OtpPage extends StatefulWidget {
  const OtpPage({Key? key}) : super(key: key);

  //final String phones;

  //OtpPage(this.phones);


  @override
  _OtpPageState createState() => _OtpPageState();
}

class _OtpPageState extends State<OtpPage> {


  final _pinPutController = TextEditingController();
  final _pinPutFocusNode = FocusNode();


  final BoxDecoration pinPutDecoration = BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(5.0),
  );
  late String VerficationCode;
  final GlobalKey<ScaffoldState> _scaffoldkey = GlobalKey<ScaffoldState>() ;
  @override
  Widget build(BuildContext context) {



    return Scaffold(
      resizeToAvoidBottomInset: true,
      key: _scaffoldkey,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 50,
              width: 50,
            ),
            const Text("Verification Page",
                style: TextStyle(
                    fontSize: 28, fontWeight: FontWeight.bold,
                    color: BrandColors.enterphonenumber
                )),
            const SizedBox(
              width: 350,
              height: 50,
            ),
            Image.asset("assets/images/login1.png",
              fit: BoxFit.cover,
              height: 250,),
            EditTextMy.space,
            const Center(
              child: Text("Enter the OTP",
                style: TextStyle(
                  fontSize: 20,
                  color: BrandColors.enterphonenumber
              ),),
    ),
            // Container(
            //     child: Center(
            //     child: Text('verify +91 ${widget.phones}')
            //     )
            // ),
            //Otp box
            const SizedBox(
              height: 30,
              width: 10,
            ),

            Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: BrandColors.editText,
                      borderRadius: BorderRadius.circular(8)
                      ),
                    child: Padding(
                        padding:const EdgeInsets.all(5),
                    child: PinPut(
                      eachFieldWidth: 6,
                      eachFieldHeight: 45,
                      withCursor: true,
                      fieldsCount: 6,
                      focusNode: _pinPutFocusNode,
                      controller: _pinPutController,
                      eachFieldMargin: EdgeInsets.symmetric(horizontal: 5),
                      //onSubmit: (String pin) => _showSnackBar(pin),
                      submittedFieldDecoration: pinPutDecoration,
                      selectedFieldDecoration: pinPutDecoration,
                      followingFieldDecoration: pinPutDecoration,
                      pinAnimationType: PinAnimationType.scale,
                      // onSubmit: (pin) async{
                      //   try{
                      //   await FirebaseAuth.instance.signInWithCredential(
                      //     PhoneAuthProvider.credential(verificationId: VerficationCode, smsCode: pin))
                      //       .then((value) async{
                      //         if(value.user != null){
                      //           Navigator.push(
                      //             context,
                      //             MaterialPageRoute(builder: (context) => MainPage()),
                      //           );
                      //         }
                      //   }
                      //   );}
                      //   catch(e){
                      //     FocusScope.of(context).unfocus();
                      //     ScaffoldMessenger.of(context).showSnackBar(
                      //         const SnackBar(
                      //       content: Text("Invalid OTP!"),
                      //     ));
                      //
                      //   }
                      //
                      // },
                      textStyle:
                      const TextStyle(color: Colors.black, fontSize: 20.0, height: 1),
                    )
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              width: 350,
              height: 50,
            ),
        SizedBox(
            width: 100,
            height: 35,
            child: ElevatedButton(
              onPressed: (){

                print("done");

                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SignUp()),
                );

              },

              child: Text("SUBMIT"),
              style: ElevatedButton.styleFrom(
                  primary: BrandColors.button,
                  onPrimary: Colors.black


              ),
            ))


          ],
        ),
      ),
    );

  }

  // _VerifyPhone() async{
  //   await FirebaseAuth.instance.verifyPhoneNumber(
  //       phoneNumber:"+91${widget.phones}",
  //       verificationCompleted: (PhoneAuthCredential credential) async{
  //         await FirebaseAuth.instance.
  //         signInWithCredential(credential).then((value) async{
  //           if(value.user!= null){
  //             Navigator.push(
  //               context,
  //               MaterialPageRoute(builder: (context) => MainPage()),
  //             );
  //           }
  //
  //         });
  //       },
  //       verificationFailed:(FirebaseAuthException e){
  //         print(e.message);
  //       } ,
  //       codeSent:(String verificationId, int? resendToken) {
  //         setState(() {
  //           VerficationCode =verificationId;
  //
  //         });
  //       },
  //       codeAutoRetrievalTimeout: (String verificationId){
  //         setState(() {
  //           VerficationCode= verificationId;
  //         });
  //       },
  //       timeout: Duration( seconds: 120));
  // }
  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   _VerifyPhone();
  // }
  //
  // Future registeruser(String phone,String firstname,String lastname,String email )
  // async{
  //   final FirebaseAuth _auth = FirebaseAuth.instance;
  //   final User user = _VerifyPhone();
  //   if(user != null){
  //
  //     DatabaseReference newUserRef = FirebaseDatabase.instance.ref().child('rider/${user.uid}');
  //     //final FirebaseUser currentUser = await _auth.currentUser();
  //
  //     //Prepare data to be saved on users table
  //     Map userMap = {
  //       'firstname': firstname,
  //       'lastname': lastname,
  //       'email': email,
  //       'phone': phone,
  //     };
  //
  //     newUserRef.set(userMap);
  //
  //
  //
  //     //Take the user to the mainPage
  //     //Navigator.pushNamed(context, VehicleInfoPage.id);
  //
  //   }
  // }
  }




