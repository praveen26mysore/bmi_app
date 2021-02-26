import 'dart:async';

import 'package:bmi_app_one/components/Button_Text_TextStyle.dart';
import 'package:bmi_app_one/components/RoundIcon.dart';
import 'package:bmi_app_one/utils/TextStyle_Decorations.dart';
import 'package:bmi_app_one/utils/hexcolor.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'ResultScreen.dart';

class home_screen extends StatefulWidget {
  @override
  _home_screenState createState() => _home_screenState();
}

class _home_screenState extends State<home_screen> {

  //Color _appBar_bg_color = HexColor('#1C1C1E');
 // Color _app_bg_color = HexColor('#2c2c2e');
  Color _BMIyellow = HexColor("#f5cc0a");
  Color _Containercolor = HexColor("#1D1E33");
  Color _ActiveColor = HexColor("#f5cc0a").withOpacity(0.7);
  Color _InActiveColor = Colors.white.withOpacity(0.7);
  Color _ThumbOverlayColor = HexColor("#f5cc0a").withOpacity(0.1);
  Color _BtnColor = HexColor("#EB1555");
  Color _newAppBgColor = HexColor("#111328");
  bool changeButtonColorMale = false;
  bool changeButtonColorFemale = false;
  int age = 20;
  int weight = 30;
  int height = 20;
  Timer _timer;

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      systemNavigationBarColor: _newAppBgColor, // navigation bar color
    ));
    return Scaffold(
      appBar: AppBar(
        title: homeScreenAppBarText,
        backgroundColor: _newAppBgColor,
        centerTitle: true,
      ),
      backgroundColor: _newAppBgColor,
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              width: ScreenUtil().screenWidth,
              height: 0.52.sh,
              child: Row(
                /* Entry Point of 1st set */
                children: [
                  /* This contains both Male and female gender button */
                  Column(
                    children: [
                      Row(
                        children: [
                          /* Male Button */
                          Padding(
                            /* changed top padding from 8 to 18*/
                            padding: const EdgeInsets.fromLTRB(8, 18, 4, 8),
                            child: InkWell(
                              onTap: (){
                                debugPrint("Gender: Male pressed");
                                setState(() {
                                  if(changeButtonColorMale == false){
                                    changeButtonColorMale = true;
                                    changeButtonColorFemale = false;
                                  }
                                  else{
                                    changeButtonColorMale = false;
                                  }
                                });
                              },
                              splashColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              child: Container(
                                width: 0.4.sw,
                                height: 0.2.sh,
                                decoration: BoxDecoration(
                                    color: _Containercolor,
                                    borderRadius: BorderRadius.circular(10.0),
                                ),
                                margin: EdgeInsets.all(10),
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(0, 7, 0, 12),
                                      child: Icon(Ionicons.ios_male,size: 88.ssp,
                                          color: changeButtonColorMale ? _ActiveColor : _InActiveColor
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(0, 1, 0, 5),
                                      child: Text(
                                        "MALE", style: TextStyle(
                                        fontSize: 24.ssp,
                                          fontFamily: 'San francisco',
                                          color: changeButtonColorMale ? _ActiveColor : _InActiveColor
                                      ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),

                            ),
                          ),
                          /* Age */
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 18, 8, 8),
                            child: Container(
                              width: 0.43.sw,
                              height: 0.2.sh,
                              margin: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                  color: _Containercolor,
                                  borderRadius: BorderRadius.circular(10.0)
                              ),
                              child: Column(
                                //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  /* Age Text */
                                  Padding(
                                    padding: const EdgeInsets.fromLTRB(8, 8, 8, 8),
                                    child: Text("AGE",
                                    style: TextStyle(
                                      fontSize: 24.ssp,
                                      fontFamily: 'San francisco',
                                      color: _InActiveColor
                                    ),
                                    ),
                                  ),
                              /* Display Age in Numbers */
                                Text(age.toString(),
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 26.ssp,
                                    fontFamily: 'San francisco',
                                  ),
                                ),
                                  Row(
                                    children: [
                                      /* Age decrease icon */
                                      Flexible(
                                        child: GestureDetector(
                                            onTap: (){
                                              debugPrint("OnTap Pressed...");
                                              setState(() {
                                                if (age > 5) age--;
                                              });
                                            },
                                            onTapDown: (TapDownDetails details){
                                              debugPrint("onTapDown Pressed...");
                                              _timer = Timer.periodic(Duration(milliseconds: 100), (t) {
                                                setState(() {
                                                  if (age > 5) age--;
                                                });
                                                debugPrint("value $age");
                                              });
                                            },
                                            onTapUp: (TapUpDetails details) {
                                              debugPrint("OnTapDown pressed..");
                                              _timer.cancel();
                                            },
                                            onTapCancel: () {
                                              debugPrint("OnTap cancel");
                                              _timer.cancel();
                                            },
                                          child: RoundIconBtnMinus(
                                            icon: new IconButton(
                                              icon: new Icon (
                                                  FontAwesome.minus,
                                              ),
                                              iconSize: 30.ssp,
                                            ),
                                          ),
                                          ),
                                      ),
                                      /* Age increase icon */
                                      Flexible(
                                      child: GestureDetector(
                                          onTap: (){
                                            debugPrint("OnTap Pressed...");
                                            setState(() {
                                              if (age < 90) age++;
                                            });
                                          },
                                          onTapDown: (TapDownDetails details){
                                            debugPrint("onTapDown Pressed...");
                                            _timer = Timer.periodic(Duration(milliseconds: 100), (t) {
                                              setState(() {
                                                if (age < 90) age++;
                                              });
                                              debugPrint("value $age");
                                            });
                                          },
                                          onTapUp: (TapUpDetails details) {
                                            debugPrint("OnTapDown pressed..");
                                            _timer.cancel();
                                          },
                                          onTapCancel: () {
                                            debugPrint("OnTap cancel");
                                            _timer.cancel();
                                          },
                                          child: RoundIconBtnPlus(
                                              icon: new IconButton(
                                                  icon: new Icon(
                                                    FontAwesome.plus,
                                                  ),
                                                iconSize: 30.ssp,
                                              )
                                          )
                                        )),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          /* Female Button */
                          Padding(
                            padding: const EdgeInsets.fromLTRB(8, 0, 4, 0),
                            child: new InkWell(
                              onTap: (){
                                debugPrint("Gender: Female pressed");
                                setState(() {
                                  if(changeButtonColorFemale == false){
                                    changeButtonColorFemale = true;
                                    changeButtonColorMale = false;
                                  }
                                  else{
                                    changeButtonColorFemale = false;
                                  }
                                });
                              },
                              splashColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              child: Container(
                                width: 0.4.sw,
                                height: 0.2.sh,
                                decoration: BoxDecoration(
                                    color: _Containercolor,
                                    borderRadius: BorderRadius.circular(10.0)
                                ),
                                margin: EdgeInsets.all(10.0),
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(0, 7, 0, 12),
                                      child: Icon(Ionicons.ios_female,size: 88.ssp,
                                          color: changeButtonColorFemale ? _ActiveColor : _InActiveColor
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(0, 1, 0, 5),
                                      child: Text(
                                        "FEMALE", style: TextStyle(
                                          fontSize: 24.ssp,
                                          fontFamily: 'San francisco',
                                          color: changeButtonColorFemale ? _ActiveColor : _InActiveColor
                                      ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),


                            ),
                          ),

                          /* Weight */
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 8, 8, 8),
                            child: Container(
                              width: 0.43.sw,
                              height: 0.2.sh,
                              margin: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                  color: _Containercolor,
                                  borderRadius: BorderRadius.circular(10.0)
                              ),
                              child: Column(
                                children: [
                                  /* Weight Text */
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.baseline,
                                    textBaseline: TextBaseline.alphabetic,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.fromLTRB(24, 10, 3, 5),
                                        child: Text("WEIGHT",
                                          style: TextStyle(
                                              fontSize: 24.ssp,
                                              fontFamily: 'San francisco',
                                              color: _InActiveColor
                                          ),
                                        ),
                                      ),
                                      Text("(Kg)",
                                        style: TextStyle(
                                          color: _InActiveColor,
                                          fontSize: 11.ssp,
                                          fontFamily: 'San francisco',
                                        ),
                                      ),
                                    ],
                                  ),
                                  /* Display Weight in numbers */
                                  Text(weight.toString(),
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 26.ssp,
                                        fontFamily: 'San francisco',
                                      ),
                                    ),
                                  Row(
                                    children: [
                                      /* Weight decrease icon */
                                        /* Gesture Detector placed */
                                        Flexible(
                                          child: GestureDetector(
                                            onTap: (){
                                              debugPrint("OnTap Pressed...");
                                              setState(() {
                                                if(weight > 5) weight--;
                                              });
                                            },
                                            onTapDown: (TapDownDetails details){
                                              debugPrint("onTapDown Pressed...");
                                              _timer = Timer.periodic(Duration(milliseconds: 100), (t) {
                                                setState(() {
                                                  if(weight > 5) weight--;
                                                });
                                                debugPrint("value $weight");
                                              });
                                            },
                                            onTapUp: (TapUpDetails details) {
                                              debugPrint("OnTap up pressed..");
                                              _timer.cancel();
                                            },
                                            onTapCancel: () {
                                              debugPrint("OnTap cancel");
                                              _timer.cancel();
                                            },
                                            child: RoundIconBtnMinus(
                                              icon: new IconButton(
                                                icon: new Icon (
                                                  FontAwesome.minus,
                                                ),
                                                iconSize: 30.ssp,
                                              ),
                                            ),
                                          ),
                                        ),
                                      /* Weight increase icon */
                                      Flexible(
                                          child: GestureDetector(
                                            onTap: (){
                                              debugPrint("OnTap Pressed...");
                                              setState(() {
                                                if (weight <= 625) weight++;
                                              });
                                            },
                                            onTapDown: (TapDownDetails details){
                                              debugPrint("onTapDown Pressed...");
                                              _timer = Timer.periodic(Duration(milliseconds: 100), (t) {
                                                setState(() {
                                                  if (weight <= 625) weight++;
                                                });
                                                debugPrint("value $weight");
                                              });
                                            },
                                            onTapUp: (TapUpDetails details) {
                                              debugPrint("OnTapDown pressed..");
                                              _timer.cancel();
                                            },
                                            onTapCancel: () {
                                              debugPrint("OnTap cancel");
                                              _timer.cancel();
                                            },
                                              child: RoundIconBtnPlus(
                                                  icon: new IconButton(
                                                    icon: new Icon(
                                                      FontAwesome.plus,
                                                    ),
                                                    iconSize: 30.ssp,
                                                  )
                                              )
                                          ),
                                        ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),

                        ],
                      )
                    ],
                  ),
                ],
              ),
            ),

            /* Height Slider 2nd set */
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 9, 20, 0),
              child: Container(
                width: ScreenUtil().screenWidth,
                height: 0.2.sh,
                decoration: BoxDecoration(
                  color: _Containercolor,
                  borderRadius: BorderRadius.circular(10.0)
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(12, 12, 12, 8),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        textBaseline: TextBaseline.alphabetic,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          /* Height label */
                          Text("HEIGHT",
                              style: TextStyle(
                                  fontSize: 24.ssp,
                                  fontFamily: 'San francisco',
                                  color: _InActiveColor
                              ),
                            ),
                          Text("(Cm)",
                            style: TextStyle(
                              color: _InActiveColor,
                              fontSize: 11.ssp,
                              fontFamily: 'San francisco',
                            ),
                          ),
                        ],
                      ),
                    ),
                    /* Height value */
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0, 15, 4),
                      child: Text(height.toString(),
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 26.ssp,
                        fontFamily: 'San francisco',
                      ),
                      ),
                    ),
                    /* Slider */
                    SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                        trackHeight: 2.0,
                        thumbColor: _ActiveColor,
                        activeTrackColor: _ActiveColor,
                        inactiveTrackColor: _InActiveColor,
                        thumbShape: RoundSliderThumbShape(enabledThumbRadius: 12.0),
                        overlayColor: _ThumbOverlayColor
                      ),
                      child: Slider(
                          min: 10,
                          max: 300,
                          value: height.round().toDouble(),
                          onChanged: (double value){
                            debugPrint("Height slided");
                            setState(() {
                              height = value.round();
                            });
                          }
                      ),
                    )
                  ],
                ),
              ),
            ),

            /* Calculate BMI Button */
            ButtonTheme(
              minWidth: ScreenUtil().screenWidth,
              height: 0.06.sh,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 30, 20, 0),
                child: RaisedButton(
                    padding: EdgeInsets.zero,
                    color: _BtnColor,
                    child: Container(
                      width: ScreenUtil().screenWidth,
                      height: 0.06.sh,
                      child: Center(
                        child: btnText(
                            text: "CALCULATE",
                            size: 21.0.ssp,
                            color: Colors.white
                        )
                      ),
                    ),
                    shape: RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(10.0)
                    ),
                    onPressed: (){
                      debugPrint("Your BMI is...");
                      Navigator.push(context, MaterialPageRoute(
                                              builder: (context) => BMIResult()
                                            ));
                    }
                ),
              ),
            )

          ],
        ),
      )
    );
  }
}