import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:master/Screens/Loadingscreen.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
class welcome extends StatefulWidget {
  const welcome({Key? key}) : super(key: key);

  @override
  State<welcome> createState() => _welcomeState();
}

class _welcomeState extends State<welcome> {
  @override
  Widget build(BuildContext context) {
    double _width =MediaQuery.of(context).size.width;
    double _height =MediaQuery.of(context).size.height;
    print(_width);
    print(_height);
    return kIsWeb?Scaffold(
      backgroundColor: Color(0xffFADA5E),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding:  EdgeInsets.only(right: 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(child: SvgPicture.asset("assets/welcomeimg.svg",fit: BoxFit.contain,width: 200,height: 250,)),
                Padding(
                  padding: const EdgeInsets.only(top: 180),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [

                      Padding(
                        padding:  EdgeInsets.only(left:  _width/136.6,),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("SO ",style: GoogleFonts.deliusSwashCaps(
                                fontSize: _width/14.5319,
                                fontWeight: FontWeight.w600,
                                color: Color(0xff000000)
                            ),),
                            Padding(
                              padding: const EdgeInsets.only(top: 20),
                              child: Text("Master ",style: GoogleFonts.deliusSwashCaps(
                                  fontSize: _width/28.4583,
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xff000000)
                              ),),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding:  EdgeInsets.only(left: _width/136.6),
                        child: Container(

                          child:Text("Classes",style: GoogleFonts.deliusSwashCaps(
                              fontSize: _width/28.4583,
                              fontWeight: FontWeight.w600,
                              color: Color(0xff000000)
                          ),),
                        ),
                      ),
                      Padding(
                        padding:  EdgeInsets.only(top: _height/65.7),
                        child: Container(
                          width: _width/4.26875,
                          height: _height/21.9,

                          child: Center(
                            child: Text("Not to Study  -  but to Learn..",style: GoogleFonts.deliusSwashCaps(
                                fontSize: _width/62.09,
                                fontWeight: FontWeight.w600,
                                color: Color(0xff000000)
                            ),),
                          ),
                        ),
                      ),

                    ],
                  ),
                ),
                Padding(
                  padding:  EdgeInsets.only(top: _height/54.75),
                  child: Container(
                    width: _width/5.064,
                    height: _height/6.57,

                    child: Center(
                      child: Text("Innovative by \n      SO CORP",style: GoogleFonts.deliusSwashCaps(
                          fontSize: _width/67.3,
                          fontWeight: FontWeight.w400,
                          color: Color(0xff000000)
                      ),),
                    ),
                  ),
                ),
              ],
            ),
          ),


          Stack(
            children: [
              _width<700?Padding(
                padding:  EdgeInsets.only(top: _height/4.05,bottom: _height/6470,),
                child: Container(
                  width: _width/1,

                  child: Opacity(
                    opacity: 0.30,
                    child: SvgPicture.asset("assets/bot1.svg",fit: BoxFit.cover,
                      color:Color(0xffFFF8DC),),
                  ),
                ),
              ):
              Padding(
                padding: const EdgeInsets.only(top: 120),
                child: Container(
                  width: _width/1,
                  height: _height/4.7467625,
                  child: Opacity(
                    opacity: 0.30,
                    child: SvgPicture.asset("assets/bot1.svg",fit: BoxFit.cover,
                      color:Color(0xffFFF8DC),),
                  ),
                ),
              ),
              _width<700?Padding(
                padding:  EdgeInsets.only(top: _height/3.1888888,left: _width/2.4008,),
                child: GestureDetector(
                  onTap: (){
                    Navigator.of(context).push(MaterialPageRoute(builder: (context)=>loading()));
                  },
                  child: Container(
                    width: _width/3.405,
                    height: _height/13.14,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Colors.black
                    ),
                    child: Center(
                      child: Text('Get Started',
                        style: GoogleFonts.openSans(
                          color: Color(0xffFFFFFF),
                          fontSize: _width/34.05,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ):
              Padding(
                padding:  EdgeInsets.only(top: _height/4.425,left: _width/2.483636,),
                child: GestureDetector(
                  onTap: (){
                    Navigator.of(context).push(MaterialPageRoute(builder: (context)=>loading()));
                  },
                  child: Container(
                    width: _width/5.464,
                    height: _height/13.14,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Colors.black
                    ),
                    child: Center(
                      child: Text('Get Started',
                        style: GoogleFonts.openSans(
                          color: Color(0xffFFFFFF),
                          fontSize: _width/68.3,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ],
      ),

    ) :
    Scaffold(
        backgroundColor: Color(0xffFADA5E),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: EdgeInsets.only(right: _width / 11.22057),
              child: Container(
                  width: _width / 1.1062535,
                  height: _height / 2.7973928,

                  child: Padding(
                    padding: EdgeInsets.only(
                        right: _width / 3.300168, bottom: 1),
                    child: SvgPicture.asset(
                      "assets/welcomeimg.svg", fit: BoxFit.cover,),

                  )
              ),
            ),
            Container(
              height: _height / 8.1590625,
              width: _width / 1.172298,
              child: Padding(
                padding: EdgeInsets.only(left: _width / 39.272),
                child: Row(
                  children: [
                    Text("SO ", style: GoogleFonts.deliusSwashCaps(
                        fontSize: _width / 4.17787,
                        fontWeight: FontWeight.w600,
                        color: Color(0xff000000)
                    ),),
                    Padding(
                      padding: EdgeInsets.only(top: _height / 17.406),
                      child: Text("Master ", style: GoogleFonts.deliusSwashCaps(
                          fontSize: _width / 8.18166,
                          fontWeight: FontWeight.w600,
                          color: Color(0xff000000)
                      ),),
                    ),
                  ],
                ),
              ),

            ),
            Padding(
              padding: EdgeInsets.only(left: _width / 39.272),
              child: Container(
                child: Text("Classes", style: GoogleFonts.deliusSwashCaps(
                    fontSize: _width / 8.18166,
                    fontWeight: FontWeight.w600,
                    color: Color(0xff000000)
                ),),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: _height / 78.327),
              child: Container(
                width: _width / 1.22725,
                height: _height / 26.109,

                child: Center(
                  child: Text("Not to Study  -  but to Learn..",
                    style: GoogleFonts.deliusSwashCaps(
                        fontSize: _width / 17.850909,
                        fontWeight: FontWeight.w600,
                        color: Color(0xff000000)
                    ),),
                ),
              ),
            ),
            Stack(
              children: [
                Container(

                  child: Opacity(
                    opacity: 0.30,
                    child: SvgPicture.asset(
                      "assets/bottomimg.svg", fit: BoxFit.cover,
                      color: Color(0xffFFF8DC),),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      top: _height / 7.8327, left: _width / 3.9272),
                  child: Container(
                    width: _width / 1.9636,
                    height: _height / 9.790875,

                    child: Center(
                      child: Text("Innovative by \n      SO CORP",
                        style: GoogleFonts.deliusSwashCaps(
                            fontSize: _width / 17.850909,
                            fontWeight: FontWeight.w400,
                            color: Color(0xff000000)
                        ),),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    top: _height / 4.12247, left: _width / 3.41495,),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => loading()));
                    },
                    child: Container(
                      width: _width / 2.618133,
                      height: _height / 15.6654,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: Colors.black
                      ),
                      child: Center(
                        child: Text('Get Started',
                          style: GoogleFonts.openSans(
                            color: Color(0xffFFFFFF),
                            fontSize: _width / 21.8177,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ],
        ),

      );



  }
}
