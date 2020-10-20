import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';
import '../configs/configs.dart';
import '../models/models.dart';
import '../views/views.dart';
import '../widgets/widgets.dart';

class Pages extends StatefulWidget {
  const Pages();

  @override
  _PagesState createState() => _PagesState();
}

class _PagesState extends State<Pages> {
  final _controller = PageController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  // ==========================================================
  // We have Pages here
  // Make sure to add pages in this list.
  // It controls bottom navigation
  // ==========================================================
  List<PageModel> pages = [
    PageModel(Welcome(), MdiIcons.silverwareForkKnife),
    PageModel(Center(child: Text('ჯავშნების ისტორია')), Icons.history),
    PageModel(Center(child: Text('პროფილის გვერდი')), MdiIcons.account),
  ];

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        StreamProvider<List<Category>>(
            create: (_) => streamOfCategories(), initialData: []),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(fontFamily: 'Georgian'),
        home: Scaffold(
          body: _body(pages, _controller),
          bottomNavigationBar: _bottomNav(pages, _controller),
          backgroundColor: Palette.bg,
          extendBody: true,
        ),
      ),
    );
  }
}

// Bottom Navigation
Widget _bottomNav(List<PageModel> pages, PageController controller) {
  return FloatingBottomBar(
    controller: controller,
    items: [
      FloatingBottomBarItem(pages[0].icon, label: null),
      FloatingBottomBarItem(pages[1].icon, label: null),
      FloatingBottomBarItem(pages[2].icon, label: null),
    ],
    activeItemColor: Palette.accent,
    itemColor: Palette.fontGrey,
    enableIconRotation: true,
    onTap: (index) {
      // print('Tapped: item $index');
      controller.animateToPage(
        index,
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeOut,
      );
    },
  );
}

// Body
Widget _body(List<PageModel> pages, PageController controller) {
  return PageView(
    controller: controller,
    children: <Widget>[
      pages[0].widget,
      pages[1].widget,
      pages[2].widget,
    ],
  );
}

// Stream of categories
Stream<List<Category>> streamOfCategories() {
  var ref = FirebaseFirestore.instance.collection('categories');
  return ref.snapshots().map(
      (list) => list.docs.map((doc) => Category.fromFirestore(doc)).toList());
}
