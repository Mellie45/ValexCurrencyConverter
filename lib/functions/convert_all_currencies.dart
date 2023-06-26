import 'package:app/utilities/rounded_button.dart';
import 'package:flutter/material.dart';

import 'fetch_rates.dart';

class ConvertAllCurrencies extends StatefulWidget {
  final dynamic rates;
  final Map currencies;
  const ConvertAllCurrencies({Key? key, required this.rates, required this.currencies}) : super(key: key);

  @override
  State<ConvertAllCurrencies> createState() => _ConvertAllCurrenciesState();
}

class _ConvertAllCurrenciesState extends State<ConvertAllCurrencies> {
  TextEditingController amountController = TextEditingController();
  String dropdownValue1 = 'AUD';
  String dropdownValue2 = 'AUD';
  String result = '00.00';

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              TextFormField(
                key: const ValueKey('amount'),
                cursorColor: Colors.white,
                controller: amountController,
                decoration: const InputDecoration(
                  focusedBorder: UnderlineInputBorder(borderSide: BorderSide(width: 2.0, color: Colors.white)),
                  enabledBorder: UnderlineInputBorder(borderSide: BorderSide(width: 1.0, color: Colors.white)),
                  helperStyle: TextStyle(color: Colors.white, fontSize: 14.0),
                  helperText: 'Enter Amount',
                ),
                textInputAction: TextInputAction.done,
                keyboardType: const TextInputType.numberWithOptions(signed: true, decimal: true),
                style: const TextStyle(fontSize: 82.0, fontWeight: FontWeight.w200, color: Colors.white),
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  Expanded(
                    child: DropdownButton<String>(
                      value: dropdownValue1,
                      icon: const Icon(
                        Icons.arrow_drop_down,
                        color: Colors.white,
                      ),
                      dropdownColor: Colors.black54,
                      style: const TextStyle(color: Colors.white),
                      iconSize: 34,
                      elevation: 0,
                      isExpanded: true,
                      underline: Container(
                        height: 1,
                        color: Colors.white,
                      ),
                      onChanged: (String? newValue) {
                        setState(() {
                          dropdownValue1 = newValue!;
                        });
                      },
                      items: widget.currencies.keys.toSet().toList().map<DropdownMenuItem<String>>((value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),
                  ),
                  Container(
                      margin: const EdgeInsets.symmetric(horizontal: 20),
                      child: const Text(
                        'To',
                        style: TextStyle(color: Colors.white),
                      )),
                  Expanded(
                    child: DropdownButton<String>(
                      value: dropdownValue2,
                      icon: const Icon(
                        Icons.arrow_drop_down,
                        color: Colors.white,
                      ),
                      dropdownColor: Colors.black54,
                      style: const TextStyle(color: Colors.white),
                      iconSize: 34,
                      elevation: 0,
                      isExpanded: true,
                      underline: Container(
                        height: 1,
                        color: Colors.white,
                      ),
                      onChanged: (String? newValue) {
                        setState(() {
                          dropdownValue2 = newValue!;
                        });
                      },
                      items: widget.currencies.keys.toSet().toList().map<DropdownMenuItem<String>>((value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              RoundedButton(
                  onPressed: () {
                    setState(() {
                      result = '${amountController.text} $dropdownValue1 ${convertAny(
                        widget.rates,
                        amountController.text,
                        dropdownValue1,
                        dropdownValue2,
                      )} $dropdownValue2';
                    });
                  },
                  mainColor: Colors.white,
                  buttonText: 'CALCULATE',
                  padding: 12,
                  opacity: 0.0,
                  borderColor: Colors.white,
                  borderWidth: 1.0),
              const SizedBox(
                width: 10,
              ),
              const SizedBox(height: 10),
              Text(
                result,
                style: const TextStyle(
                  fontSize: 34,
                  color: Colors.white,
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
