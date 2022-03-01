import 'dart:math';
import 'package:bloc_pattern/constants.dart';
import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';

part 'background_state.dart';

class Backgrounds extends Cubit<BackgroundState> {
  Backgrounds() : super(BackgroundState(color: Colors.white));

  void changeColor() {
    var random = Random();
    var newColor = colors[random.nextInt(7)];
    emit(BackgroundState(color: newColor));
  }
}
