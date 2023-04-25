import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:trading_app/common/constants/images.dart';
import 'package:trading_app/generated/l10n.dart';
import 'package:trading_app/widgets/cached_image.dart';

import '../../../common/theme/colors.dart';
import '../../../widgets/button.dart';

class OnboaringScreen extends StatelessWidget {
  const OnboaringScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Body(),
    );
  }
}

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  int currentPage = 0;
  List<Map<String, String>> onboardingData = [
    {
      "title": "Welcome to Coino 👋 ",
      "subTitle":
          "The best app to invest in various crypto stocks in the world today!",
      "image": kOnboarding1Image
    },
    {
      "title": "Get Better Returns 🚀",
      "subTitle":
          "Invest in the biggest crypto market & unlock amazing returns of invesment.",
      "image": kOnboarding2Image
    },
    {
      "title": "Start with Just \$1.00 💰",
      "subTitle":
          "You don’t have to buy a whole share, you can buy a fraction.",
      "image": kOnboarding3Image
    },
    {
      "title": "Your Safety is First 🛡",
      "subTitle":
          "Your brokerage account is maintained by Trade Station Brokers LLC.",
      "image": kOnboarding4Image
    },
    {
      "title": "No Commissions ⚡️",
      "subTitle":
          "No commissions ever, just invest for free and maximize your returns.",
      "image": kOnboarding5Image
    },
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Column(
          children: <Widget>[
            Expanded(
              child: PageView.builder(
                onPageChanged: (value) {
                  setState(() {
                    currentPage = value;
                  });
                },
                itemCount: onboardingData.length,
                itemBuilder: (context, index) => SplashContent(
                  index: index,
                  image: onboardingData[index]["image"] ?? "",
                  title: onboardingData[index]["title"] ?? "",
                  subTitle: onboardingData[index]["subTitle"] ?? "",
                ),
              ),
            ),
            Flexible(
              flex: 0,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  children: [
                    Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(
                          onboardingData.length,
                          (index) => buildDot(index: index),
                        ),
                      ),
                    ),
                    const SizedBox(height: 24),
                    BasicButton(
                        icon: const CachedImage(
                          url: kGoogleIcon,
                          width: 24,
                          height: 24,
                        ),
                        padding: const EdgeInsets.symmetric(vertical: 18),
                        backgroundColor: Colors.transparent,
                        border: Border.all(color: kGray200),
                        radius: 100,
                        width: double.infinity,
                        textStyle: Theme.of(context)
                            .textTheme
                            .bodyLarge
                            ?.copyWith(fontWeight: FontWeight.w600),
                        label: "Continue with Google"),
                    const SizedBox(height: 16),
                    BasicButton(
                        padding: const EdgeInsets.symmetric(vertical: 18),
                        backgroundColor: kPrimaryColor,
                        radius: 100,
                        width: double.infinity,
                        textStyle: Theme.of(context)
                            .textTheme
                            .bodyLarge
                            ?.copyWith(
                                color: kWhiteColor,
                                fontWeight: FontWeight.w600),
                        label: S.of(context).signUp),
                    const SizedBox(height: 16),
                    BasicButton(
                        padding: const EdgeInsets.symmetric(vertical: 18),
                        backgroundColor: kPrimary100Color,
                        radius: 100,
                        width: double.infinity,
                        textStyle: Theme.of(context)
                            .textTheme
                            .bodyLarge
                            ?.copyWith(
                                fontWeight: FontWeight.w600,
                                color: kPrimaryColor),
                        label: "Sign In"),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 36)
          ],
        ),
      ),
    );
  }

  AnimatedContainer buildDot({int? index}) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      margin: const EdgeInsets.only(right: 5),
      height: 6,
      width: currentPage == index ? 24 : 6,
      decoration: BoxDecoration(
        color: currentPage == index ? kPrimaryColor : kDark3,
        borderRadius: BorderRadius.circular(3),
      ),
    );
  }
}

class SplashContent extends StatelessWidget {
  const SplashContent({
    Key? key,
    required this.title,
    required this.subTitle,
    required this.image,
    required this.index,
  }) : super(key: key);
  final String title, subTitle, image;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(
          flex: 4,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: index == 0 ? 0 : 24.0),
            child: CachedImage(url: image),
          ),
        ),
        const SizedBox(height: 24),
        Expanded(
          flex: 1,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                index == 0
                    ? AutoSizeText.rich(
                        TextSpan(children: [
                          const TextSpan(text: "Welcome to"),
                          TextSpan(
                            text: " Coino 👋 ",
                            style: Theme.of(context)
                                .textTheme
                                .displaySmall
                                ?.copyWith(color: kPrimaryColor),
                          ),
                        ]),
                        maxFontSize: 32,
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.displaySmall,
                      )
                    : AutoSizeText(
                        title,
                        maxFontSize: 32,
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.displaySmall,
                      ),
                const SizedBox(height: 8),
                Text(
                  subTitle,
                  textAlign: TextAlign.center,
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium
                      ?.copyWith(fontWeight: FontWeight.w500),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
