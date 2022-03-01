import 'package:bloc/bloc.dart';

part 'bottomNav_state.dart';


class BottomNav extends Cubit<BottomNavState>{
  BottomNav() : super(BottomNavState(current: 0));

  void changeTab(int newTab){
    emit(BottomNavState(current: newTab));
  }
}