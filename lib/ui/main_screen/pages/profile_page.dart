// imported packages
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
// colors
import '../../../core/configs/palette.dart';
// shared widgets
import '../shared/default_sliver_with_padding.dart';
import '../shared/Header.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final _nameFormKey = GlobalKey<FormState>();
  final _numberFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        // header
        DefaultSliverWithPadding(
          top: 30.0,
          sliver: SliverToBoxAdapter(child: _header),
        ),
        // name input
        DefaultSliverWithPadding(
          top: 30.0,
          sliver: SliverToBoxAdapter(
              child: _input('სახელი', 'შენი სახელი', () => null, _nameFormKey)),
        ),
      ],
    );
  }
}

// ================================
// helper geters to simplify code above
// ================================
// header
get _header {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Header(
        blackPart: 'შენი',
        coloredPart: 'პროფილი',
      ),
      Icon(
        MdiIcons.account,
        color: Palette.accent,
        size: 50.0,
      ),
    ],
  );
}

// input
Widget _input(String title, String placeholder, Function onTap,
    GlobalKey<FormState> key) {
  return Form(
    key: key,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        // text field
        Container(
          width: 200.0,
          child: TextFormField(
            // decoration
            decoration: const InputDecoration(
              hintText: 'გუგა',
              labelText: 'შენი სახელი',
            ),
            // The validator
            validator: (value) {
              if (value.isEmpty) {
                return 'Please enter some text';
              }
              return null;
            },
          ),
        ),
        // button
        FlatButton(
          color: Palette.accent,
          textColor: Palette.fontLight,
          padding: EdgeInsets.all(8.0),
          splashColor: Palette.fontLight,
          onPressed: () {
            if (key.currentState.validate()) {
              onTap;
            }
          },
          child: Text('შენახვა'),
        )
      ],
    ),
  );
}
