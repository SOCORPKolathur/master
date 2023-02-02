import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:master/Screens/detailspage.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

class viewpage extends StatefulWidget {
  const viewpage({Key? key}) : super(key: key);

  @override
  State<viewpage> createState() => _viewpageState();
}

class _viewpageState extends State<viewpage> {
  @override
  Widget build(BuildContext context) {
    double _width =MediaQuery.of(context).size.width;
    double _height =MediaQuery.of(context).size.height;
    return kIsWeb?Scaffold(
      body: StreamBuilder(
          stream: FirebaseFirestore.instance.collection('data').snapshots(),
          builder: (context,snap){
            return Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 40),
                  child: Text("Courses for you",style: GoogleFonts.roboto(
                      color: Color(0xff222B45),
                      fontWeight: FontWeight.w500,
                      fontSize:30
                  ),),
                ),
                Container(
                  height: 550,
                  child: ListView.builder(
                      itemCount: snap.data!.docs.length,
                      itemBuilder: (context,index){
                        return GestureDetector(
                          onTap: (){
                            Navigator.of(context).push(MaterialPageRoute(builder: (context)=>detailpage(
                                snap.data!.docs[index].id
                            )));
                          },
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  width: 150,
                                  height: 100,

                                  child: ClipRRect(
                                      borderRadius: BorderRadius.circular(13),
                                      child: Image.network(snap.data!.docs[index]["img"],fit: BoxFit.cover,)),
                                ),
                              ),
                              Container(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [

                                      Text(snap.data!.docs[index]["title"],style: GoogleFonts.openSans(
                                          color: Color(0xff222B45),
                                          fontWeight: FontWeight.w500,
                                          fontSize: 20
                                      ),),
                                      Container(
                                        width: _width/1.77088,
                                        child: Text(snap.data!.docs[index]["des"],style: GoogleFonts.openSans(
                                            color: Color(0xff8F9BB2),

                                            fontWeight: FontWeight.w400,
                                            fontSize: 20
                                        ),overflow: TextOverflow.ellipsis,


                                        ),
                                      ),
                                    ],
                                  ))
                            ],
                          ),
                        );

                  }),
                ),
              ],
            );
          }

      ),
    ):
    Scaffold(
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('data').snapshots(),
        builder: (context,snap){
          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 40),
                child: Text("Courses for you",style: GoogleFonts.roboto(
                    color: Color(0xff222B45),
                    fontWeight: FontWeight.w500,
                    fontSize: _width/13.7088
                ),),
              ),
              Container(
                height: _height/3.6218,
                child: ListView.builder(
                    itemCount: snap.data!.docs.length,
                    itemBuilder: (context,index){
                      return GestureDetector(
                        onTap: (){
                          Navigator.of(context).push(MaterialPageRoute(builder: (context)=>detailpage(
                              snap.data!.docs[index].id
                          )));
                        },
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                width: 150,
                                height: 100,

                                child: ClipRRect(
                                    borderRadius: BorderRadius.circular(13),
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
                                      width: _width/1.77088,
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
              ),
            ],
          );
        }

    ),);
  }
}
