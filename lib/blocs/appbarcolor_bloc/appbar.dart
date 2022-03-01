import 'dart:math';

import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';

import '../../constants.dart';

part 'appbar_state.dart';

class Appbar extends Cubit<AppBarState> {
  Appbar() : super(AppBarState(color: Colors.blue));

  void changeAppColor() {
    var random = Random();
    var newColor = colors[random.nextInt(7)];
    emit(AppBarState(color: newColor));
  }
}
