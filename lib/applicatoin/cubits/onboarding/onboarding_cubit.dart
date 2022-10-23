import 'package:bloc/bloc.dart';

part 'onboarding_state.dart';

class OnboardingCubit extends Cubit<OnboardingState> {
  OnboardingCubit() : super(const OnboardingState(index: 0));

  void getCurrentIndex({required int currentIndex}) {
    emit(OnboardingState(index: currentIndex));
  }
}
