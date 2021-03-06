// imported packages
import 'package:code/core/models/restaurant_category.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
// colors
import '../../../core/configs/palette.dart';
// widgets
import '../shared/header.dart';
import '../shared/default_sliver_with_padding.dart';

// =======================================
// This is the first of three pages of main screen
// =======================================
class WelcomePage extends StatelessWidget {
  const WelcomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final categories = Provider.of<List<RestaurantCategory>>(context);

    return CustomScrollView(
      slivers: [
        // Big Header
        DefaultSliverWithPadding(
          top: 60.0,
          sliver: _pageHeader(),
        ),

        // Categories Section
        // Header
        DefaultSliverWithPadding(
          top: 60.0,
          sliver: SliverToBoxAdapter(
            child: Header(
              blackPart: 'რესტორნის',
              coloredPart: 'კატეგორიები',
            ),
          ),
        ),
        // Grid of categories
        DefaultSliverWithPadding(
          top: 0.0,
          sliver: _categories(categories),
        ),
      ],
    );
  }
}

// ===============================================
// helper local geters to simplify code above
// ===============================================

// Big Header
Widget _pageHeader() {
  return SliverToBoxAdapter(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RichText(
          text: TextSpan(
            children: <TextSpan>[
              TextSpan(
                text: 'სალამი, ',
                style: TextStyle(
                  fontFamily: 'Georgian',
                  fontWeight: FontWeight.w800,
                  color: Palette.accent,
                  fontSize: 22.0,
                ),
              ),
              TextSpan(
                text: 'გუგა',
                style: TextStyle(
                  fontFamily: 'Georgian',
                  fontSize: 22.0,
                  color: Palette.fontDark,
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 10.0,
        ),
        Text(
          'აირჩიე სასურველი რესტორანი და\nდაჯავშნე ერთი კლიკით',
          style: TextStyle(
            // fontFamily: 'Georgian',
            fontSize: 14.0,
            color: Palette.fontGrey,
            height: 1.5,
          ),
        ),
      ],
    ),
  );
}

// Categories grid
Widget _categories(List<RestaurantCategory> categories) {
  return SliverGrid(
    gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
      maxCrossAxisExtent: 150.0,
      mainAxisSpacing: 10.0,
      crossAxisSpacing: 10.0,
    ),
    delegate: SliverChildBuilderDelegate(
      (BuildContext context, int index) {
        return _categoryItem(categories[index].img, categories[index].name,
            categories[index].color);
      },
      childCount: categories.length,
    ),
  );
}

// single item in categories grid
Widget _categoryItem(String img, String name, Color color) {
  return Container(
    height: 110.0,
    width: 100,
    decoration: BoxDecoration(
      color: color,
      borderRadius: BorderRadius.circular(20.0),
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(height: 10.0),
        Container(
          height: 40.0,
          width: 40.0,
          padding: const EdgeInsets.all(5.0),
          decoration: BoxDecoration(
            color: Palette.bg,
            borderRadius: BorderRadius.circular(30.0),
          ),
          child: Image.network(
            img,
          ),
        ),
        SizedBox(
          height: 10.0,
        ),
        Text(
          name,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Palette.fontLight,
            fontSize: 14.0,
          ),
        ),
      ],
    ),
  );
}
