import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shoppa/style/text_styles.dart';

import '../../../../style/color.dart';
import '../../models/onboarding_data.dart';
import 'enable_notifications.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final _pageController = PageController();
  int _currentPage = 0;
  static const Duration _duration = Duration(milliseconds: 700);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Scaffold(
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 24.w),
          height: double.infinity,
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(height: 20.h),
              InkWell(
                onTap: () {
                  // _pageController.animateToPage(
                  //   contents.length - 1,
                  //   duration: _duration,
                  //   curve: Curves.easeInOut,
                  // );
                },
                child: Text(
                  'Skip',
                  textAlign: TextAlign.end,
                  style: AppTextStyle.medium(
                    color: Colors.black,
                    fontSize: 14.sp,
                  ),
                ),
              ),
              SizedBox(height: 72.h),
              SizedBox(
                height: size.height * 0.6,
                child: PageView.builder(
                  onPageChanged: (value) {
                    setState(() {
                      _currentPage = value;
                    });
                  },
                  physics: const NeverScrollableScrollPhysics(),
                  controller: _pageController,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        Image.asset(contents[index].image),
                        SizedBox(height: 72.h),
                        Text(
                          contents[index].title,
                          textAlign: TextAlign.center,
                          style: AppTextStyle.medium(
                            color: Colors.black,
                            fontSize: 30.sp,
                          ),
                        ),
                        SizedBox(height: 16.h),
                        Text(
                          contents[index].desc,
                          textAlign: TextAlign.center,
                          style: AppTextStyle.regular(
                            color: const Color(0xFF999999),
                            fontSize: 13.sp,
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
              SizedBox(height: 60.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: List.generate(
                      contents.length,
                      (index) => buildDot(index),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      _currentPage + 1 == contents.length
                          ? Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    const EnableNotificationsScreen(),
                              ),
                              (route) => false)
                          : _pageController.nextPage(
                              duration: const Duration(milliseconds: 200),
                              curve: Curves.easeIn,
                            );
                    },
                    child: const CircleAvatar(
                      radius: 42,
                      backgroundColor: AppColors.primaryColor,
                      child: Icon(Icons.east, color: Colors.white),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  AnimatedContainer buildDot(int index) {
    return AnimatedContainer(
      duration: const Duration(
        milliseconds: 200,
      ),
      decoration: BoxDecoration(
          color: _currentPage == index
              ? AppColors.primaryColor
              : const Color(0xFF7B61FF).withOpacity(0.3),
          // shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(56.r)),
      margin: const EdgeInsets.only(right: 4),
      height: _currentPage == index ? 12 : 4.h,
      width: 5.w,
    );
  }
}
