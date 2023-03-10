import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:master/Screens/detailspage.dart';
import 'package:master/Screens/slider.dart';
import 'package:master/Screens/viewpage.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
 @override

  @override
  Widget build(BuildContext context) {
    double _width =MediaQuery.of(context).size.width;
    double _height =MediaQuery.of(context).size.height;
    print(_width);
    print(_height);

    return SafeArea(
      child: kIsWeb?Scaffold(
        drawer: Drawer(
          child: ListView(
            children: [
              DrawerHeader(child: Text ("Login"))
            ],
          ),

        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding:  EdgeInsets.only(left: 20),
                child: Row(
                  children: [
                    Padding(
                      padding:  EdgeInsets.only(top:20 ),
                      child: Container(
                        width: 30,
                        height: 30,

                        child: Builder(
                          builder: (BuildContext context){
                            return GestureDetector(
                                onTap: (){
                                  Scaffold.of(context).openDrawer();
                                }
                                ,
                                child: SvgPicture.asset('assets/drawer.svg',fit: BoxFit.cover,));
                          },
                        ),
                      ),
                    ),
                    Container(
                      height:100 ,
                      width:350 ,

                      child: Padding(
                        padding:  EdgeInsets.only(left:  20,top: 15),
                        child: Row(
                          children: [
                            Padding(
                              padding:  EdgeInsets.only(top:0 ),
                              child: Text("SO ",style: GoogleFonts.deliusSwashCaps(
                                  fontSize: 30,
                                  fontWeight: FontWeight.w900,
                                  color: Color(0xff000000)
                              ),),
                            ),
                            Padding(
                              padding:  EdgeInsets.only(top:_height/156.654 ),
                              child: Text("Master ",style: GoogleFonts.deliusSwashCaps(
                                  fontSize:30,
                                  fontWeight: FontWeight.w900,
                                  color: Color(0xff000000)
                              ),),
                            ),
                            Padding(
                              padding:  EdgeInsets.only(left: _width/196.36,top: _height/156.654),
                              child: Container(
                                child:Text("Classes",style: GoogleFonts.deliusSwashCaps(
                                    fontSize:30,
                                    fontWeight: FontWeight.w900,
                                    color: Color(0xff000000)
                                ),),
                              ),
                            ),
                          ],
                        ),
                      ),

                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 22,left: 550),
                      child: Row(
                        children: [
                          Text('Home',style: GoogleFonts.roboto(
                              color: Color(0xff222B45),
                              fontWeight: FontWeight.w500,
                              fontSize: 18
                          ),),
                          SizedBox(width: 15,),
                          Text('SO Community',style: GoogleFonts.roboto(
                              color: Color(0xff222B45),
                              fontWeight: FontWeight.w500,
                              fontSize: 18
                          ),),
                          SizedBox(width: 15,),
                          Text('Profile',style: GoogleFonts.roboto(
                              color: Color(0xff222B45),
                              fontWeight: FontWeight.w500,
                              fontSize: 18
                          ),),
                          SizedBox(width: 15,),
                          Text('Support',style: GoogleFonts.roboto(
                              color: Color(0xff222B45),
                              fontWeight: FontWeight.w500,
                              fontSize: 18
                          ),),
                        ],
                      ),
                    ),

                  ],
                ),
              ),
              SizedBox(
                height: _height/39.1635,
              ),
              Padding(
                padding:  EdgeInsets.only(left: 20),
                child: Text('Classes Updates',style: GoogleFonts.roboto(
                    color: Color(0xff222B45),
                    fontWeight: FontWeight.w500,
                    fontSize: 25
                ),),
              ),
              BannerSlider(),
              Padding(
                padding:  EdgeInsets.only(left: 25),
                child: Text('Courses for you',style: GoogleFonts.roboto(

                    color: Color(0xff222B45),
                    fontWeight: FontWeight.w500,
                    fontSize: 25
                ),),
              ),
              Padding(
                  padding: EdgeInsets.only(left: 23 ),
                  child: StreamBuilder(
                    stream: FirebaseFirestore.instance.collection("data").snapshots(),
                    builder: (context,snap){
                      if(!snap.hasData){
                        return CircularProgressIndicator();
                      }
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            height: 250,
                            width: 1250,
                            child: ListView.builder(
                                shrinkWrap: true,
                                scrollDirection: Axis.horizontal,
                                itemCount: snap.data!.docs.length,
                                itemBuilder: (context,index){
                                  return GestureDetector(
                                    onTap: (){
                                      Navigator.of(context).push(MaterialPageRoute(builder: (context)=>detailpage(
                                          snap.data!.docs[index].id
                                      )));
                                    },
                                    child: Container(
                                      width: 250,
                                      child: Column(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Container(
                                              width: 2250,
                                              height: 150,

                                              child: ClipRRect(
                                                  borderRadius: BorderRadius.only(topLeft: Radius.circular(13),topRight:Radius.circular(13)),
                                                  child: Image.network(snap.data!.docs[index]["img"],fit: BoxFit.cover,)),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(left: 6),
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [

                                                Text(snap.data!.docs[index]["title"],style: GoogleFonts.openSans(
                                                    color: Color(0xff222B45),
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: 15
                                                ),),
                                                Container(
                                                  width: _width/1.57088,
                                                  child: Text(snap.data!.docs[index]["des"],style: GoogleFonts.openSans(
                                                      color: Color(0xff8F9BB2),

                                                      fontWeight: FontWeight.w400,
                                                      fontSize: 15
                                                  ),overflow: TextOverflow.ellipsis,


                                                  ),
                                                ),
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  );
                                }),
                          ),
                          Center(
                            child: GestureDetector(
                              onTap: (){
                                Navigator.of(context).push(MaterialPageRoute(builder: (context)=>viewpage()));
                              },
                              child: Row(
                                children: [
                                  Text('View all',style: GoogleFonts.roboto(
                                      color: Color(0xff222B45),
                                      fontWeight: FontWeight.w400,
                                      fontSize: 20
                                  ),),
                                  Icon(Icons.arrow_forward_ios_rounded,size: 20,color: Color(0xff222B45) ,)
                                ],
                              ),
                            ),
                          ),

                        ],
                      );
                    },
                  )
              ),
              Padding(
                padding: EdgeInsets.only(left: 25),
                child: Text('Chat with master',style: GoogleFonts.roboto(
                    color: Color(0xff222B45),
                    fontWeight: FontWeight.w500,
                    fontSize: 25
                ),),
              ),
              Padding(
                padding:  EdgeInsets.symmetric(vertical :_height/65.2725,horizontal: 25),
                child: Container(
                  width:550 ,
                  height: 100,

                  decoration: BoxDecoration(
                      color: Color(0xffFFF6D2),
                      borderRadius: BorderRadius.circular(12)
                  ),

                  child:Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding:  EdgeInsets.only(top: _height/26.109,left: 30),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(right:0 ,bottom: 10),
                              child: Text('Chat with master',style: GoogleFonts.roboto(

                                  fontWeight: FontWeight.w500,
                                  fontSize: 20
                              ),),
                            ),
                            Text('Get a personalized chat with your\n master clear your dots',style: GoogleFonts.roboto(
                                color: Color(0xff695D2E),
                                fontWeight: FontWeight.w400,
                                fontSize: 12
                            ),),
                          ],
                        ),
                      ),
                      Container(
                        width:105 ,
                        height:85 ,
                        child: SvgPicture.asset('assets/botoomimg.svg',fit: BoxFit.cover,),
                      ),
                    ],
                  ),
                ),
              ),
              ClipPath(
                clipper: TsClip1(),
                child: Container(
                  height: 100,
                  width: _width,
                  color: Colors.orange,
                  child:  Padding(
                    padding: const EdgeInsets.only(top: 50,left: 50),
                    child: Text("Contact us ",style: GoogleFonts.roboto(
                        fontWeight: FontWeight.bold,
                        fontSize:18,
                        color: Color(0xff222B45)
                    ),),
                  ),
                ),
              )


            ],
          ),
        ),


      ):
      Scaffold(
        drawer: Drawer(
          child: ListView(
            children: [
              DrawerHeader(child: Text ("Login"))
            ],
          ),

        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding:  EdgeInsets.only(left: _width/19.636),
                child: Row(
                  children: [
                    Padding(
                      padding:  EdgeInsets.only(top: _height/156.654),
                      child: Container(
                        width: _width/13.09066,
                       height: _height/26.109,

                       child: Builder(
                          builder: (BuildContext context){
                            return GestureDetector(
                                onTap: (){
                                  Scaffold.of(context).openDrawer();
                                }
                                ,
                                child: SvgPicture.asset('assets/drawer.svg',fit: BoxFit.cover,));
                          },
                        ),
                      ),
                    ),
                    Container(
                      height: _height/11.18957,
                      width: _width/1.428072,

                      child: Padding(
                        padding:  EdgeInsets.only(left:  _width/15.7088,top: 0),
                        child: Row(
                          children: [
                            Padding(
                              padding:  EdgeInsets.only(top:0 ),
                              child: Text("SO ",style: GoogleFonts.deliusSwashCaps(
                                  fontSize: _width/9.818,
                                  fontWeight: FontWeight.w900,
                                  color: Color(0xff000000)
                              ),),
                            ),
                            Padding(
                              padding:  EdgeInsets.only(top:_height/156.654 ),
                              child: Text("Master ",style: GoogleFonts.deliusSwashCaps(
                                  fontSize: _width/16.3633,
                                  fontWeight: FontWeight.w900,
                                  color: Color(0xff000000)
                              ),),
                            ),
                            Padding(
                              padding:  EdgeInsets.only(left: _width/196.36,top: _height/156.654),
                              child: Container(
                                child:Text("Classes",style: GoogleFonts.deliusSwashCaps(
                                    fontSize: _width/16.3633,
                                    fontWeight: FontWeight.w900,
                                    color: Color(0xff000000)
                                ),),
                              ),
                            ),
                          ],
                        ),
                      ),

                    ),
                    Padding(
                      padding:  EdgeInsets.only(left: _width/19.636),
                      child: Container(
                          width: _width/10.908888,
                          height: _height/21.7575,

                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: SvgPicture.asset('assets/retro.svg',fit: BoxFit.cover,))),
                    ),

                  ],
                ),
              ),
              SizedBox(
                height: _height/39.1635,
              ),
              Column(
                children: [
                  Padding(
                    padding:  EdgeInsets.only(right: _width/1.870095),
                    child: Text('Classes Updates',style: GoogleFonts.roboto(
                      color: Color(0xff222B45),
                        fontWeight: FontWeight.w500,
                        fontSize: _width/21.8177
                    ),),
                  ),
                  BannerSlider(),
                  Row(

                    children: [

                      Padding(
                        padding:  EdgeInsets.only(left: _width/15.104615),
                        child: Text('Courses for you',style: GoogleFonts.roboto(

                            color: Color(0xff222B45),
                            fontWeight: FontWeight.w500,
                            fontSize: _width/21.8177
                        ),),
                      ),
                      SizedBox(width: _width/2.310117,),
                      GestureDetector(
                        onTap: (){
                          Navigator.of(context).push(MaterialPageRoute(builder: (context)=>viewpage()));
                        },
                        child: Row(
                          children: [
                            Text('View all',style: GoogleFonts.roboto(
                              color: Color(0xff222B45),
                                fontWeight: FontWeight.w400,
                                fontSize: _width/28.051428
                            ),),
                            Icon(Icons.arrow_forward_ios_rounded,size: _width/26.1813,color: Color(0xff222B45) ,)
                          ],
                        ),
                      ),

                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: _width/26.1813),
                    child: StreamBuilder(
                      stream: FirebaseFirestore.instance.collection("data").snapshots(),
                      builder: (context,snap){
                        if(!snap.hasData){
                          return CircularProgressIndicator();
                        }
                        return Container(
                          height: _height/3.6218,

                          child: ListView.builder(
                              shrinkWrap: true,
                              scrollDirection: Axis.horizontal,
                              itemCount: snap.data!.docs.length,
                              itemBuilder: (context,index){
                                return GestureDetector(
                                  onTap: (){
                                    Navigator.of(context).push(MaterialPageRoute(builder: (context)=>detailpage(
                                      snap.data!.docs[index].id
                                    )));
                                  },
                                  child: Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Container(
                                          width: _width/1.57088,
                                          height: _height/5.2218,

                                          child: ClipRRect(
                                              borderRadius: BorderRadius.only(topLeft: Radius.circular(13),topRight:Radius.circular(13)),
                                              child: SvgPicture.network(snap.data!.docs[index]["img"],fit: BoxFit.cover,)),
                                        ),
                                      ),
                                      Container(
                                          child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [

                                              Text(snap.data!.docs[index]["title"],style: GoogleFonts.openSans(
                                                  color: Color(0xff222B45),
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: _width/26.18133
                                              ),),
                                              Container(
                                                width: _width/1.57088,
                                                child: Text(snap.data!.docs[index]["des"],style: GoogleFonts.openSans(
                                                    color: Color(0xff8F9BB2),

                                                    fontWeight: FontWeight.w400,
                                                    fontSize: _width/32.72666
                                                ),overflow: TextOverflow.ellipsis,


                                                ),
                                              ),
                                            ],
                                          ))
                                    ],
                                  ),
                                );
                              }),
                        );
                      },
                    )
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: _width/1.671148,top:_height/15.6654,left: _width/26.18133),
                    child: Text('Chat with master',style: GoogleFonts.roboto(
                      color: Color(0xff222B45),
                        fontWeight: FontWeight.w500,
                        fontSize: _width/21.8177
                    ),),
                  ),
                  Padding(
                    padding:  EdgeInsets.symmetric(vertical :_height/65.2725,horizontal: _width/26.18133),
                    child: Container(
                      width:_width/1.03347 ,
                      height: _height/7.8327,

                      decoration: BoxDecoration(
                        color: Color(0xffFFF6D2),
                        borderRadius: BorderRadius.circular(12)
                      ),
                      alignment: Alignment.centerRight,
                      child:Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding:  EdgeInsets.only(top: _height/26.109,left: _width/15.7088),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(right:0 ,bottom: _height/130.545),
                                  child: Text('Chat with master',style: GoogleFonts.roboto(

                                      fontWeight: FontWeight.w500,
                                      fontSize: _width/24.545
                                  ),),
                                ),
                                Text('Get a personalized chat with your\n master clear your dots',style: GoogleFonts.roboto(
                                  color: Color(0xff695D2E),
                                    fontWeight: FontWeight.w400,
                                    fontSize: _width/35.7018
                                ),),
                              ],
                            ),
                          ),
                          Container(
                            width: _width/2.8051428,
                            height: _height/7.8,

                            child: SvgPicture.asset('assets/botoomimg.svg',fit: BoxFit.cover,),
                          ),
                        ],
                      ),
                    ),
                  )




                ],
              ),
            ],
          ),
        ),


      ),
    );
  }
}
class TsClip1 extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.moveTo(0, 0);
    path.quadraticBezierTo(10,50,size.width,50);
    path.lineTo(size.width, size.height);
    path.lineTo(0, 250);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    throw UnimplementedError();
  }
}