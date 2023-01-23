import 'package:country_picker/country_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:master/Screens/Home.dart';
import 'package:master/otppage.dart';

class login extends StatefulWidget {
  const login({Key? key}) : super(key: key);

  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {


  String nam='91';
  var countryname= "India";
  var flag="🇮🇳";
  var code='91';
  final TextEditingController phonenumber =TextEditingController();


  @override
  Widget build(BuildContext context) {

    double _width =MediaQuery.of(context).size.width;
    double _height =MediaQuery.of(context).size.height;
    print(_width);
    print(_height);
    return SafeArea(
      child: Scaffold(
        body:
        Column(

          children: [
            Center(
              child: Container(
                height: _height/8.703,
                width: _width/1.172298,

                child: Padding(
                  padding:  EdgeInsets.only(left:  _width/4.620235,top: _height/78.327),
                  child: Row(
                    children: [
                      Padding(
                        padding:  EdgeInsets.only(top:_height/26.109 ),
                        child: Text("SO ",style: GoogleFonts.deliusSwashCaps(
                            fontSize: _width/8.18166,
                            fontWeight: FontWeight.w600,
                            color: Color(0xff000000)
                        ),),
                      ),
                      Padding(
                        padding:  EdgeInsets.only(top:_height/14.778679 ),
                        child: Text("Master ",style: GoogleFonts.deliusSwashCaps(
                            fontSize: _width/16.3633,
                            fontWeight: FontWeight.w600,
                            color: Color(0xff000000)
                        ),),
                      ),
                    ],
                  ),
                ),

              ),
            ),
            Padding(
              padding:  EdgeInsets.only(left: _width/39.272),
              child: Container(
                child:Text("Classes",style: GoogleFonts.deliusSwashCaps(
                    fontSize: _width/16.3633,
                    fontWeight: FontWeight.w600,
                    color: Color(0xff000000)
                ),),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(right: _width/5.61028,top: _height/15.6654),
              child: Text("Enter Phone Number",style: GoogleFonts.roboto(
                      fontSize: _width/14.025714,
                      fontWeight: FontWeight.w600,
                      color: Color(0xff000000)

              ),),
            ),
            Padding(
              padding:  EdgeInsets.only(top: _height/31.3308),
              child: GestureDetector(
                onTap: (){
                  showCountryPicker(context: context,
                      showPhoneCode: true,
                      onSelect: (Country country){
                        setState(() {
                          countryname= '${country.displayNameNoCountryCode}';
                          flag= '${country.flagEmoji}';
                          code='${country.phoneCode}';



                        });

                        print('Select country: ${nam}');
                        print('${country.phoneCode}');
                        print(code);

                      },
                      countryListTheme: CountryListThemeData(

                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(40.0),
                          topRight: Radius.circular(40.0),
                        ),
                        inputDecoration: InputDecoration(
                          labelText: 'Search',
                          hintText: 'Start typing to search',
                          prefixIcon: const Icon(Icons.search),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: const Color(0xFF8C98A8).withOpacity(0.2),
                            ),
                          ),
                        ),
                      )

                  );

                },
                child: Container(

                 width: _width/1.10625,
                  height: _height/15.6654,
                  alignment: Alignment.centerLeft,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.black12
                    )
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Padding(

                            padding:  EdgeInsets.only(left: _width/78.544),
                            child: Container(
                              width: _width/15.7088,
                              height: _height/31.3308,
                              child: Text(flag,style: GoogleFonts.openSans(
                                  fontSize: _width/15.7088,


                              ),),
                            ),
                          ),
                          SizedBox(width: _width/39.272,),
                          Padding(
                            padding: EdgeInsets.only(),
                            child: Text(countryname,style: GoogleFonts.openSans(
                                fontSize: _width/26.18133,

                                color: Color(0xff000000)
                            ),),
                          ),
                        ],
                      ),

                      SizedBox(
                        width: 0
                      ),
                      Icon(Icons.arrow_forward_ios_outlined)

                    ],
                  ),
                ),
              ),
            ),
            SizedBox(width: _width/7.8544,
            height: _height/78.327,),
            Container(
              height: _height/19.58175,
              width: _width/1.10625,
              child: TextField(
                controller: phonenumber,
                decoration: InputDecoration(
                  prefix: Text('+${code}'),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.black12
                      )
                    )
                ),
              ),
            ),
            Text('We’ll Send you a code by SMS to confirm your phone number.',style: GoogleFonts.openSans(
                fontSize: _width/32.726666,
                color: Color(0xff000000)
            ),),
            Padding(
              padding:  EdgeInsets.only(top: _height/15.6654),
              child: GestureDetector(
                onTap: (){
                  Navigator.of(context).push(MaterialPageRoute(builder: (context)=>otppage(
                      phonenumber.text
                  )));

                },
                child: Container(
                  width: _width/2.618133,
                  height: _height/15.6654,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Color(0xffFADA5E)
                  ),
                  child: Text(
                    'Continue',
                    style:  GoogleFonts.openSans(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: _width/21.8177
                    ),
                  ),
                ),
              ),
            ),

          ],
        ),

      ),
    );
  }


}
