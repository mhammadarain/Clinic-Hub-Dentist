import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  // TextEditingControllers
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  // FocusNodes
  final FocusNode emailFocusNode = FocusNode();
  final FocusNode passwordFocusNode = FocusNode();

  // Validation error strings (Rx type)
  RxString? emailError = ''.obs;
  RxString? passwordError = ''.obs;

  var isLoading = false.obs;

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    emailFocusNode.dispose();
    passwordFocusNode.dispose();
    super.onClose();
  }

  void validateEmail() {
    if (emailController.text.isEmpty) {
      emailError?.value = 'Phone number is required';
    } else if (emailController.text.length != 10) {
      emailError?.value = 'Phone number must be 10 digits';
    } else {
      emailError?.value = '';
    }
  }

  void validatePassword() {
    if (passwordController.text.isEmpty) {
      passwordError?.value = 'Password is required';
    } else if (passwordController.text.length < 6) {
      passwordError?.value = 'Password must be at least 6 characters';
    } else {
      passwordError?.value = '';
    }
  }

  void login() {
    validateEmail();
    validatePassword();

    if (emailError?.value != '' || passwordError?.value != '') {
      // Some validation errors exist
      return;
    }

    isLoading.value = true;

    // Simulate a login delay
    Future.delayed(const Duration(seconds: 2), () {
      isLoading.value = false;

      // Success message
      Get.snackbar("Login Successful", "Welcome, +92${emailController.text}!");
    });
  }
}
