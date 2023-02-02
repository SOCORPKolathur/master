import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/foundation.dart' show kIsWeb;


class BannerSlider extends StatefulWidget {
  @override
  _BannerSliderState createState() => _BannerSliderState();
}

class _BannerSliderState extends State<BannerSlider> {
  int _index = 0;
  int _dataLength = 1;

  @override
  void initState() {
    getSliderImageFromDb();
    super.initState();
  }

  Future<List<QueryDocumentSnapshot<Map<String, dynamic>>>> getSliderImageFromDb() async {
    var _fireStore = FirebaseFirestore.instance;
    QuerySnapshot<Map<String,dynamic>> snapshot = await _fireStore.collection('slid').get();
    if (mounted) {
      setState(() {
        _dataLength = snapshot.docs.length;
      });
    }
    return snapshot.docs;
  }


  @override
  Widget build(BuildContext context) {
    double _height = MediaQuery.of(context).size.height;
    double  _width = MediaQuery.of(context).size.width;
    return kIsWeb? Column(
      children: [
        if (_dataLength != 0)
          FutureBuilder(
            future: getSliderImageFromDb(),
            builder: (_, AsyncSnapshot<List<QueryDocumentSnapshot<Map<String, dynamic>>>> snapShot)  {

              return snapShot.data == null?  Center(
                child: CircularProgressIndicator(),):
              Container(
                width: 1366,
                height:250,

                child: CarouselSlider.builder(
                    itemCount: snapShot.data!.length,
                    itemBuilder: ( context,int index, int) {
                      DocumentSnapshot sliderImage = snapShot.data![index];
                      Map? getImage = sliderImage.data() as Map? ;
                      return
                        Padding(
                          padding: EdgeInsets.symmetric(vertical:_height/31.3308 ,horizontal:_width/15.7088),
                          child: getImage == null ? null :
                          Container(
                            width: 1800,
                            child: ClipRRect(
                                borderRadius: BorderRadius.circular(20),

                                child: Image.network(getImage["img"] ?? '',fit: BoxFit.cover,)),
                          ),
                        );



                    },
                    options: CarouselOptions(
                        viewportFraction: 1,
                        initialPage: 0,
                        autoPlay: true,


                        onPageChanged:
                            (int i, carouselPageChangedReason) {
                          setState(() {
                            _index = i;
                          });
                        })),
              );
            },
          ),
      ],
    ):Column(
      children: [
        if (_dataLength != 0)
          FutureBuilder(
            future: getSliderImageFromDb(),
            builder: (_, AsyncSnapshot<List<QueryDocumentSnapshot<Map<String, dynamic>>>> snapShot)  {

              return snapShot.data == null? const Scaffold(
                body: Center(
                  child: CircularProgressIndicator(),),):
              Container(
                width: _width/1.0280628,
                height: _height/3.12247368,
                child: CarouselSlider.builder(
                    itemCount: snapShot.data!.length,
                    itemBuilder: ( context,int index, int) {
                      DocumentSnapshot sliderImage = snapShot.data![index];
                      Map? getImage = sliderImage.data() as Map? ;
                      return
                        Padding(
                          padding: EdgeInsets.symmetric(vertical:_height/31.3308 ,horizontal:_width/15.7088),
                          child: Container(

                              width: _width/1.0280628,
                              height: _height/3.12247368,

                            child: Container(
                                width: _width/1.0280628,
                                height: _height/3.12247368,
                                decoration: BoxDecoration(

                                    borderRadius: BorderRadius.circular(20)
                                ),
                                child: getImage == null ? null :
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(20),

                                    child: SvgPicture.network(getImage["img"] ?? '',fit: BoxFit.fill,)))),
                        );



                    },
                    options: CarouselOptions(
                        viewportFraction: 1,
                        initialPage: 0,
                        autoPlay: true,


                        onPageChanged:
                            (int i, carouselPageChangedReason) {
                          setState(() {
                            _index = i;
                          });
                        })),
              );
            },
          ),
      ],
    );

  }
}