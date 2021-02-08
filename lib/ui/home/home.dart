import 'package:fbitcolor/constants/assets.dart';
import 'package:fbitcolor/constants/colors.dart';
import 'package:fbitcolor/constants/dimens.dart';
import 'package:fbitcolor/constants/strings.dart';
import 'package:fbitcolor/widgets/custom_slider.dart';
import 'package:fbitcolor/widgets/custom_thumb.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool _blackout;
  double red, green, blue, brightness, speed, strobe, strobeSpeed;

  @override
  void initState() {
    _blackout = false;
    red = 100;
    green = 200;
    blue = 211;
    brightness = 33;
    speed = 32;
    strobe = 212;
    strobeSpeed = 221;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                    padding: EdgeInsets.only(left: 10.0),
                    decoration: BoxDecoration(
                      borderRadius:
                          BorderRadius.circular(Dimens.containerBorderRadius),
                      color: Theme.of(context).backgroundColor,
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(Strings.blackout),
                        Transform.scale(
                          scale: 0.8,
                          child: CupertinoSwitch(
                              value: _blackout,
                              trackColor:
                                  Theme.of(context).scaffoldBackgroundColor,
                              onChanged: (value) {
                                setState(() {
                                  _blackout = value;
                                });
                              }),
                        ),
                      ],
                    )),
                Spacer(),
                IconButton(icon: Icon(Icons.ac_unit), onPressed: () {}),
              ],
            ),
            SizedBox(
              height: Dimens.sizedBoxHeight * 2,
            ),
            Row(
              children: [
                Expanded(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      Strings.nowPlaying,
                      style: TextStyle(color: AppColors.orangeColor),
                    ),
                    SizedBox(height: Dimens.sizedBoxHeight),
                    Stack(
                      children: [
                        ClipRRect(
                            borderRadius:
                                BorderRadius.circular(Dimens.imageBorderRadius),
                            child: Image.asset(
                              Assets.carBackground,
                            )),
                        Positioned(
                            left: 10,
                            bottom: 10,
                            child: Text(
                              "17",
                              style: TextStyle(
                                  color: AppColors.whiteColor,
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold),
                            ))
                      ],
                    )
                  ],
                )),
                SizedBox(width: 10.0),
                Expanded(
                    child: Column(
                  children: [
                    Row(
                      children: [
                        Text(Strings.singleColor),
                        Spacer(),
                        Transform.scale(
                          scale: 0.8,
                          child: CupertinoButton(
                            padding: EdgeInsets.symmetric(
                                horizontal: 30, vertical: 0),
                            child: Text("Use",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.whiteColor,
                                )),
                            onPressed: null,
                            color: AppColors.orangeColor,
                            disabledColor: AppColors.orangeColor,
                          ),
                        ),
                      ],
                    ),
                    Container(
                      height: 150,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppColors.orangeColor,
                      ),
                    )
                  ],
                )),
              ],
            ),
            SizedBox(height: Dimens.sizedBoxHeight),
            Container(
              padding: EdgeInsets.all(10.0),
              height: 250,
              decoration: BoxDecoration(
                color: AppColors.primaryBackgroundColor,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SliderWidget(
                      title: "RED",
                      activeTrackColor: Colors.red,
                      initialValue: red,
                      onValueChanged: (value) {
                        setState(() {
                          red = value;
                        });
                      },
                    ),
                    SliderWidget(
                      title: "GREEN",
                      activeTrackColor: Colors.green,
                      initialValue: green,
                      onValueChanged: (value) {
                        setState(() {
                          green = value;
                        });
                      },
                    ),
                    SliderWidget(
                      title: "BLUE",
                      activeTrackColor: Colors.blue,
                      initialValue: blue,
                      onValueChanged: (value) {
                        setState(() {
                          blue = value;
                        });
                      },
                    ),
                    SliderWidget(
                      title: "BG",
                      activeTrackColor: Colors.grey,
                      initialValue: brightness,
                      onValueChanged: (value) {
                        setState(() {
                          brightness = value;
                        });
                      },
                    ),
                    SliderWidget(
                      title: ">>",
                      activeTrackColor: Colors.grey,
                      initialValue: speed,
                      onValueChanged: (value) {
                        setState(() {
                          speed = value;
                        });
                      },
                    ),
                    SliderWidget(
                      title: "STROB",
                      activeTrackColor: Colors.grey,
                      initialValue: strobe,
                      onValueChanged: (value) {
                        setState(() {
                          strobe = value;
                        });
                      },
                    ),
                    SliderWidget(
                      title: "STROB >>",
                      activeTrackColor: Colors.grey,
                      initialValue: strobeSpeed,
                      onValueChanged: (value) {
                        setState(() {
                          strobeSpeed = value;
                        });
                      },
                    ),
                  ]),
            ),
          ],
        ),
      ),
    );
  }
}
