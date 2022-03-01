import 'package:bloc_pattern/blocs/backgroundcolor_bloc/background.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Background extends StatelessWidget {
  const Background({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<Backgrounds, BackgroundState>(
      builder: (context, state) {
        return Container(
          color: state.color,
          child: Center(
            child: ElevatedButton(
              onPressed: () {
                BlocProvider.of<Backgrounds>(context).changeColor();
              },
              child: const Text('Press to change Color'),
            ),
          ),
        );
      },
    );
  }
}
