import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class demo extends StatefulWidget {
  const demo({Key? key}) : super(key: key);

  @override
  State<demo> createState() => _demoState();
}

class _demoState extends State<demo> with SingleTickerProviderStateMixin{
  late Animation animation, animation1,animation2;
  late AnimationController _animationController;

  void initState() {
    super.initState();
    _animationController=AnimationController(duration: Duration(seconds: 5),vsync:this );
    animation=Tween(begin: -1.0,end:0.0 ).animate(
        CurvedAnimation(parent: _animationController, curve: Curves.fastOutSlowIn)
    );
    animation1=Tween(begin: -1.0,end:0.0 ).animate(
        CurvedAnimation(parent: _animationController, curve: Interval(0.5,1.0,curve:Curves.fastOutSlowIn))
    );
    animation2=Tween(begin: -1.0,end:0.0 ).animate(
        CurvedAnimation(parent: _animationController, curve: Interval(0.8,1.0,curve:Curves.fastOutSlowIn))
    );
    _animationController.forward();
  }
  @override
  Widget build(BuildContext context) {
    double _width=MediaQuery.of(context).size.width;

    return
  }
}Scaffold(
body: Container(
child: Transform(
transform: Matrix4.translationValues(animation.value*_width,0.0,0.0),
child: Center(
child: Container(

width: 300,
color: Colors.red,
child: Text("Welcome  \nto Nagass Ads",style: GoogleFonts.montserrat(
fontSize: 36,
fontWeight: FontWeight.bold,
color: Colors.white
),),
),
),
),
),
);
