import 'package:demo2/mainScreen/myApp.dart';
import 'package:demo2/dataAndTheme/theme.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class loginScreen extends StatefulWidget{

  @override
  State<loginScreen> createState() => _loginScreenState();
}

class _loginScreenState extends State<loginScreen> {
  final TextEditingController _usersController = TextEditingController();
  final TextEditingController _passController = TextEditingController();
  bool _showPassword = false;
  bool _invalidEmail = false;
  bool _inValidPass = false;
  var _EmailError = 'Invalid Email';
  var _PassError = 'Invalid password';

  void _SignUp() {}
  void _handleShowPass() {
    setState(() {
      _showPassword = !_showPassword;
    });
  }

  @override
  void dispose() {
    _usersController.dispose();
    _passController.dispose();
    super.dispose();
  }

  void _onSignInClick(){
      setState(() {
        if(_usersController.text.length>=8 && _usersController.text.contains(RegExp(r'[@.]'))){
          _invalidEmail = true;
        }
        else{
          _invalidEmail = false;
        }
        if(_passController.text.length>= 8 && _passController.text.contains(RegExp(r'[!@#$%^&*]'))){
          _inValidPass = true;
        }
        else{
          _inValidPass = false;
        }
        if(_invalidEmail && _inValidPass){
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Myapp()),
            );
        }
      });
  }

  @override
  Widget build(BuildContext context) {
    bool inValidEmail = _invalidEmail;
    bool inValidPass = _inValidPass; 

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 100, 20, 20),
            child: Column(
              children: [
                Text(
                  'To.do',
                  style: GoogleFonts.concertOne(
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                    fontSize: 40,
                  )
                ),
                const SizedBox(height: 50),
                const Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Hello \nWelcome back',
                    style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(height: 50),
                TextField(
                  controller: _usersController,
                  decoration: InputDecoration(
                    labelText: 'Email',
                    labelStyle: const TextStyle(color: Colors.black),
                    errorText: inValidEmail ? null : _EmailError, 
                  ),
                ),
                const SizedBox(height: 20),
                Stack(
                  alignment: AlignmentDirectional.centerEnd,
                  children: <Widget>[
                    TextField(
                      controller: _passController,
                      obscureText: !_showPassword,
                      decoration: InputDecoration(
                        labelText: 'Password',
                        labelStyle: const TextStyle(color: Colors.black),
                        errorText: inValidPass ? null : _PassError, 
                      ),
                      
                    ),
                    GestureDetector(
                      onTap: _handleShowPass,
                      child: Icon(
                        _showPassword ? Icons.visibility_off : Icons.visibility,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 50),
                SizedBox(
                  width: 400,
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(Colors.black),
                    ),
                    onPressed: _onSignInClick,
                    child: const Text('SIGN IN'),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    'or sign in with',
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.fromLTRB(0, 0, 0, 40),
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
                        style: const TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                        ),
                        children: <InlineSpan>[
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
                          ),
                        ],
                      ),
                    ),
                    const Text(
                      'Forgot password',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.blue,
                      ),
                    ),
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

