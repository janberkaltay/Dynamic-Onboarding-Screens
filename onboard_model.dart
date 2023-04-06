import 'package:endless_software/onboard/onboard_model.dart';
import 'package:flutter/material.dart';

class OnboardingModel {
  String img;
  String text;
  String desc;
  Color bg;
  Color button;

  OnboardingModel({
    required this.img,
    required this.text,
    required this.desc,
    required this.bg,
    required this.button,
});
}

List<OnboardingModel> screens = <OnboardingModel>[
OnboardingModel(
    img: 'assets/onboarding_screens/onboarding 1.png',
    text: 'Lorem ipsum dolor',
    desc: 'PAGE 1',
    bg: Colors.white,
    button: const Color(0xff7D87F5)
),
  OnboardingModel(
      img: 'assets/onboarding_screens/onboarding 2.png',
      text: 'Lorem ipsum dolor',
      desc: 'PAGE 2',
      bg: Colors.white,
      button: const Color(0xff7D87F5)
  ),
  OnboardingModel(
      img: 'assets/onboarding_screens/onboarding 3.png',
      text: 'Lorem ipsum dolor',
      desc: 'PAGE 3',
      bg: Colors.white,
      button: const Color(0xff7D87F5)
  ),
];
