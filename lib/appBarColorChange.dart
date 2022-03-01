
import 'package:bloc_pattern/blocs/appbarcolor_bloc/appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppbarColor extends StatelessWidget {
  const AppbarColor({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<Appbar, AppBarState>(
      builder: (context, state) {
        return Center(
            child: TextButton(
          child: const Text('Change the appbar color'),
          onPressed: () {
            BlocProvider.of<Appbar>(context).changeAppColor();
          },
        ));
      },
    );
  }
}
