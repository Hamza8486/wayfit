import 'package:flutter/material.dart';
class AppColors {
  static Color primary = const Color(0xFF6CFEB7);
  static Color primaryDark = const Color(0xFF00C9A7);
  static Color unselectColor = const Color(0xFF90A1B9);
  static Color searchBorderColor = const Color(0xFFE2E8F0);
  static Color lightBlackColor = const Color(0xFF0A0A0A);
  static Color textBlackColor = const Color(0xFF1D293D);
  static Color black62 = const Color(0xFF62748E);
  static Color black45 = const Color(0xFF45556C);
  static Color darkGrey = const Color(0xFF314158);
  static Color redFE = const Color(0xFFE7000B);
  static Color greyCA = const Color(0xFFCAD5E2);
  static Color greyF3 = const Color(0xFFF3F3F3);
  static Color greyDD = const Color(0xFFDDDDDD);
  static Color greyB8 = const Color(0xFFB8BCCA);
  static Color whiteColor = Colors.white;
  static Color blackColor = Colors.black;
  static Color borderLight = const Color.fromRGBO(43, 44, 48, 0.2);
  static Color lightGrey = Color(0xffF1F5F9);
  static Color black26 = Color(0x26000000);
  static Color black31 = Color(0xFF313131);
  static Color lightBlue = Color(0xffDBEAFE);
  static Color yellowFE = Color(0xffFEFBE9);
  static Color yellowFF = Color(0xffFFF085);
  static Color yellowFe = Color(0xffFEE685);
  static Color yellowE5 = Color(0xffE5DDC5);
  static Color purple82 = Color(0xff8200DB);
  static Color purpleF3 = Color(0xffF3E8FF);
  static Color whiteF1 = Color(0xffF1F5F9);
  static Color green00 = Color(0xff007A55);
  static Color greenD0 = Color(0xffD0FAE5);
  static Color greenA0 = Color(0xffA0CDB7);
  static Color green5E = Color(0xff5EE9B5);
  static Color addColor = Color(0xff6CFEB7);
  static Color usedColor = Color(0xffD7D0FC);
  static Color expireColor = Color(0xffFFF3D0);
  static Color yellow7B = Color(0xff7B3306);
  static Color gymBorderColor = Color(0xFFBEDBFF);
  static Color gymBackColor = Color(0xFF1E66FF);
  static Color green25 = Color(0xFF25C979);
  static Color green58 = Color(0xFF585863);
  static Color greenFF = Color(0xFFDEFFEF);
  static Color purpleEC = Color(0xFFECE8FF);
  static Color greenF8 = Color(0xFFF8E6FF);
  static Color green9F = Color(0xFF9FFFD0);
  static Color blueDF = Color(0xFFDFF3FF);
  static Color purple64 = Color(0xFF6455CC);
  static Color purpleDF = Color(0xFFDFDBFA);
  static Color purple98 = Color(0xFF9886EF);
  static Color purpleD8 = Color(0xFFD8D5E9);
  static Color purpleC9 = Color(0xFFC9C4E3);
  static Color greyD9 = Color(0xFFD9DFE5);
  static Color greyE5 = Color(0xFFE5E7EB);
  static Color grey6A = Color(0xFF6A7282);
  static Color green31 = Color(0xFF315252);
  static Color greyE8 = Color(0xFFE8EEF4);
  static Color greyF6 = Color(0xFFF3F5F6);
  static Color greyE9 = Color(0xFFDDE3E9);
  static Color greyFF = Color(0xFFF0F1F5);
  static Color purpleE9 = Color(0xFFE9E5FF);
  static Color greyCF = Color(0xFFCFD5DE);
  static Color classBorderColor = Color(0xFFE9D4FF);
  static Color classBackColor = Color(0xFFE9D4FF);
  static Color instBorderColor = Color(0xFFA4F4CF);
  static Color instBackColor = Color(0xFF00A36C);
  static Color greenCD = Color(0xFFCDFFE7);
  static Gradient mainBarGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      Color(0xFF47E6EB),
      Color(0xFF6CFEB7),
    ],
  );
  static Gradient selectedBarGradient = LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [
        Color(0xFF47E6EB),
        Color(0xFF6CFEB7),
      ],
      stops: [0.0, 1.0]
  );
  static Gradient classChipGradient = LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [
        Color(0xFFEFF6FF),
        Color(0xFFFAF5FF),
      ],
      stops: [0.0, 1.0]
  );
  static Gradient creditGradient = LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [
        Color(0xFFFEFCE8),
        Color(0xFFFFF085),
      ],
      stops: [0.0, 1.0]
  );
  static Gradient dntMissGradientText = LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [
        Color(0xFFFAF5FF),
        Color(0xFFFDF2F8),
      ],
      stops: [0.0, 1.0]
  );
  static Gradient bookButtonGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      Color(0xFF9810FA),
      Color(0xFFE60076),
    ],
  );
  static Gradient whiteGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      Color(0xFFF8FAFC),
      Color(0xFFFFFFFF),
    ],
  );
  static Gradient scheduleGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      Color(0xFF9810FA),
      Color(0xFF4F39F6),
    ],
  );
  static Gradient scheduleCreditGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      Color(0xFF9810FA),
      Color(0xFF7F22FE),
      Color(0xFF4F39F6),
    ],
  );
  static Gradient walletCreditGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      Color(0xFF009966),
      Color(0xFF009689),
      Color(0xFF00A63E),
    ],
  );
  static Gradient walletButtonGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      Color(0xFF009689),
      Color(0xFF009966),
    ],
  );
  static Gradient premiumGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      Color(0xFFFFFBEB),
      Color(0xFFFEFCE8),
    ],
  );
  static Gradient gymGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [Color(0xFFEFF6FF), Color(0xFFDBEAFE)],
  );
  static Gradient classGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [Color(0xFFFAF5FF), Color(0xFFF3E8FF)],
  );
  static Gradient instructorGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [Color(0xFFECFDF5), Color(0xFFD0FAE5)],
  );

  //
  static Gradient confirmBookCardGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [Color(0xFFC2B8F5), Color(0xFFE1DAFF)],
  );
  static Gradient capacityGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [Color(0xFFE1DAFF), Color(0xFFC2B8F5)],
  );
  static Gradient walletGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [Color(0xFF9B88F1), Color(0xFF585ACA)],
  );
  static Gradient walletMainBarGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [Color(0xFF191919), Color(0xFF113737)],
  );
  static Gradient checkInGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      const Color(0xFF191919),
      const Color(0xFF113737),
    ],
  );

}