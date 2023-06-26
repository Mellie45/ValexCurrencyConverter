import 'package:app/utilities/constants.dart';
import 'package:flutter/material.dart';
import '../services/destinations.dart';

class CurrencySelector extends StatelessWidget {
  const CurrencySelector({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: const AssetImage('assets/travel.png'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(Colors.blueGrey.withOpacity(0.9), BlendMode.multiply),
          ),
        ),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const CircleAvatar(
                radius: 24.0,
                backgroundImage: AssetImage('assets/icon_white.png'),
                backgroundColor: Colors.transparent,
              ),
              const SizedBox(
                height: 4.0,
              ),
              Text(
                'VALEX'.toUpperCase(),
                style: const TextStyle(letterSpacing: 1.8, fontSize: 16.0, fontWeight: FontWeight.w600, color: Colors.white),
              ),
              const SizedBox(
                height: 12.0,
              ),
              Text('CURRENCY', style: kTitleTextStyle.copyWith(letterSpacing: 4.05)),
              Text(
                'CONVERTER',
                style: kTitleTextStyle.copyWith(letterSpacing: 1.0),
              ),
              const SizedBox(
                height: 60.0,
              ),
              Text(
                'Choose your destination'.toUpperCase(),
                style: const TextStyle(letterSpacing: 1.2, fontSize: 16.0, fontWeight: FontWeight.w300, color: Colors.white),
              ),
              const SizedBox(
                height: 12.0,
              ),
              const SingleChildScrollView(child: Destinations()),
            ],
          ),
        ),
      ),
    );
  }
}
