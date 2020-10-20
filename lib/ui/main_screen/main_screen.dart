// imported packages
import 'package:flutter/material.dart';
// colors
import '../../core/configs/palette.dart';
// widgets
import 'shared/bottom_navigation.dart';
import 'main_screen_model.dart';

// ==============================
// This page contains several pages controled by
// shared bottom navigation bar below
// ==============================
class MainScreen extends StatefulWidget {
  const MainScreen();
  @override
  _MainScreenScreenState createState() => _MainScreenScreenState();
}

class _MainScreenScreenState extends State<MainScreen> {
  // controler for bottom navigation
  final _controller = PageController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      backgroundColor: Palette.bg,
      // Body
      body: PageView(
        controller: _controller,
        children: MainScreenModel.pages.map((page) => page.widget).toList(),
      ),
      // Bottom Navigation
      bottomNavigationBar: FloatingBottomBar(
        controller: _controller,
        activeItemColor: Palette.accent,
        itemColor: Palette.fontGrey,
        enableIconRotation: true,
        items: MainScreenModel.pages
            .map((page) => FloatingBottomBarItem(page.icon, label: null))
            .toList(),
        onTap: (index) {
          _controller.animateToPage(
            index,
            duration: const Duration(milliseconds: 400),
            curve: Curves.easeOut,
          );
        },
      ),
    );
  }
}
