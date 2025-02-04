import 'package:core_di_provider/di_provider.dart';
import 'package:core_foundation/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:melos_template/core/foundation/constant/e2e_key.dart';
import 'package:melos_template/core/router/data/app_route_data.dart';

class IntroductionPage extends ConsumerWidget {
  const IntroductionPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final sharedPreferences = ref.read(sharedPreferencesWithCacheProvider);
      const key = AppSharedPreferenceKey.appIsIntroDoneKey;
      sharedPreferences.setBool(key.name, true);
    });

    return Scaffold(
      body: IntroductionScreen(
        pages: [
          PageViewModel(
            title: 'Welcome to melos template!',
            body: 'Page1',
            image: Image.asset(
              'assets/images/introduction/aisome_company_color.png',
              height: 150,
              width: 150,
            ),
          ),
          PageViewModel(
            title: "Let's use this application as a reference!",
            body: 'Page2',
            image: Image.asset(
              'assets/images/introduction/operation_smartphone_simple.png',
              height: 150,
              width: 150,
            ),
          ),
        ],
        onDone: () async {
          const HomePageData().go(context);
        },
        showBackButton: true,
        next: Icon(
          Icons.arrow_forward_ios,
          key: Key(E2eKey.introNextKey.name),
        ),
        back: const Icon(Icons.arrow_back_ios),
        done: Text(
          'OK!',
          style: const TextStyle(fontWeight: FontWeight.w600),
          key: Key(E2eKey.introDoneKey.name),
        ),
        dotsDecorator: DotsDecorator(
          size: const Size.square(10),
          activeSize: const Size(20, 10),
          activeColor: Colors.blue,
          color: Colors.black26,
          spacing: const EdgeInsets.symmetric(horizontal: 3),
          activeShape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25),
          ),
        ),
      ),
    );
  }
}
