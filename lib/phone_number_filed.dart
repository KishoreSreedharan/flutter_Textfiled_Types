import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:types_of_textfiled/const.dart';

class PhoneNumberFiled extends StatelessWidget {
  const PhoneNumberFiled({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: TextInputType.number,
      decoration: const InputDecoration(
        border: OutlineInputBorder(),
      ),
      inputFormatters: [
        FilteringTextInputFormatter.digitsOnly,
        LengthLimitingTextInputFormatter(10),
      ],
    );
  }
}

class PhoneNumberDetail extends StatelessWidget {
  const PhoneNumberDetail({Key? key}) : super(key: key);

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
                title2,
                style: const TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(right: 50, left: 50),
            child: Text(
              "Phonenumber textfiled only have numbers with 0-10 limits",
              style: TextStyle(fontSize: 15, color: Colors.grey),
            ),
          ),
          // ignore: prefer_const_constructors
          Padding(
            padding: const EdgeInsets.only(right: 50, left: 50),
            // ignore: prefer_const_constructors
            child: PhoneNumberFiled(),
          ),
        ],
      ),
    );
  }
}
