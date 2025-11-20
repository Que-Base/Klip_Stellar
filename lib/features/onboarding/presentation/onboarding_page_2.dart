import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:klip/shared/style/text_style.dart';

class OnboardingPage2 extends StatelessWidget {
  const OnboardingPage2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            left: 15.w,
            bottom: .15.sh,
            child: SizedBox(
              width: 217.w,
              child: Column(
                spacing: 22,
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Save", style: AppTextStyle.b40),
                  Text(
                    "Spend smarter. Save effortlessly.",
                    style: AppTextStyle.r16,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
