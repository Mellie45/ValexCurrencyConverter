import 'package:app/utilities/constants.dart';
import 'package:app/screens/select_currency_to_convert.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

final navigatorKey = GlobalKey<NavigatorState>();

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light().copyWith(
        primaryColor: kPrimaryColour,
      ),
      home: const CurrencySelector(),
      navigatorKey: navigatorKey,
    );
  }
}
