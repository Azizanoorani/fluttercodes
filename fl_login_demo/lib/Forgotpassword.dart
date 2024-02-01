import 'package:fl_login_demo/main.dart';
import 'package:flutter/material.dart';

import 'HomePage.dart';

 /*class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ForgotPassword(),
    );
  }
}*/

class ForgotPassword extends StatefulWidget {

  @override
  _ForgotPassword createState() {
    return _ForgotPassword();
  }
}

class _ForgotPassword extends State<ForgotPassword> {
get value => null;
final _formKey = GlobalKey<FormState>();

  get child => null;

  @override
  Widget build(BuildContext context) {
    return Form(key: _formKey,
      child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            title: const Text("Reset Password"),
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
                      padding: const EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 15),
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
                    Container(
                      height: 50,
                      width: 250,
                      decoration: BoxDecoration(
                          color: Colors.blue.shade900, borderRadius: BorderRadius.circular(15)),
                      child: ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text('Processing Data')),
                            );
                          }
                        },
                        child: const Text('Send Link'),
                      ),
                    ),
                    const SizedBox(
                      height: 130,
                    ),
                    ElevatedButton(
                      child: const Text(style: TextStyle(color:Colors.black),'Go Back To Login'),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => LoginDemo()),
                        );
                      },
                    ),
                  ],
              )
          )
      ),
    );
  }
}






