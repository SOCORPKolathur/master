import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:master/Screens/Home.dart';
import 'package:pinput/pinput.dart';

class otppage extends StatefulWidget {
  String?phonenumber;
  otppage(this.phonenumber);
  @override
  State<otppage> createState() => _otppageState();
}

class _otppageState extends State<otppage> {

  var _verificationCode;

@override
  void initState() {
  _verifyphone();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  Center(
        child: Column(
          children: [
            Container(

              margin: EdgeInsets.all(15),
              child: Pinput(
                defaultPinTheme: PinTheme(width: 56,
                  height: 56,
                  textStyle: const TextStyle(
                    fontSize: 22,
                    color: Color.fromRGBO(30, 60, 87, 1),
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(19),
                    border: Border.all(color: Colors.black
                    ),
                  ),



                ),
                length: 6,
                slideTransitionBeginOffset: Offset(1, 1),
                pinAnimationType: PinAnimationType.slide,
                errorText: "Please fill the field",
                onCompleted: (pin){
                  print("not valid");
                  print(pin);
                  try{
                    FirebaseAuth.instance.signInWithCredential(
                        PhoneAuthProvider.credential(
                            verificationId:_verificationCode ,
                            smsCode: pin)).then((value){
                      if(value.user!=null){
                        FirebaseFirestore.instance.collection("Users").doc(FirebaseAuth.instance.currentUser!.uid).set(
                            {
                              "phone": widget.phonenumber
                            });
                        Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Home()));
                      }


                    });
                  }
                  catch(e){
                    print(e);
                  }
                },
              ),//pinput design
            ),

          ],
        ),
      ),
    );
  }
  _verifyphone()async{
    await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: "+91${widget.phonenumber}" ,
        verificationCompleted:(PhoneAuthCredential credential)async{
          await FirebaseAuth.instance.signInWithCredential(credential).then((value)async{
            if(value.user!=null){
              print("Valied Otp");
            }
          });
        },
        verificationFailed:(FirebaseAuthException error){
          print(error);
        } ,
        codeSent:(String ?verificationid ,int ?resendtoken ){
          _verificationCode=verificationid;

        },
        codeAutoRetrievalTimeout:( String verificationid){
          _verificationCode=verificationid;

        },timeout: Duration(seconds: 60) );
  }
}
