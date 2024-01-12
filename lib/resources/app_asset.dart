import 'package:flutter/material.dart';

class AppAsset {
  AppAsset._();

  static const _images = "resources/images";
  static const _icons = "resources/icons";

  static AssetImage loadImage(String name) {
    return AssetImage("$_images/$name");
  }

  static AssetImage loadIcon(String name) {
    return AssetImage("$_icons/$name");
  }

  // Images
  // Welcome
  static AssetImage get imgGetStarted => AssetImage("$_images/get_started.png");
  // Introduction
  static AssetImage get imgIntroOne => AssetImage("$_images/intro_one.png");
  static AssetImage get imgIntroTwo => AssetImage("$_images/intro_two.png");
  static AssetImage get imgIntroThree => AssetImage("$_images/intro_three.png");

  // Social
  static AssetImage get icApple => AssetImage("$_icons/ic_social_apple.png");
  static AssetImage get icGoogle => AssetImage("$_icons/ic_social_google.png");
  static AssetImage get icFacebook => AssetImage("$_icons/ic_social_facebook.png");

  // Tab
  static String get icTabHome => "$_icons/ic_tab_home.svg";
  static String get icTabDiscover => "$_icons/ic_tab_discover.svg";
  static String get icTabCart => "$_icons/ic_tab_cart.svg";
  static String get icTabProfile => "$_icons/ic_tab_profile.svg";

  // Chevron
  static String get icChevronLeft => "$_icons/ic_chevron_left.svg";

  // Eye
  static String get icEyeOpen => "$_icons/ic_eye_open.svg";
  static String get icEyeClose => "$_icons/ic_eye_close.svg";

  // Icons
  static String get iconPasswordChangeSuccess => "$_icons/ic_password_change_success.svg";
}