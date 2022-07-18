import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:types_of_textfiled/const.dart';

class UsernameFiled extends StatelessWidget {
  const UsernameFiled({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 40, left: 40),
      child: TextField(
        decoration: const InputDecoration(
          border: OutlineInputBorder(),
          prefix: Text('@'),
        ),
        inputFormatters: [
          FilteringTextInputFormatter.allow(RegExp(r"[a-zA-Z0-9]*")),
          FilteringTextInputFormatter.deny(RegExp(r"^[0-9]")),
        ],
      ),
    );
  }
}

class UserNameDetail extends StatelessWidget {
  const UserNameDetail({Key? key}) : super(key: key);

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
                title1,
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
              "Username have every alphabet and number",
              style: TextStyle(fontSize: 15, color: Colors.grey),
            ),
          ),
          // ignore: prefer_const_constructors
          Padding(
            padding: const EdgeInsets.only(right: 50, left: 50),
            // ignore: prefer_const_constructors
            child: UsernameFiled(),
          ),
        ],
      ),
    );
  }
}
