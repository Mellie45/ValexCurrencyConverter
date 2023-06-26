import 'package:app/screens/all_currencies.dart';
import 'package:app/utilities/rounded_button.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../screens/display_data.dart';

class Destinations extends StatefulWidget {
  const Destinations({
    Key? key,
  }) : super(key: key);

  @override
  State<Destinations> createState() => _DestinationsState();
}

class _DestinationsState extends State<Destinations> {
  final Future<SharedPreferences> prefs = SharedPreferences.getInstance();

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return SizedBox(
      width: width * 0.4,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          RoundedButton(
              borderColor: Colors.lime,
              borderWidth: 0.6,
              opacity: 0.5,
              onPressed: () async {
                final SharedPreferences preferences = await prefs;
                preferences.setInt('value', 2);
                if (mounted) Navigator.push(context, MaterialPageRoute(builder: (context) => const DisplayData()));
              },
              mainColor: Colors.lime,
              buttonText: 'EUROPE',
              padding: 8.0),
          RoundedButton(
              borderColor: Colors.lightBlueAccent,
              borderWidth: 0.6,
              opacity: 0.5,
              onPressed: () async {
                final SharedPreferences preferences = await prefs;
                preferences.setInt('value', 4);
                if (mounted) Navigator.push(context, MaterialPageRoute(builder: (context) => const DisplayData()));
              },
              mainColor: Colors.lightBlueAccent,
              buttonText: 'USA',
              padding: 8.0),
          RoundedButton(
              borderColor: Colors.amber,
              borderWidth: 0.6,
              opacity: 0.5,
              onPressed: () async {
                final SharedPreferences preferences = await prefs;
                preferences.setInt('value', 3);
                if (mounted) Navigator.push(context, MaterialPageRoute(builder: (context) => const DisplayData()));
              },
              mainColor: Colors.amber,
              buttonText: 'CROATIA',
              padding: 8.0),
          RoundedButton(
              borderColor: Colors.greenAccent,
              borderWidth: 0.6,
              opacity: 0.5,
              onPressed: () async {
                final SharedPreferences preferences = await prefs;
                preferences.setInt('value', 5);
                if (mounted) Navigator.push(context, MaterialPageRoute(builder: (context) => const DisplayData()));
              },
              mainColor: Colors.greenAccent,
              buttonText: 'DUBAI',
              padding: 8.0),
          RoundedButton(
              borderColor: Colors.pinkAccent,
              borderWidth: 0.6,
              opacity: 0.5,
              onPressed: () async {
                final SharedPreferences preferences = await prefs;
                preferences.setInt('value', 6);
                if (mounted) Navigator.push(context, MaterialPageRoute(builder: (context) => const DisplayData()));
              },
              mainColor: Colors.pinkAccent,
              buttonText: 'HONG KONG',
              padding: 8.0),
          RoundedButton(
              borderColor: Colors.white,
              borderWidth: 0.6,
              opacity: 0.5,
              onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const AllCurrencies())),
              mainColor: Colors.white,
              buttonText: 'OTHER',
              padding: 8.0),
        ],
      ),
    );
  }
}
