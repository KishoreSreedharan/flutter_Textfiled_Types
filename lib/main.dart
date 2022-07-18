import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:types_of_textfiled/const.dart';
import 'package:types_of_textfiled/credit_cart_number.dart';
import 'package:types_of_textfiled/date_of_birth.dart';
import 'package:types_of_textfiled/phone_number_filed.dart';
import 'package:types_of_textfiled/text_filed.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const TextPlace(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class TextPlace extends StatefulWidget {
  const TextPlace({Key? key}) : super(key: key);

  @override
  State<TextPlace> createState() => _TextPlaceState();
}

class _TextPlaceState extends State<TextPlace> {
  final PageController _controller = PageController(
    initialPage: 0,
  );

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: _controller,
      children: const [
        UserNameDetail(),
        PhoneNumberDetail(),
        DOBDetail(),
        Creditcard(),
      ],
    );
  }
}
