import 'package:clinic_hub_patient_web/constants/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:responsive_builder/responsive_builder.dart';
import '../components/custom_button.dart';
import '../components/custom_textfield.dart';
import '../constants/app_images.dart';
import '../controllers/login_controller.dart';


class LoginScreen extends StatelessWidget {
  final LoginController controller = Get.put(LoginController());

  LoginScreen({super.key});

  bool isMobile(BuildContext context) {
    return MediaQuery.of(context).size.width < 600;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ScreenTypeLayout.builder(
        mobile: (context) => _buildMobileLayout(context),
        desktop: (context) => _buildDesktopLayout(context),
      ),
    );
  }

  Widget _buildDesktopLayout(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(loginImage),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        Expanded(
          child: Center(
            child: SingleChildScrollView(
              padding: EdgeInsets.all(32),
              child: _buildLoginForm(context, width: 400),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildMobileLayout(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 24),
          child: _buildLoginForm(context, width: double.infinity),
        ),
      ),
    );
  }

  Widget _buildLoginForm(BuildContext context, {required double width}) {
    return Container(
      width: width,
      padding: EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            blurRadius: 20,
            color: Colors.grey,
            offset: const Offset(0, 4),
          )
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Column(
              children: [
                Image.asset(
                  mainLogo,
                  width: isMobile(context) ? 100 : 120,
                  height: isMobile(context) ? 100 : 120,
                ),
                const SizedBox(height: 12),
                Text(
                  "Welcome Back",
                  style: TextStyle(
                    fontSize: isMobile(context) ? 22 : 28,
                    fontWeight: FontWeight.bold,
                    color: kBlackColor,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  "Patient Login",
                  style: TextStyle(
                    fontSize: isMobile(context) ? 16 : 20,
                    color: kPrimaryColor,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 30),

          // Phone Number
          Text(
            "Phone Number",
            style: TextStyle(
              fontSize: isMobile(context) ? 14 : 16,
              fontWeight: FontWeight.w600,
              color: kBlackColor,
            ),
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 14, vertical: 14),
                decoration: BoxDecoration(
                  color: const Color(0xFFF9F9F9),
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: klightGreyBorder),
                ),
                child: Text(
                  '+92',
                  style: TextStyle(
                    color: kBlackColor,
                    fontSize: isMobile(context) ? 18 : 14,
                  ),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: CustomTextField(
                  controller: controller.emailController,
                  focusNode: controller.emailFocusNode,
                  onSubmitted: () {
                    controller.passwordFocusNode.requestFocus();
                  },
                  hintText: "3#########",
                  keyboardType: TextInputType.phone,
                  onChanged: (value) => controller.validateEmail(),
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                    LengthLimitingTextInputFormatter(10),
                  ],
                ),
              ),
            ],
          ),
          Obx(() => controller.emailError?.value != ""
              ? Padding(
            padding: const EdgeInsets.only(top: 4),
            child: Text(
              controller.emailError!.value,
              style: TextStyle(
                color: kPrimaryColor,
                fontSize: isMobile(context) ? 12 : 14,
              ),
            ),
          )
              : const SizedBox.shrink()),

          const SizedBox(height: 20),

          // Password
          Text(
            "Password",
            style: TextStyle(
              fontSize: isMobile(context) ? 14 : 16,
              fontWeight: FontWeight.w600,
              color: kBlackColor,
            ),
          ),
          const SizedBox(height: 8),
          CustomTextField(
            isPassword: true,
            controller: controller.passwordController,
            focusNode: controller.passwordFocusNode,
            onSubmitted: () {
              controller.login();
            },
            hintText: "********",
            keyboardType: TextInputType.visiblePassword,
            onChanged: (value) => controller.validatePassword(),
            errorText: controller.passwordError,
          ),

          const SizedBox(height: 10),

          Align(
            alignment: Alignment.centerRight,
            child: GestureDetector(
              onTap: () {
                // Add forgot password navigation
              },
              child: Text(
                "Forgot Password?",
                style: TextStyle(
                  color: klightPrimaryColor,
                  fontSize: isMobile(context) ? 12 : 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),

          const SizedBox(height: 30),

          // Login Button
          CustomButton(
            isLoading: controller.isLoading,
            title: "Login",
            onTap: () {
              controller.login();
            },
          ),
        ],
      ),
    );
  }
}
