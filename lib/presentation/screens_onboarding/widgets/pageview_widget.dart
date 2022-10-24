import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../applicatoin/controller/controllers.dart';
import '../../../applicatoin/cubits/onboarding/onboarding_cubit.dart';
import '../../core/models/models.dart';

class PageViewWidget extends StatelessWidget {
  const PageViewWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: onboardController,
      itemCount: tabs.length,
      itemBuilder: (context, index) => Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
        ),
        child: tabs[index],
      ),
      onPageChanged: (index) {
        BlocProvider.of<OnboardingCubit>(context)
            .getCurrentIndex(currentIndex: index);
      },
    );
  }
}
