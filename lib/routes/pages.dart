import 'package:get/get.dart';
import 'package:wayfit/features/authentication/auth_binding.dart';
import 'package:wayfit/features/authentication/pages/gym_form.dart';
import 'package:wayfit/features/authentication/pages/landing_view.dart';
import 'package:wayfit/features/authentication/pages/submit_inquiry.dart';
import 'package:wayfit/features/main_nav/main_nav_binding.dart';
import 'package:wayfit/features/main_nav/main_nav_view.dart';
import 'package:wayfit/features/splash/splash_binding.dart';

import '../features/splash/splash_view.dart';

class AppRoutes {
  static const splash = '/splash';
  static const landing = '/landing';
  static const submitInquiry = '/submitInquiry';
  static const gymForm = '/gymForm';
  static const mainNav = '/mainNav';
  static final pages = [
    GetPage(name: splash, page: () => SplashView(), binding: SplashBinding()),
    GetPage(name: landing, page: () => LandingView(), binding: AuthBinding()),
    GetPage(
      name: submitInquiry,
      page: () => SubmitInquiryView(),
      binding: AuthBinding(),
    ),
    GetPage(name: gymForm, page: () => GymFormView(), binding: AuthBinding()),
    GetPage(
      name: mainNav,
      page: () => MainNavView(),
      binding: MainNavBinding(),
    ),
  ];
}