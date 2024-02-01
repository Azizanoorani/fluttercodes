import 'package:fl_login_demo/main.dart';
import 'package:fl_login_demo/signinwithgoogle.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Forgotpassword.dart';
import 'ListView.builder.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: signup(),
    );
  }
}

// home: LoginDemo(),

class signup extends StatefulWidget {

  @override
  _signup createState() {
    return _signup();
  }
}

class _signup extends State<signup> {
  get value => null;
  final _formKey = GlobalKey<FormState>();

  get child => null;

  @override
  Widget build(BuildContext context) {
    return Form(key: _formKey,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: const Text("Sign Up Page"),
        ),

        body: SingleChildScrollView(
          child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top: 60.0),
                  child: Center(
                    child: Container(
                        width: 200,
                        height: 150,
                        /*decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(50.0)),*/
                        child: Image.asset('asset/images/Foxy.png')),
                  ),
                ),
                Padding(
                  //padding: const EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  child: TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty ||
                            !RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
                                .hasMatch(
                                value.trim())) {
                          return 'please enter email';
                        }
                        else {
                          var val = value.trim();
                          if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
                              .hasMatch(val)) {
                            return 'please enter valid email';
                          }
                          return null;
                        }
                      },
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Email',
                          hintText: 'Enter valid email id as abc@gmail.com')
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      left: 15.0, right: 15.0, top: 15, bottom: 0),
                  //padding: EdgeInsets.symmetric(horizontal: 15),
                  child: TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'please enter correct password';
                      }
                      return null;
                    },
                    obscureText: true,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Password',
                        hintText: 'Enter secure password'),
                  ),
                ),

                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ForgotPassword()),
                    );
                    //TODO FORGOT PASSWORD SCREEN GOES HERE
                  },
                  child: const Text(style: TextStyle(color: Colors.black),
                      'Forgot Password'),
                  // style: TextStyle(color: Colors.blue, fontSize: 15),
                ),
                Container(
                  height: 50,
                  width: 250,
                  decoration: BoxDecoration(
                      color: Colors.blue.shade900,
                      borderRadius: BorderRadius.circular(15)),
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        ScaffoldMessenger.of(context).showSnackBar
                          (
                          const SnackBar(content: Text('Processing Data')),
                        );

                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => AnimalList()),
                        );
                      }
                    },
                    child: const Text(
                        style: TextStyle(color: Colors.white), 'Login'),
                    // style: TextStyle(color: Colors.blue, fontSize: 15),
                  ),

                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Already Have Account?"),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => LoginDemo()),
                        );
                        //TODO FORGOT PASSWORD SCREEN GOES HERE
                      },
                      child: const Text(style: TextStyle(color: Colors.blue),
                          'Login'),
                      // style: TextStyle(color: Colors.blue, fontSize: 15),
                    ),
                  ],
                ),
              ]
          ),
        ),
      ),
    );
  }
}