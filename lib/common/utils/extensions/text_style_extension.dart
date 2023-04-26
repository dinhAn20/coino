import 'package:flutter/material.dart';
import 'package:trading_app/common/theme/colors.dart';

extension TextStyleX on TextStyle {
  TextStyle get w600 {
    return copyWith(fontWeight: FontWeight.w600);
  }

  TextStyle get w500 {
    return copyWith(fontWeight: FontWeight.w500);
  }

  TextStyle get w400 {
    return copyWith(fontWeight: FontWeight.w400);
  }

  TextStyle get w300 {
    return copyWith(fontWeight: FontWeight.w300);
  }

  TextStyle get bold {
    return copyWith(fontWeight: FontWeight.bold);
  }

  TextStyle get white {
    return copyWith(color: kWhiteColor);
  }

  TextStyle get primary {
    return copyWith(color: kPrimaryColor);
  }

  TextStyle get gray500 {
    return copyWith(color: kGray500);
  }
  TextStyle get gray700 {
    return copyWith(color: kGray700);
  }
}
