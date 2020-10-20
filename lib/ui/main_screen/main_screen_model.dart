// imported packages
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
// pages
import 'pages/welcome_page.dart';
import 'pages/order_history_page.dart';
import 'pages/profile_page.dart';

class MainScreenModel {
  // ==========================================================
  // We have Pages here
  // Make sure to add pages in this list.
  // It controls bottom navigation
  // ==========================================================
  static List<_PageModel> pages = [
    _PageModel(WelcomePage(), MdiIcons.silverwareForkKnife),
    _PageModel(OrderHistoryPage(), Icons.history),
    _PageModel(ProfilePage(), MdiIcons.account),
  ];
}

class _PageModel {
  final Widget widget;
  final IconData icon;

  _PageModel(this.widget, this.icon);
}
