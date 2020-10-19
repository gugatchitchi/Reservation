import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/models.dart';
import '../configs/configs.dart';
import '../widgets/widgets.dart';

class Welcome extends StatelessWidget {
  const Welcome({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final categories = Provider.of<List<Category>>(context);

    return CustomScrollView(
      slivers: [
        // Page Big Header
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

// Page Big Header
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
Widget _categories(List<Category> categories) {
  return SliverToBoxAdapter(
    child: Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _categoryItem('assets/icons/asian.png', categories[0].name),
            SizedBox(width: 10.0),
            _categoryItem('assets/icons/asian.png', categories[1].name),
            SizedBox(width: 10.0),
            _categoryItem('assets/icons/asian.png', categories[2].name),
          ],
        ),
        // SizedBox(height: 10.0),
        // Row(
        //   mainAxisAlignment: MainAxisAlignment.center,
        //   children: [
        //     _categoryItem('assets/icons/asian.png', 'აზიური'),
        //     SizedBox(width: 10.0),
        //     _categoryItem('assets/icons/asian.png', 'აზიური'),
        //     SizedBox(width: 10.0),
        //     _categoryItem('assets/icons/asian.png', 'აზიური'),
        //   ],
        // ),
        // SizedBox(height: 10.0),
        // Row(
        //   mainAxisAlignment: MainAxisAlignment.center,
        //   children: [
        //     _categoryItem('assets/icons/asian.png', 'აზიური'),
        //     SizedBox(width: 10.0),
        //     _categoryItem('assets/icons/asian.png', 'აზიური'),
        //     SizedBox(width: 10.0),
        //     _categoryItem('assets/icons/asian.png', 'აზიური'),
        //   ],
        // ),
      ],
    ),
  );
}

// single item in categories grid
Widget _categoryItem(String img, String name) {
  return Container(
    height: 110.0,
    width: 100,
    decoration: BoxDecoration(
      color: Palette.accent,
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
          child: Image(
            image: AssetImage(img),
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
            fontSize: 10.0,
          ),
        ),
      ],
    ),
  );
}
