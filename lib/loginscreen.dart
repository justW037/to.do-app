import 'package:demo2/myApp.dart';
import 'package:demo2/theme.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class loginScreen extends StatefulWidget{

  @override
  State<loginScreen> createState() => _loginScreenState();
}

class _loginScreenState extends State<loginScreen> {
bool _showPassword = false;
  void _SignUp(){
  }
  void _handleShowPass(){
    setState(() {
      _showPassword = !_showPassword;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20,100,20,20),
            child: Column(
              children: [
                const Text(
                  'To.do',
                  style: Heading.Heading2,
                ),
                const SizedBox(height: 50),
                const Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Hello \nWelcome back',
                    style: Heading.Heading1,
                  ),
                ),
                const SizedBox(height: 50),
                const TextField(
                  decoration: InputDecoration(
                    labelText: 'Email',
                    labelStyle: TextStyle(color: Colors.black), 
                  ),
                ),
                const SizedBox(height: 20),
                 Stack(
                  alignment: AlignmentDirectional.centerEnd,
                   children:<Widget>[ 
                    TextField(
                    obscureText: !_showPassword,
                    decoration: const InputDecoration(
                      labelText: 'Password',
                      labelStyle: TextStyle(color: Colors.black),           
                    ),  
                  ),
                  GestureDetector(
                    onTap: _handleShowPass,
                    child: Icon(
                      _showPassword ? Icons.visibility_off : Icons.visibility,
                      color: Colors.grey,
                    ),
                  )
                  ]
                 ),
                const SizedBox(height: 50),
                SizedBox(
                  width: 400,
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(Colors.black),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context)=> Myapp())
                      );
                    },
                    child: const Text('SIGN IN'),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text('or sign in with', ),
                ),
                const Padding(
                  padding: EdgeInsets.fromLTRB(0,0,0,40),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Icon(
                        FontAwesomeIcons.facebook,
                        size: 45,
                        color: Color(0xFF1178F2),
                      ),
                      Icon(
                        FontAwesomeIcons.google,
                        size: 45,
                        color: Colors.black,
                      ),
        
                    ],
                  ),
                ),
                 Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text.rich(
                      TextSpan(
                        text: 'New users?',
                        style: Heading.Heading4,
                        children:<InlineSpan> [
                          WidgetSpan(
                    child: GestureDetector(
                      onTap: _SignUp,
                      child: const Text(
                        ' Sign up.',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.blue,
                                ),
                              ),
                            ),
                          )
                        ]
                        ),
                    ),
                    Text(
                      'Forgot password', 
                      style: Heading.Heading4.copyWith(
                        color: Colors.blue,
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
