import 'package:demo2/myApp.dart';
import 'package:demo2/theme.dart';
import 'package:flutter/material.dart';


class loginScreen extends StatefulWidget{
  @override
  State<loginScreen> createState() => _loginScreenState();
}

class _loginScreenState extends State<loginScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              const SizedBox(height: 100),
              const Text(
                'To.do', 
                style: Heading.Heading2,
                ),
              const SizedBox(height: 50),
              Align(
                alignment: Alignment.topLeft,
                child: const Text(
                  'Hello \nWelcome back', 
                  style: Heading.Heading1,
                  ),
              ),
              SizedBox(height: 50),
              const TextField(
                decoration: InputDecoration(
                  labelText: 'Email'
                ),
              ),
              const TextField(
                decoration: InputDecoration(
                  labelText: 'Password'
                ),
              ),
              SizedBox(height: 50),
              SizedBox(
                width: 300,
                child: ElevatedButton(
                  style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all<Color>(Colors.black),
                        ),
                  onPressed: () { 
                    Navigator.push(
                      context, 
                      MaterialPageRoute(builder: (context)=> Myapp())
                    );
                   },
                  child: const Text('SIGN IN'),),
              ),
            ],
          ),
        )
      ),
    );
  }
}