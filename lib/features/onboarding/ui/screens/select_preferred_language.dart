import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shoppa/style/text_styles.dart';

import '../../../../style/color.dart';

class SelectPreferredLanguageScreen extends StatefulWidget {
  const SelectPreferredLanguageScreen({Key? key}) : super(key: key);

  @override
  State<SelectPreferredLanguageScreen> createState() =>
      _SelectPreferredLanguageScreenState();
}

class _SelectPreferredLanguageScreenState
    extends State<SelectPreferredLanguageScreen> {
  ValueNotifier<bool> checkValue = ValueNotifier(false);
  int selectedLanguageIndex = 0;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Scaffold(
      body: SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
        padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 67.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: 41.h),
            Text(
              'Select your preferred language',
              style: AppTextStyle.medium(
                fontSize: 18.sp,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 8.h),
            Text(
              'You will use the same language throughout\nthe app.',
              style: AppTextStyle.regular(
                fontSize: 14.sp,
                color: const Color(0xFF999999),
              ),
            ),
            SizedBox(height: 72.h),
            languageWidget('English', 'assets/english.svg', 0),
            SizedBox(height: 8.h),
            languageWidget('Français', 'assets/french.svg', 1),
            SizedBox(height: size.height * 0.4),
            ElevatedButton(
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
          ],
        ),
      ),
    );
  }

  Widget languageWidget(
    String title,
    String assetUrl,
    int index,
  ) {
    return InkWell(
      onTap: () {
        setState(() {
          // checkValue.value = !checkValue.value;
          selectedLanguageIndex = index;
        });
      },
      child: Container(
        padding: EdgeInsets.all(16.r),
        decoration: BoxDecoration(
          color: selectedLanguageIndex == index
              ? AppColors.primaryColor
              : Colors.white,
          borderRadius: BorderRadius.circular(12.r),
          border: Border.all(
            width: 1.5,
            color: selectedLanguageIndex == index
                ? AppColors.primaryColor
                : const Color(0xFFF1F0F3),
          ),
        ),
        child: Row(
          children: [
            SvgPicture.asset(assetUrl),
            SizedBox(width: 8.h),
            Text(
              title,
              style: AppTextStyle.medium(
                fontSize: 14.sp,
                color: selectedLanguageIndex == index
                    ? Colors.white
                    : Colors.black,
              ),
            ),
            const Spacer(),
            // SizedBox(
            //   height: 10.h,
            //   width: 20.w,
            //   child: Checkbox(
            //     value: value,
            //     shape: const CircleBorder(),
            //     onChanged: (val) {
            //       setState(() {
            //         value = val!;
            //       });
            //     },
            //   ),
            // ),
            selectedLanguageIndex == index
                ? const Icon(
                    Icons.check_circle,
                    color: Colors.white,
                  )
                : const Offstage(),
          ],
        ),
      ),
    );
  }
}
