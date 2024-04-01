import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:password_management/view/Authentication/widgets/widgets.dart';

import '../../animations/fade_in_slide.dart';
import '../../constants/colors.dart';
import '../../helper/doc_helper_function.dart';
import 'create_account_view.dart';
import 'login_view.dart';

class GetStartedView extends StatefulWidget {
  const GetStartedView({super.key});

  @override
  State<GetStartedView> createState() => _GetStartedViewState();
}

class _GetStartedViewState extends State<GetStartedView> {
  @override
  Widget build(BuildContext context) {
    final dark = DocHelperFunctions.isDarkMode(context);
    final theme = Theme.of(context);
    final size = MediaQuery.sizeOf(context);
    final isDark = MediaQuery.platformBrightnessOf(context) == Brightness.dark;
    final height = size.height;
    return Scaffold(
      body: SafeArea(
        minimum: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Spacer(),
            const FadeInSlide(
              duration: .4,
              child: Icon(
                Icons.dashboard_rounded,
                size: 60,
              ),
            ),
            const Spacer(),
            FadeInSlide(
              duration: .5,
              child: Text(
                "Let's Get Started!",
                style: theme.textTheme.headlineMedium!
                    .copyWith(fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: height * 0.015),
            const FadeInSlide(
              duration: .6,
              child: Text(
                "Let's dive in into your account",
                textAlign: TextAlign.center,
              ),
            ),
            const Spacer(),
            FadeInSlide(
              duration: .7,
              child: LoginButton(
                icon: Brand(Brands.google, size: 25),
                text: "Continue with Google",
                onPressed: () {},
              ),
            ),
            SizedBox(height: height * 0.02),
            FadeInSlide(
              duration: .8,
              child: LoginButton(
                icon: Icon(
                  Icons.apple,
                  color: isDark ? Colors.white : Colors.black,
                ),
                text: "Continue with Apple",
                onPressed: () {},
              ),
            ),
            SizedBox(height: height * 0.02),
            // FadeInSlide(
            //   duration: .9,
            //   child: LoginButton(
            //     icon: Brand(Brands.facebook, size: 25),
            //     text: "Continue with Facebook",
            //     onPressed: () {},
            //   ),
            // ),
            // SizedBox(height: height * 0.02),
            // FadeInSlide(
            //   duration: 1.0,
            //   child: LoginButton(
            //     icon: Brand(Brands.twitter, size: 25),
            //     text: "Continue with Twitter",
            //     onPressed: () {},
            //   ),
            // ),
            const Spacer(),
            FadeInSlide(
              duration: 1.1,
              child: FilledButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    CupertinoPageRoute(
                      builder: (context) => const SignInView(),
                    ),
                  );
                },
                style: FilledButton.styleFrom(
                  backgroundColor: TColors.primary,
                  fixedSize: const Size.fromHeight(50),
                ),
                child: const Text(
                  "Login",
                  style: TextStyle(fontWeight: FontWeight.w900),
                ),
              ),
            ),
            SizedBox(height: height * 0.02),
            FadeInSlide(
              duration: 1.2,
              child: FilledButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    CupertinoPageRoute(
                      builder: (context) => const SignUpView(),
                    ),
                  );
                },
                style: FilledButton.styleFrom(
                  fixedSize: const Size.fromHeight(50),
                  backgroundColor: dark ? TColors.light : TColors.dark,
                ),
                child: Text(
                  "Create Account",
                  style: TextStyle(
                    fontWeight: FontWeight.w900,
                    color: isDark ? Colors.white : TColors.borderPrimary,
                  ),
                ),
              ),
            ),
            const Spacer(),
            const FadeInSlide(
              duration: 1.0,
              direction: FadeSlideDirection.btt,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Privacy Policy"),
                  Text("   -   "),
                  Text("Terms of Service"),
                ],
              ),
            ),
            SizedBox(height: height * 0.02),
          ],
        ),
      ),
    );
  }
}
