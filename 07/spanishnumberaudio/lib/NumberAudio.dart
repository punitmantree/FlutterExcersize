import 'package:flutter/material.dart';

class NumberAudio {
  late String audioUri;
  late MaterialColor buttonColor;
  late String buttonText;

  NumberAudio(String audioUri, MaterialColor buttonColor, String buttonText) {
    this.audioUri = audioUri;
    this.buttonColor = buttonColor;
    this.buttonText = buttonText;
  }
}
