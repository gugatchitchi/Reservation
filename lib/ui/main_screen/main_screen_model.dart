import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import 'pages/welcome.dart';

class MainScreenModel {
  // ==========================================================
  // We have Pages here
  // Make sure to add pages in this list.
  // It controls bottom navigation
  // ==========================================================
  static List<_PageModel> pages = [
    _PageModel(Welcome(), MdiIcons.silverwareForkKnife),
    _PageModel(Center(child: Text('ჯავშნების ისტორია')), Icons.history),
    _PageModel(Center(child: Text('პროფილის გვერდი')), MdiIcons.account),
  ];
}

class _PageModel {
  final Widget widget;
  final IconData icon;

  _PageModel(this.widget, this.icon);
}
