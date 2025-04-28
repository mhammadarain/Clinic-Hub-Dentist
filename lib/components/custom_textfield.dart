import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../constants/app_color.dart';

class CustomTextField extends StatefulWidget {
  final TextEditingController controller;
  final String hintText;
  final TextInputType? keyboardType;
  final Function(String)? onChanged;
  final RxString? errorText;
  final bool isPassword;
  final bool isEnabled;
  final List<TextInputFormatter>? inputFormatters;
  final FocusNode? focusNode;
  final Function()? onSubmitted;

  const CustomTextField({
    Key? key,
    required this.controller,
    required this.hintText,
    this.keyboardType,
    this.onChanged,
    this.errorText,
    this.isEnabled = true,
    this.isPassword = false,
    this.inputFormatters,
    this.focusNode,
    this.onSubmitted,
  }) : super(key: key);

  @override
  _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          height: 70,
          child: Center(
            child: TextField(
              focusNode: widget.focusNode,
              onSubmitted: (value) {
                widget.onSubmitted?.call();
              },
              readOnly: !widget.isEnabled,
              keyboardType: widget.keyboardType,
              cursorColor: klightPrimaryColor,
              controller: widget.controller,
              inputFormatters: widget.inputFormatters,
              onChanged: widget.onChanged,
              obscureText: widget.isPassword ? _obscureText : false,
              decoration: InputDecoration(
                fillColor: !widget.isEnabled
                    ? klightGreyColor.withOpacity(0.2)
                    : const Color(0xFFF9F9F9),
                filled: true,
                hintText: widget.hintText,
                hintStyle: TextStyle(
                  color: klightGreyColor.withOpacity(0.5),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: klightGreyBorder),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(
                      color: widget.isEnabled
                          ? klightPrimaryColor
                          : klightGreyBorder),
                ),
                suffixIcon: widget.isPassword
                    ? IconButton(
                  icon: Icon(
                    _obscureText
                        ? Icons.visibility
                        : Icons.visibility_off,
                    color: klightGreyColor,
                  ),
                  onPressed: () {
                    setState(() {
                      _obscureText = !_obscureText;
                    });
                  },
                )
                    : null,
              ),
            ),
          ),
        ),
        if (widget.errorText != null)
          Obx(
                () => widget.errorText?.value != ""
                ? Padding(
              padding: EdgeInsets.only(top: 5),
              child: Text(
                widget.errorText!.value,
                style: TextStyle(
                  color: kPrimaryColor,
                  fontSize: 12,
                ),
              ),
            )
                : const SizedBox.shrink(),
          )
      ],
    );
  }
}
