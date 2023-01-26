import 'package:app/functions/convert_all_currencies.dart';
import 'package:flutter/material.dart';

import '../functions/fetch_rates.dart';
import '../models/rates_model.dart';
import '../utilities/back_button.dart';

class AllCurrencies extends StatefulWidget {
  const AllCurrencies({Key? key})
      : super(
          key: key,
        );

  @override
  State<AllCurrencies> createState() => _AllCurrenciesState();
}

class _AllCurrenciesState extends State<AllCurrencies> {
  late Future<Map> allCurrencies;
  late Future<RatesModel> result;

  @override
  void initState() {
    super.initState();
    allCurrencies = fetchCurrencies();
    result = fetchRates();
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
        decoration: const BoxDecoration(
          image: DecorationImage(image: AssetImage('assets/general.png'), fit: BoxFit.cover),
        ),
        child: SafeArea(
            child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 28.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 30),
                    const RotatedBox(
                      quarterTurns: 3,
                      child: Text(
                        'ALL CURRENCIES',
                        style: TextStyle(color: Colors.white, fontSize: 18, letterSpacing: 1.4),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
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
                                            ConvertAllCurrencies(
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
                  ],
                ),
                const BackBtn(fill: Colors.white),
              ],
            ),
          ),
        )),
      ),
    );
  }
}
