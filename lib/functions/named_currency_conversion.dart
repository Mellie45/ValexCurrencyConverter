import 'package:app/functions/fetch_rates.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../utilities/back_button.dart';
import '../utilities/rounded_button.dart';

class NamedCurrencies extends StatefulWidget {
  final rates;
  final Map currencies;
  const NamedCurrencies({Key? key, @required this.rates, required this.currencies}) : super(key: key);

  @override
  State<NamedCurrencies> createState() => _NamedCurrenciesState();
}

class _NamedCurrenciesState extends State<NamedCurrencies> {
  TextEditingController amountController = TextEditingController();
  final Future<SharedPreferences> prefs = SharedPreferences.getInstance();

  String countryVal = 'GBP';
  String gbpVal = 'GBP';
  String result = '00.00';
  Color coreColor = Colors.yellowAccent;
  String textFieldHelperText = '';

  void setValues() async {
    final SharedPreferences preferences = await prefs;
    int val = (preferences.getInt('value') ?? 0);

    debugPrint('Value from Prefs: $val');

    if (mounted) {
      if (val == 1) {
        setState(() {
          countryVal = 'EGP';
          textFieldHelperText = 'Egyptian Pounds';
          coreColor = Colors.yellowAccent;
        });
      } else if (val == 2) {
        setState(() {
          countryVal = 'EUR';
          textFieldHelperText = 'Euros';
          coreColor = Colors.lime;
        });
      } else if (val == 3) {
        setState(() {
          countryVal = 'HRK';
          textFieldHelperText = 'Croatian Kaunas';
          coreColor = Colors.amber;
        });
      } else if (val == 4) {
        setState(() {
          countryVal = 'USD';
          textFieldHelperText = 'Dollars';
          coreColor = Colors.lightBlueAccent;
        });
      } else if (val == 5) {
        setState(() {
          countryVal = 'AED';
          textFieldHelperText = 'Dirhams';
          coreColor = Colors.greenAccent;
        });
      } else {
        setState(() {
          countryVal = 'GBP';
          textFieldHelperText = '?';
          coreColor = Colors.redAccent;
        });
      }
    }
  }

  @override
  void initState() {
    setValues();
    super.initState();
  }

  @override
  void dispose() {
    setValues();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 18.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                cursorColor: coreColor,
                controller: amountController,
                decoration: InputDecoration(
                  focusedBorder: UnderlineInputBorder(borderSide: BorderSide(width: 2.0, color: coreColor)),
                  enabledBorder: UnderlineInputBorder(borderSide: BorderSide(width: 1.0, color: coreColor)),
                  helperStyle: const TextStyle(color: Colors.white, fontSize: 14.0),
                  helperText: 'Cost in $textFieldHelperText',
                ),
                textInputAction: TextInputAction.done,
                keyboardType: const TextInputType.numberWithOptions(signed: true, decimal: true),
                style: const TextStyle(fontSize: 82.0, fontWeight: FontWeight.w200, color: Colors.white),
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.baseline,
                textBaseline: TextBaseline.alphabetic,
                children: [
                  const Text(
                    'equals:  ',
                    style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w600, color: Colors.white, letterSpacing: 1.0),
                  ),
                  Text('£$result', style: const TextStyle(fontSize: 52.0, fontWeight: FontWeight.w200, color: Colors.white))
                ],
              ),
              const SizedBox(height: 42.0),
              RoundedButton(
                borderWidth: 1.0,
                borderColor: coreColor,
                onPressed: () {
                  setState(() {
                    result = convertAny(widget.rates, amountController.text, countryVal, gbpVal);
                  });
                },
                mainColor: coreColor,
                buttonText: 'CALCULATE',
                padding: 0.0,
                opacity: 0.1,
              ),
            ],
          ),
        ),
        BackBtn(fill: coreColor),
      ],
    );
  }
}
