// imported packages
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
// Core packages
import 'core/models/restaurant_category.dart';
import 'core/services/firebase_service.dart';
// Ui packages
import 'ui/main_screen/main_screen.dart';

// ================================
// This is the wrapper for all pages
// it contains provider to drill down on
// all children widgets and routes to
// control navigatio
// ================================
class Wrapper extends StatelessWidget {
  const Wrapper({Key key}) : super(key: key);

  // ===========================
  // Providers are stored here
  // ===========================
  static List<StreamProvider> _providers = [
    // Restaurant Categories
    StreamProvider<List<RestaurantCategory>>(
      create: (_) => FirebaseService.streamOfRestaurantCategories,
      initialData: [],
    ),
  ];

  // ===========================
  // Routes are stored here
  // ===========================
  static Map<String, Widget Function(BuildContext)> _routes = {
    '/': (context) => MainScreen(),
  };

  // ===========================
  // Building widget tree
  // ===========================
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: _providers,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(fontFamily: 'Georgian'),
        initialRoute: '/',
        routes: _routes,
      ),
    );
  }
}
