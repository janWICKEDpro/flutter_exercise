import 'package:bloc_pattern/blocs/increment_bloc/increment_count.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Increment extends StatelessWidget {
  const Increment({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Center(
      child: Column(children: [
          BlocBuilder<IncrementCount, IncrementState>(
            builder: (context, state) {
              return Padding(
                padding: const EdgeInsets.only(top:28.0),
                child: Text('Counter Value: ${state.count}'),
              );
            },
          ),
          Expanded(child: Container()),
          Padding(
            padding: const EdgeInsets.only(bottom:48.0),
            child: FloatingActionButton(
              onPressed: () {
                 BlocProvider.of<IncrementCount>(context).incrementCount();
               // context.bloc<IncrementCount>().incrementCount();
              },
              child: const Icon(Icons.add),
            ),
          )
        ]  ),
    );
  }
}
