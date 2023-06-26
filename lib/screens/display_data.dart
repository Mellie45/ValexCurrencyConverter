import 'package:app/functions/fetch_rates.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../functions/named_currency_conversion.dart';
import '../models/rates_model.dart';

class DisplayData extends StatefulWidget {
  const DisplayData({Key? key}) : super(key: key);

  @override
  State<DisplayData> createState() => _DisplayDataState();
}

class _DisplayDataState extends State<DisplayData> {
  late Future<Map> allCurrencies;
  late Future<RatesModel> result;
  late ValueSetter valueSetter;
  final Future<SharedPreferences> prefs = SharedPreferences.getInstance();

  String img = '';
  String locationText = '';
  Color coreColor = Colors.yellowAccent;

  void setValues() async {
    final SharedPreferences preferences = await prefs;
    int val = (preferences.getInt('value') ?? 0);

    debugPrint('Value from Prefs: $val');
    if (val == 1) {
      setState(() {
        img = 'assets/egypt.jpg';
        locationText = 'EGYPT';
        coreColor = Colors.yellowAccent;
      });
    } else if (val == 2) {
      setState(() {
        img = 'assets/euro.png';
        locationText = 'EUROPE';
        coreColor = Colors.lime;
      });
    } else if (val == 3) {
      setState(() {
        img = 'assets/croatia.jpg';
        locationText = 'CROATIA ';
        coreColor = Colors.amber;
      });
    } else if (val == 4) {
      setState(() {
        img = 'assets/usa.png';
        locationText = 'USA';
        coreColor = Colors.lightBlueAccent;
      });
    } else if (val == 5) {
      setState(() {
        img = 'assets/dubai.jpg';
        locationText = 'DUBAI';
        coreColor = Colors.greenAccent;
      });
    } else if (val == 6) {
      setState(() {
        img = 'assets/hong_kong.png';
        locationText = 'HONG KONG';
        coreColor = Colors.pinkAccent;
      });
    } else {
      setState(() {
        img = 'assets/travel.png';
        locationText = 'ARGGG!';
        coreColor = Colors.redAccent;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    allCurrencies = fetchCurrencies();
    result = fetchRates();
    setValues();
  }

  @override
  void dispose() {
    allCurrencies = fetchCurrencies();
    result = fetchRates();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage(img), fit: BoxFit.cover),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 28.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 30),
                  RotatedBox(
                    quarterTurns: 3,
                    child: Text(
                      locationText,
                      style: TextStyle(color: coreColor, fontSize: 18, letterSpacing: 1.4),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 12.0, right: 18.0),
                    child: Column(
                      children: [
                        Form(
                          child: FutureBuilder<RatesModel>(
                            future: result,
                            builder: (context, snapshot) {
                              if (snapshot.connectionState == ConnectionState.waiting) {
                                return const Center(child: CircularProgressIndicator());
                              }
                              return FutureBuilder<Map>(
                                  future: allCurrencies,
                                  builder: (context, currencySnapshot) {
                                    if (currencySnapshot.connectionState == ConnectionState.waiting) {
                                      return const Center(
                                        child: CircularProgressIndicator(),
                                      );
                                    }
                                    if (snapshot.hasData && currencySnapshot.hasData) {
                                      return Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          NamedCurrencies(
                                            rates: snapshot.data!.rates,
                                            currencies: currencySnapshot.data!,
                                          ),
                                        ],
                                      );
                                    }
                                    return const Center(
                                      child: Text('Failed'),
                                    );
                                  });
                            },
                          ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 100,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
