import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shoppa/features/onboarding/ui/screens/select_preferred_language.dart';
import 'package:shoppa/style/text_styles.dart';

import '../../../../style/color.dart';

class EnableNotificationsScreen extends StatefulWidget {
  const EnableNotificationsScreen({Key? key}) : super(key: key);

  @override
  State<EnableNotificationsScreen> createState() =>
      _EnableNotificationsScreenState();
}

class _EnableNotificationsScreenState extends State<EnableNotificationsScreen> {
  bool value = false;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: SingleChildScrollView(
        padding: EdgeInsets.only(bottom: 40.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              height: size.height * 0.458,
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Color(0xFFFC6371),
              ),
              child: Stack(
                children: [
                  Image.asset(
                    'assets/enable_notifications.png',
                    width: double.infinity,
                    height: double.infinity,
                    fit: BoxFit.cover,
                  ),
                  Positioned(
                    bottom: 300.h,
                    right: 24.w,
                    child: Text(
                      'Skip',
                      style: AppTextStyle.medium(
                        color: Colors.white,
                        fontSize: 14.sp,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 32.w, top: 22.h),
              child: Text(
                'Notify latest offers & product\navailability',
                style: AppTextStyle.medium(
                  color: Colors.black,
                  fontSize: 18.sp,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 32.w, top: 8.h),
              child: Text(
                'Receive notifications about your orders, latest\noffers, products availability and much more.',
                style: AppTextStyle.regular(
                  color: const Color(0xFF999999),
                  fontSize: 14.sp,
                ),
              ),
            ),
            SizedBox(height: 110.h),
            Container(
              margin: EdgeInsets.only(left: 24.w, right: 24.w),
              padding: EdgeInsets.all(24.r),
              decoration: BoxDecoration(
                color: const Color(0xFFF8F8F9),
                borderRadius: BorderRadius.circular(12.r),
              ),
              child: Row(
                children: [
                  const Icon(Icons.notifications_outlined),
                  SizedBox(width: 10.w),
                  Text(
                    'Notifications',
                    style: AppTextStyle.medium(
                      color: Colors.black,
                      fontSize: 14.sp,
                    ),
                  ),
                  const Spacer(),
                  SizedBox(
                    height: 12.h,
                    child: Switch.adaptive(
                      activeColor: AppColors.primaryColor,
                      value: value,
                      onChanged: (val) {
                        setState(() {
                          value = val;
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 48.h),
            Padding(
              padding: EdgeInsets.only(left: 24.w, right: 24.w),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          const SelectPreferredLanguageScreen(),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primaryColor,
                  fixedSize: Size(double.infinity, 56.h),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                ),
                child: Text(
                  'Next',
                  style: AppTextStyle.medium(
                    fontSize: 14.sp,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
