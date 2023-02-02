import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';


class BannerSliderdemo extends StatefulWidget {
  @override
  _BannerSliderdemoState createState() => _BannerSliderdemoState();
}

class _BannerSliderdemoState extends State<BannerSliderdemo> {
  @override
  @override
  Widget build(BuildContext context) {
    double _height = MediaQuery.of(context).size.height;
    double  _width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Row(
        children: [

        ],
      ),
    );

  }
}