import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wayfit/core/utils/snack_bar.dart';

class AuthController extends GetxController {
  final agreeTerms = false.obs;
  void toggleAgree(bool? v) => agreeTerms.value = v ?? false;

  void openTerms() {
  }

  void openPrivacy() {
  }

  final confirmGymAuthority = false.obs;
  void toggleConfirmGymAuthority(bool? v) =>
      confirmGymAuthority.value = v ?? false;

  final submitInquiryFormKey = GlobalKey<FormState>();
  final fullNameCtrl = TextEditingController();
  final emailCtrl = TextEditingController();
  final companyCtrl = TextEditingController();
  final cityCtrl = TextEditingController();
  final phoneCtrl = TextEditingController();

  Future<void> submitInquiry() async {
    final ok = submitInquiryFormKey.currentState?.validate() ?? false;
    if (!ok) return;

    if (!agreeTerms.value) {
      CustomSnackBar.showError("Please accept Terms & Privacy to continue");
      return;
    }

    // TODO: call API here
    CustomSnackBar.showSuccess("Your inquiry has been submitted");
  }

  // ------------------ Gym form ------------------
  final gymFormKey = GlobalKey<FormState>();
  final gymNameCtrl = TextEditingController();
  final cityAreaCtrl = TextEditingController();
  final contactNameCtrl = TextEditingController();
  final gymEmailCtrl = TextEditingController();
  final gymPhoneCtrl = TextEditingController();
  final websiteCtrl = TextEditingController();

  Future<void> submitGymForm() async {
    final ok = gymFormKey.currentState?.validate() ?? false;
    if (!ok) return;

    if (!confirmGymAuthority.value) {
      CustomSnackBar.showError(
        "Please confirm you're authorized to submit",
      );
      return;
    }

    // TODO: call API here
    CustomSnackBar.showSuccess("Gym details submitted successfully");
  }

  // ------------------ Login popup ------------------
  final loginPopupKey = GlobalKey<FormState>();
  final loginEmailCtrl = TextEditingController();
  final loginPassCtrl = TextEditingController();

  bool popupHidePassword = true;
  bool popupLoading = false;

  void togglePopupPassword() {
    popupHidePassword = !popupHidePassword;
    update(['login_popup']);
  }

  Future<void> loginFromPopup() async {
    final ok = loginPopupKey.currentState?.validate() ?? false;
    if (!ok) return;

    popupLoading = true;
    update(['login_popup']);

    try {
      // TODO: call API here
      await Future.delayed(const Duration(milliseconds: 500));
      CustomSnackBar.showSuccess("Login successfully");
    } catch (e) {
      CustomSnackBar.showError("Login failed");
    } finally {
      popupLoading = false;
      update(['login_popup']);
    }
  }

  void clearPopupLogin() {
    loginEmailCtrl.clear();
    loginPassCtrl.clear();
    popupHidePassword = true;
    popupLoading = false;
    update(['login_popup']);
  }

  @override
  void onClose() {
    fullNameCtrl.dispose();
    emailCtrl.dispose();
    companyCtrl.dispose();
    cityCtrl.dispose();
    phoneCtrl.dispose();

    gymNameCtrl.dispose();
    cityAreaCtrl.dispose();
    contactNameCtrl.dispose();
    gymEmailCtrl.dispose();
    gymPhoneCtrl.dispose();
    websiteCtrl.dispose();

    loginEmailCtrl.dispose();
    loginPassCtrl.dispose();

    super.onClose();
  }
}