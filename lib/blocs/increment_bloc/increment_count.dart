import 'package:bloc/bloc.dart';

part 'increment_state.dart';

class IncrementCount extends Cubit<IncrementState> {
  IncrementCount() : super(IncrementState(count: 0));

  void incrementCount() {
    emit(IncrementState(count: state.count + 1));
  }
}
