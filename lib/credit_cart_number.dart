import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:types_of_textfiled/const.dart';

class CreditCardNumberFormate extends TextInputFormatter {
  final sampleNumber = '0000 0000 0000 0000';

  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    if (newValue.text.length > oldValue.text.length) {
      if (newValue.text.length > sampleNumber.length) {
        return oldValue;
      }
      final lastEnteredLetter =
          newValue.text.substring(newValue.text.length - 1);
      if (!RegExp(r'[0-9]').hasMatch(lastEnteredLetter)) {
        return oldValue;
      }
      if (newValue.text.isNotEmpty &&
          sampleNumber[newValue.text.length - 1] == ' ') {
        return TextEditingValue(
          text:
              '${oldValue.text} ${newValue.text.substring(newValue.text.length - 1)}',
          selection:
              TextSelection.collapsed(offset: newValue.selection.end + 1),
        );
      }
    }
    return newValue;
  }
}

class Creditcard extends StatelessWidget {
  const Creditcard({Key? key}) : super(key: key);

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
                title3,
                style: const TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(right: 40, left: 60),
            child: Text(
              "Credit cards have unique 15 digit Number",
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
                inputFormatters: [CreditCardNumberFormate()],
              )),
        ],
      ),
    );
  }
}
