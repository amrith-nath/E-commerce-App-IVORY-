import 'package:bloc/bloc.dart';

part 'bottom_navigation_state.dart';

class BottomNavigationCubit extends Cubit<BottomNavigationState> {
  BottomNavigationCubit() : super(BottomNavigationState(index: 0));

  void getCurrentIndex({required int currentIndex}) {
    emit(BottomNavigationState(index: currentIndex));
  }
}
