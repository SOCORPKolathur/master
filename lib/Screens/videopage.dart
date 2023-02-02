

import 'package:better_player/better_player.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flick_video_player/flick_video_player.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:master/Screens/video.dart';
import 'package:video_player/video_player.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

class videopage extends StatefulWidget {

  String id;
  String id2;
  String url;
  bool state;

  videopage(this.id,this.id2,this.url,this.state,);

  @override
  State<videopage> createState() => _videopageState();
}

class _videopageState extends State<videopage> {
  late VideoPlayerController _videoPlayerController=VideoPlayerController.network(widget.url);

  @override
  Widget build(BuildContext context) {


    double _width =MediaQuery.of(context).size.width;
    double _height =MediaQuery.of(context).size.height;

    return SafeArea(
        child: kIsWeb?Scaffold(
          backgroundColor: Colors.black,
          body: Column(
            children: [
              FutureBuilder<dynamic>(
                  future:FirebaseFirestore.instance.collection("data").doc(widget.id).collection('video').doc(widget.id2).get(),
                  builder: (context, snaps) {
                    var data = snaps.data!.data();
                    return Center(
                      child: Container(
                        width: 565,
                        height: 320,
                        child: FlickVideoPlayer(

                          flickManager: FlickManager(

                              videoPlayerController:
                              VideoPlayerController.network( data['videourl'],),
                          ),
                        ),
                      ),
                    );
                  }
              ),
              Container(
                child:SingleChildScrollView(
                  child: Column(
                    children: [
                      Padding(
                        padding:EdgeInsets.only(top: 0),
                        child: Container(

                          decoration: BoxDecoration(

                            color: Colors.white,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              FutureBuilder<dynamic>(
                                  future: FirebaseFirestore.instance.collection("data").doc(widget.id).collection('video').doc(widget.id2).get(),
                                  builder: (context, snaps) {
                                    var data = snaps.data!.data();
                                    return Padding(
                                      padding: EdgeInsets.only(top: _height/17.406,left: _width/15.7088),
                                      child: Text(data['title'],style: GoogleFonts.roboto(

                                        fontWeight: FontWeight.w400,
                                        fontSize: 20,
                                      ),),
                                    );
                                  }
                              ),///title
                              Padding(
                                padding:  EdgeInsets.only(top: _height/97.965,left: _width/15.7088),
                                child: Row(
                                  children: [
                                    SvgPicture.asset('assets/clock.svg'),
                                    Text('3h 30mins',style: GoogleFonts.roboto(

                                      fontWeight: FontWeight.w400,
                                      fontSize: 12,
                                    ),),
                                    SvgPicture.asset('assets/dot.svg'),
                                    SvgPicture.asset('assets/you.svg'),
                                    Text('10 Videos',style: GoogleFonts.roboto(

                                      fontWeight: FontWeight.w400,
                                      fontSize:12,
                                    ),),
                                  ],
                                ),
                              ),
                              Padding(
                                padding:  EdgeInsets.only(top: _height/22.379,left:_width/ 19.636),
                                child: Text('Videos',style: GoogleFonts.roboto(
                                  color: Color(0xffF7C400),
                                  fontWeight: FontWeight.w400,
                                  fontSize: 18,
                                ),),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding:EdgeInsets.only(top:0),
                        child: SingleChildScrollView(
                          child: Container(
                            height: 200,
                            color: Colors.white,
                            child: StreamBuilder(
                                stream: FirebaseFirestore.instance.collection("data").doc(widget.id).collection('video').snapshots(),
                                builder: (context, snap) {
                                  return ListView.builder(
                                      physics: ScrollPhysics(),
                                      shrinkWrap: true,
                                      itemCount:snap.data!.docs.length,
                                      itemBuilder:(BuildContext context,index){
                                        return Padding(
                                          padding: EdgeInsets.symmetric(vertical: _height/52.218,horizontal: _width/26.1813),
                                          child: Row(
                                            children: [
                                              Container(
                                                width: _width/15.17777,
                                                height: _height/13.14,
                                                color: Colors.white,
                                                child: ClipRRect(
                                                    borderRadius: BorderRadius.circular(15),
                                                    child: Image.network(snap.data!.docs[index]['img'])
                                                ),
                                              ),
                                              SizedBox(
                                                width: _width/136.6,
                                              ),
                                              Padding(
                                                padding:  EdgeInsets.only(bottom: _height/52.218),
                                                child: Column(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    Padding(
                                                      padding:  EdgeInsets.only(left: 0,bottom: _height/156.654),
                                                      child: Text(snap.data!.docs[index]['title'],style: GoogleFonts.openSans(
                                                          fontWeight: FontWeight.w500,
                                                          fontSize: 12
                                                      ),),
                                                    ),
                                                    Padding(
                                                      padding:  EdgeInsets.only(right: _width/3.57018),
                                                      child: Row(
                                                        children: [
                                                          SvgPicture.asset('assets/clock.svg'),
                                                          Text('3min 60sec',style: GoogleFonts.roboto(

                                                            fontWeight: FontWeight.w400,
                                                            fontSize: 12,
                                                          ),),
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              SizedBox(width: _width/11.22057,),
                                              Container(
                                                width: _width/12.2725,
                                                height: _height/24.47718,

                                                decoration: BoxDecoration(color: Color(0xffECECEC),

                                                    borderRadius: BorderRadius.circular(20)
                                                ),
                                                child: SvgPicture.asset('assets/Group.svg'),
                                              )

                                            ],

                                          ),
                                        );
                                      }

                                  );
                                }
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

              )
            ],
          ) ,
        ):
        Scaffold(
          body: Stack(
            children: [
              Padding(
                padding:EdgeInsets.only(top: _height/3.560318),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white,
                  ),
                  child: Row(

                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          FutureBuilder<dynamic>(
                              future: FirebaseFirestore.instance.collection("data").doc(widget.id).collection('video').doc(widget.id2).get(),
                              builder: (context, snaps) {
                                var data = snaps.data!.data();
                                return Padding(
                                  padding: EdgeInsets.only(top: _height/17.406,left: _width/15.7088),
                                  child: Text(data['title'],style: GoogleFonts.roboto(

                                    fontWeight: FontWeight.w400,
                                    fontSize: _width/19.636,
                                  ),),
                                );
                              }
                          ),///title
                          Padding(
                            padding:  EdgeInsets.only(top: _height/97.965,left: _width/15.7088),
                            child: Row(
                              children: [
                                SvgPicture.asset('assets/clock.svg'),
                                Text('3h 30mins',style: GoogleFonts.roboto(

                                  fontWeight: FontWeight.w400,
                                  fontSize: _width/32.7266,
                                ),),
                                SvgPicture.asset('assets/dot.svg'),
                                SvgPicture.asset('assets/you.svg'),
                                Text('10 Videos',style: GoogleFonts.roboto(

                                  fontWeight: FontWeight.w400,
                                  fontSize:_width/32.7266,
                                ),),
                                SizedBox(width:180),
                              ],
                            ),
                          ),
                          Padding(
                            padding:  EdgeInsets.only(top: _height/22.379,left:_width/ 19.636),
                            child: Text('Videos',style: GoogleFonts.roboto(

                              fontWeight: FontWeight.w400,
                              fontSize: _width/21.817,
                            ),),
                          ),
                        ],
                      ),

                    ],
                  ),
                ),
              ),
              Padding(
                padding:EdgeInsets.only(top:_height/2.23791),
                child: SingleChildScrollView(

                  physics: ScrollPhysics(),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      StreamBuilder(
                          stream: FirebaseFirestore.instance.collection("data").doc(widget.id).collection('video').snapshots(),
                          builder: (context, snap) {
                            return ListView.builder(
                                shrinkWrap: true,
                                itemCount:snap.data!.docs.length,
                                itemBuilder:(BuildContext context,index){
                                  return Padding(
                                    padding: EdgeInsets.symmetric(vertical: _height/52.218,horizontal: _width/26.1813),
                                    child: snap.data!.docs[index].id==widget.id2?
                                    Row(
                                      children: [
                                        Container(
                                          width: _width/4.36355,
                                          height: _height/15.6654,
                                          color: Colors.red,
                                          child: ClipRRect(
                                              borderRadius: BorderRadius.circular(15),
                                              child: SvgPicture.network(snap.data!.docs[index]['img'])
                                          ),
                                        ),
                                        SizedBox(
                                          width:0
                                        ),
                                        Padding(
                                          padding:  EdgeInsets.only(bottom: _height/52.218),
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Padding(
                                                padding:  EdgeInsets.only(left: 0,bottom: _height/156.654),
                                                child: Text(snap.data!.docs[index]['title'],style: GoogleFonts.openSans(
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: _width/26.18133
                                                ),),
                                              ),
                                              Padding(
                                                padding:  EdgeInsets.only(right: _width/3.57018),
                                                child: Row(
                                                  children: [
                                                    SvgPicture.asset('assets/clock.svg'),
                                                    Text('3min 60sec',style: GoogleFonts.roboto(

                                                      fontWeight: FontWeight.w400,
                                                      fontSize: _width/32.7266,
                                                    ),),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        SizedBox(width: 0),
                                        Container(
                                          width: _width/12.2725,
                                          height: _height/24.47718,

                                          decoration: BoxDecoration(color: Color(0xffECECEC),

                                              borderRadius: BorderRadius.circular(20)
                                          ),
                                          child: SvgPicture.asset('assets/Group.svg'),
                                        ),
                                        ValueListenableBuilder (
                                          valueListenable: _videoPlayerController,
                                          builder: (context,  value, child) {
                                            return value.duration==value.position?update() :SizedBox();
                                          },
                                        ),
                                        SizedBox(
                                          width: 15,
                                        ),







                                      ],

                                    ):
                                    Row(
                                      children: [
                                        Container(
                                          width: _width/4.36355,
                                          height: _height/15.6654,

                                          child: ClipRRect(
                                              borderRadius: BorderRadius.circular(15),
                                              child: SvgPicture.network(snap.data!.docs[index]['img'])
                                          ),
                                        ),
                                        SizedBox(
                                          width: _width/39.272,
                                        ),
                                        Padding(
                                          padding:  EdgeInsets.only(bottom: _height/52.218),
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Padding(
                                                padding:  EdgeInsets.only(left: 0,bottom: _height/156.654),
                                                child: Text(snap.data!.docs[index]['title'],style: GoogleFonts.openSans(
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: _width/26.18133
                                                ),),
                                              ),
                                              Padding(
                                                padding:  EdgeInsets.only(right: _width/3.57018),
                                                child: Row(
                                                  children: [
                                                    SvgPicture.asset('assets/clock.svg'),
                                                    Text('3min 60sec',style: GoogleFonts.roboto(

                                                      fontWeight: FontWeight.w400,
                                                      fontSize: _width/32.7266,
                                                    ),),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        SizedBox(width: 0),
                                        Container(
                                          width: _width/12.2725,
                                          height: _height/24.47718,

                                          decoration: BoxDecoration(color: Color(0xffECECEC),

                                              borderRadius: BorderRadius.circular(20)
                                          ),
                                          child: SvgPicture.asset('assets/Group.svg'),
                                        ),

                                        Container(

                                            child: Icon(Icons.done))

                                      ],

                                    ),
                                  );
                                }

                            );
                          }
                      ),



                    ],
                  ),
                ),
              ),

            Column(
             children: [
               Container(
              width: _width,
              height: 250,
              child:FlickVideoPlayer(
                flickManager: FlickManager(
                    autoPlay: true,
                    videoPlayerController: _videoPlayerController
                ),
              )


          ),
        ],
      ),




            ],
          ) ,

        )

    );

  }
 update() async {
    print('demo');
   final FirebaseFirestore _firestore = FirebaseFirestore.instance;
   await _firestore.collection('Users').doc(
       FirebaseAuth.instance.currentUser!.uid).collection('History').doc().set({
      "docid": widget.id2
   }
   );


  }

@override
  void dispose() {
  if (_videoPlayerController.value.isPlaying) _videoPlayerController.pause();
    _videoPlayerController.dispose();
    // TODO: implement dispose
    super.dispose();
  }

}