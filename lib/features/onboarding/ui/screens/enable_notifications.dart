import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              height: size.height * 0.5,
              width: double.infinity,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image: AssetImage('assets/enable.png'),
                ),
              ),
              child: Stack(
                children: [
                  Image.asset(
                    'assets/enable_notifications.png',
                    width: double.infinity,
                    height: double.infinity,
                    fit: BoxFit.fill,
                  ),
                  Positioned(
                    bottom: 320.h,
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
              padding: EdgeInsets.only(left: 24.w, top: 22.h),
              child: Text(
                'Notify latest offers & product\navailability',
                style: AppTextStyle.medium(
                  color: Colors.black,
                  fontSize: 18.sp,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                left: 24.w,
                right: 24.w,
                top: 8.h,
              ),
              child: Text(
                'Receive notifications about your orders, latest\noffers, products availability and much more.',
                style: AppTextStyle.regular(
                  color: const Color(0xFF999999),
                  fontSize: 13.sp,
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
                      inactiveTrackColor: const Color(0xFFF1F0F3),
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
                onPressed: () {},
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
