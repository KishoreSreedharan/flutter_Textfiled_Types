import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:types_of_textfiled/const.dart';

class DOBFormatter extends TextInputFormatter {
  final sampleValue = '01/01/2022';

  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    if (newValue.text.length > oldValue.text.length) {
      if (newValue.text.length > sampleValue.length) {
        return oldValue;
      }
      final lastEnteredLetter = newValue.text[newValue.text.length - 1];
      if (!RegExp(r'[0-9]').hasMatch(lastEnteredLetter)) {
        return oldValue;
      }
      if (sampleValue.length != newValue.text.length &&
          sampleValue[newValue.text.length] == '/') {
        final lastfourDigit = newValue.text.substring(newValue.text.length - 2);
        final lastTwoDigit = newValue.text.substring(newValue.text.length - 2);

        String? modifiedString;

        if (newValue.text.length == 2) {
          int value = int.parse(lastTwoDigit);
          if (value > 31) {
            value = value ~/ 10;
            modifiedString = '0$value';
          }
        }
        if (newValue.text.length == 5) {
          int value = int.parse(lastTwoDigit);
          if (value > 12) {
            value = value ~/ 10;
            modifiedString =
                '${newValue.text.substring(0, newValue.text.length - 2)}0$value';
          }
        }
        if (newValue.text.length == 10) {
          int value = int.parse(lastfourDigit);
          if (value > 2022) {
            value = value ~/ 10;
            modifiedString =
                '${newValue.text.substring(0, newValue.text.length - 4)}0$value';
          }
        }
        return TextEditingValue(
            text: '${modifiedString ?? newValue.text}/',
            selection:
                TextSelection.collapsed(offset: newValue.selection.end + 1));
      }
    }
    return newValue;
  }
}

class DOBDetail extends StatelessWidget {
  const DOBDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
            child: Text(
          'Text Input Format',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        )),
        backgroundColor: Colors.green,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: Text(
                title4,
                style: const TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(right: 20, left: 55),
            child: Text(
              "DOB text month only 1-12 ,day only 1-31",
              style: TextStyle(fontSize: 15, color: Colors.grey),
            ),
          ),
          // ignore: prefer_const_constructors
          Padding(
              padding: const EdgeInsets.only(right: 50, left: 50),
              // ignore: prefer_const_constructors
              child: TextField(
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                ),
                inputFormatters: [DOBFormatter()],
              )),
        ],
      ),
    );
  }
}
