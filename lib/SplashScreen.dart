import 'dart:async';
import 'package:flutter/material.dart';
import 'package:netflix_clone/OnboardingScreen.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => new _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>{

  Future<void> _initializeState() async {
    Future.delayed(
      Duration(milliseconds: 2450),
      (){
        try{
          Navigator.of(context).push(MaterialPageRoute(builder: (context) => 
                new OnBoardingScreen(),
              )
            );
        }catch(e){
        }
      },
    );
  }

  @override
  void initState(){
    super.initState();
    _initializeState();
  }
  @override
  Widget build(BuildContext build){
    return new Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/netflix-logo.gif"),
          fit: BoxFit.fill
        ) ,
      ),
    );
  }
}