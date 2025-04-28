import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../constants/app_color.dart';

class CustomButton extends StatelessWidget {
  final RxBool isLoading;
  final String title;
  final VoidCallback onTap;
  final double? width;
  final double? height;

  const CustomButton({
    Key? key,
    required this.isLoading,
    required this.title,
    required this.onTap,
    this.width,
    this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
          () => GestureDetector(
        onTap: onTap,
        child: Container(
          // margin: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
          height: height ?? 40,
          width: 500,
          decoration: BoxDecoration(
            color: kPrimaryColor,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Center(
            child: isLoading.value
                ? const CircularProgressIndicator(
              color: kWhiteColor,
            )
                : Text(
              title,
              style: TextStyle(
                color: kWhiteColor,
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }
}
