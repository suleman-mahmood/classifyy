import 'package:auto_route/auto_route.dart';
import 'package:classifyy/presentation/config/app_router.dart';
import 'package:classifyy/presentation/config/utils.dart';
import 'package:classifyy/presentation/widgets/buttons/button_primary.dart';
import 'package:classifyy/presentation/widgets/typography/sub_title.dart';
import 'package:classifyy/presentation/widgets/typography/title_large.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

@RoutePage()
class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController pageController = PageController();
  bool finalPage = false;
  bool firstPage = true;

  @override
  void initState() {
    super.initState();
    pageController.addListener(() {
      setState(() {
        finalPage = (pageController.page ?? 0) == 2;
        firstPage = (pageController.page ?? 0) == 0;
      });
    });
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: RaabtaColors.background(),
      floatingActionButton: !finalPage
          ? FloatingActionButton(
              backgroundColor: RaabtaColors.primary(),
              child: Icon(
                Icons.arrow_forward,
                color: RaabtaColors.white(),
                size: 28,
              ),
              onPressed: () {
                pageController.nextPage(
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.easeInOut,
                );
              },
            )
          : null,
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SafeArea(
          child: Column(
            children: [
              Stack(
                children: [
                  if (!firstPage)
                    Align(
                      alignment: Alignment.centerLeft,
                      child: BackButton(
                        color: RaabtaColors.grey(),
                        onPressed: () {
                          pageController.previousPage(
                            duration: const Duration(milliseconds: 500),
                            curve: Curves.easeInOut,
                          );
                        },
                      ),
                    ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () {
                        context.router.replace(LoginRoute());
                      },
                      child: Text(
                        'Skip',
                        style: TextStyle(color: RaabtaColors.grey()),
                      ),
                    ),
                  ),
                ],
              ),
              Expanded(child: const SizedBox.shrink()),
              SizedBox(
                height: MediaQuery.of(context).size.height * 4 / 7,
                child: PageView(
                  controller: pageController,
                  children: [
                    OnboardingPage(
                      title: 'Your School Life, Streamlined',
                      description:
                          'Some long description that continues on and on makes we fully explain',
                      imagePath: 'assets/images/intro-1.png',
                    ),
                    OnboardingPage(
                      title: 'Plan Smarter,\nNot Harder!',
                      description:
                          'Some long description that continues on and on makes we fully explain',
                      imagePath: 'assets/images/intro-2.png',
                    ),
                    OnboardingPage(
                      title: 'Track Daily Attendance with Ease',
                      description:
                          'Some long description that continues on and on makes we fully explain',
                      imagePath: 'assets/images/intro-3.png',
                    ),
                  ],
                ),
              ),
              SmoothPageIndicator(
                controller: pageController,
                count: 3,
                effect: ExpandingDotsEffect(
                  expansionFactor: 2.5,
                  dotColor: RaabtaColors.grey(),
                  activeDotColor: RaabtaColors.primary(),
                ),
                onDotClicked: (index) {
                  pageController.animateToPage(
                    index,
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.easeIn,
                  );
                },
              ),
              Expanded(child: const SizedBox.shrink()),
              if (finalPage)
                ButtonPrimary(
                  buttonText: 'Get Started',
                  onPressed: () {
                    context.router.replace(LoginRoute());
                  },
                )
              else
                const SizedBox(height: 56)
            ],
          ),
        ),
      ),
    );
  }
}

class OnboardingPage extends StatelessWidget {
  final String title;
  final String description;
  final String imagePath;

  const OnboardingPage({
    super.key,
    required this.title,
    required this.description,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          imagePath,
          height: 300,
          width: 300,
        ),
        const SizedBox(height: ScreenSizes.slabFour),
        TitleLarge(
          title: title,
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: ScreenSizes.slabTwo),
        SubTitle(
          text: description,
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: ScreenSizes.slabFour),
      ],
    );
  }
}
