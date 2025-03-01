
// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';

import '../features/onBoarding/data/models/on_boarding_model.dart';

Color textColor = Colors.black;
Color kDefaultColor = Color(0xffea9f5b);
Color kDefaultRedColor = Color(0xffcf2d47);
Color kDefaultBlueColor = Color(0xff4167b1);
List <OnBoardingModel> onBoardings = [
  OnBoardingModel(image: 'assets/images/onboarding1.png', title: 'Welcome to E-Shop!',body: "Discover the best of both worlds with seamless Online & In-Store shopping. Whether you're at home or on the go, we’ve got you covered. Start exploring now!"),
  OnBoardingModel(image: 'assets/images/onboarding2.png', title: 'Fast And Effortless Shopping',body: 'With just a few taps, you can find everything you need. Shopping has never been this easy!'),
  OnBoardingModel(image: 'assets/images/onboarding3.png', title: 'All Set to Explore!',body: "You're ready to dive into a world of endless choices. Start shopping now and discover amazing products!"),
];

const String LocationBox = 'Location';
const String LoginBox = 'LoginData';

