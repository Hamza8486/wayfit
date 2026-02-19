
import 'package:flutter/material.dart';
class AppSpacing {
  AppSpacing._(); // no instance
  static const double horizontal = 24;
  static const double vertical = 20;
  static const double topLandingHeight = 315.0;
  static const double topSubmitInquiry = 164.0;
  static const double textFieldHeight = 18.0;
  static const double xs = 4;
  static const double sm = 8;
  static const double md = 16;
  static const double lg = 24;
  static const double xl = 32;
  /// Common EdgeInsets
  static const EdgeInsets screenPadding =
  EdgeInsets.symmetric(horizontal: horizontal);
  static const EdgeInsets cardPadding =
  EdgeInsets.all(md);
  static const EdgeInsets sectionPadding =
  EdgeInsets.fromLTRB(horizontal, md, horizontal, md);

  }