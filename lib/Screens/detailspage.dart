

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:master/Screens/videopage.dart';

class detailpage extends StatefulWidget {

  String id;
  detailpage(this.id);
  @override
  State<detailpage> createState() => _detailpageState();
}

class _detailpageState extends State<detailpage> {


  int videocount=0;
  getvideocount()async{
    var document=await FirebaseFirestore.instance.collection("data").doc(widget.id).collection('video').get();
    setState(() {
      videocount=document.docs.length;
    });

  }
  @override
  void initState() {
    getvideocount();
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    double _width =MediaQuery.of(context).size.width;
    double _height =MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        body: FutureBuilder<dynamic>(
          future: FirebaseFirestore.instance.collection("data").doc(widget.id).get(),
          builder: (context, snap) {
            if(!snap.hasData){
              return Scaffold(
                body: CircularProgressIndicator(),
              );
            };
            var data = snap.data!.data();
            return Stack(
              children: [
                Container(
                  width:_width/1.001836 ,
                  height: _height/3.13308,

                  alignment: Alignment.centerRight,
                  child: Stack(
                    children: [
                      Container(
                          width:_width/1.001836 ,
                          height: _height/3.13308,
                          color: Colors.red,

                          child: SvgPicture.network(data['img'],fit: BoxFit.fitWidth,)),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          GestureDetector(
                            onTap: (){
                              Navigator.pop(context);
                            },
                            child: Padding(
                              padding:  EdgeInsets.only(left:_width/15.7088,top: _height/52.218),
                              child: Container(
                                child: SvgPicture.asset('assets/arrow.svg')
                              ),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding:  EdgeInsets.only(top: _height/9.2149,left: _width/15.7088),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding:  EdgeInsets.only(right: _width/19.636),
                                      child: Text(data['title'],style: GoogleFonts.roboto(
                                          fontWeight: FontWeight.bold,
                                          fontSize:_width/12.2725,
                                        color: Color(0xff222B45)
                                      ),),
                                    ),
                                    Row(
                                      children: [
                                        Container(
                                          child: SvgPicture.asset('assets/youtubeicon.svg'),
                                        ),
                                        Text('${videocount.toString()} Videos',style: GoogleFonts.roboto(
                                            fontWeight: FontWeight.w500,
                                            fontSize:_width/28.051428,
                                          color: Color(0xff222B45)
                                        ),),
                                      ],
                                    ),
                                  ],
                                ),
                              ),

                            ],
                          ),
                        ],
                      ),
                    ],
                  ),

                ),
                SingleChildScrollView(
                  child: Stack(
                    children: [
                      Padding(
                        padding:EdgeInsets.only(top: _height/3.91635),
                        child: Container(
                          width: _width/0.9818,
                          height: _height/0.8703,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(32),
                            color: Colors.white
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding:  EdgeInsets.only(top: _height/39.1635,left: _width/26.18133),
                                child: Row(
                                  children: [
                                    SvgPicture.asset('assets/noteicon.svg',height: _height/43.515,),
                                    SizedBox(width: 5,),
                                    Text('Course Description',style: GoogleFonts.roboto(

                                        fontWeight: FontWeight.bold,
                                        fontSize:_width/21.8177,
                                        color: Color(0xff222B45)
                                    ),),
                                  ],
                                ),
                              ),
                              Padding(
                                padding:  EdgeInsets.only(top: _height/52.218,left: _width/19.636),
                                child: Text(data['des'],
                                  style: GoogleFonts.roboto(
                                         fontWeight: FontWeight.w500,
                                         fontSize:_width/24.545,
                                         color: Color(0xff222B45)
            ),)
                              ),
                              Padding(
                                padding:  EdgeInsets.only(left:  _width/19.636,top:_height/26.109),
                                child: Text('Master - Arul Raj',style: GoogleFonts.roboto(
                                    fontWeight: FontWeight.w500,
                                    fontSize:_width/24.545,
                                    color: Color(0xff222B45)
                                ),),
                              ),
                              Padding(
                                padding:  EdgeInsets.only( left:  _width/19.636,),
                                child: Text('Language - English ',style: GoogleFonts.roboto(
                                    fontWeight: FontWeight.w500,
                                    fontSize:_width/24.545,
                                    color: Color(0xff222B45)
                                ),),
                              ),
                              Padding(
                                padding:  EdgeInsets.only(left:  _width/19.636),
                                child: Text('Course Length - On going course',style: GoogleFonts.roboto(
                                    fontWeight: FontWeight.w500,
                                    fontSize:_width/24.545,
                                    color: Color(0xff222B45)
                                ),),
                              ),
                              Padding(
                                padding:  EdgeInsets.only(left:_width/19.636,top: _height/39.1635),
                                child: GestureDetector(
                                  onTap: (){

                                  },
                                  child: Container(
                                    width: _width/2.24411428,
                                    height: _height/13.9869,
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(30),
                                        color: Color(0xffFADA5E)
                                    ),
                                    child: Text(
                                      'Start Learning',
                                      style:  GoogleFonts.openSans(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: _width/21.8177
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding:  EdgeInsets.only(top: _height/31.3308),
                                child: Row(
                                  children: [
                                    Padding(
                                      padding:  EdgeInsets.only(left: _width/15.1046),
                                      child: Text('View course previews',style: GoogleFonts.roboto(

                                          fontWeight: FontWeight.w500,
                                          color: Color(0xff222B45),
                                          fontSize: _width/24.545
                                      ),),
                                    ),
                                    SizedBox(width: _width/2.310117,),
                                    Icon(Icons.arrow_forward_ios_rounded,size: _width/26.181333,
                                      color: Color(0xff222B45),
                                    ),

                                  ],
                                ),
                              ),
                              StreamBuilder(
                                stream: FirebaseFirestore.instance.collection("data").doc(widget.id).collection('video').snapshots(),
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
                                              Navigator.of(context).push(MaterialPageRoute(builder: (context)=>videopage(widget.id,

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

                                                      ],
                                                    ))
                                              ],
                                            ),
                                          );
                                        }),
                                  );
                                },
                              )




                            ],
                          ),


                        ),
                      )
                    ],
                  ),
                )
              ],
            );
          }
        ) ,
      ),
    );
  }
}
