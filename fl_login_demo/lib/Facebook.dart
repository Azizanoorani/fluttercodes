import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';


class facebook extends StatefulWidget {
  @override
  _Facebook createState() => _Facebook();
}
void initiateFacebookLogin() async {
  var facebookLogin = _Facebook();
  var facebookLoginResult =
  await facebookLogin.logInWithReadPermissions(['email']);
  switch (facebookLoginResult.status) {
    case FacebookLoginStatus.error:
      print("Error");
      onLoginStatusChanged(false);
      break;
    case FacebookLoginStatus.cancelledByUser:
      print("CancelledByUser");
      onLoginStatusChanged(false);
      break;
    case FacebookLoginStatus.loggedIn:
      print("LoggedIn");
      onLoginStatusChanged(true);
      break;
  }
}

class _Facebook extends State<facebook> {
  bool isLoggedIn = false;

  void onLoginStatusChanged(bool isLoggedIn) {
    setState(() {
      this.isLoggedIn = isLoggedIn;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Facebook Login"),
        ),
        body: Container(
          child: Center(
            child: isLoggedIn
                ? Text("Logged In")
                : RaisedButton(
              child: Text("Login with Facebook"),
              onPressed: () => initiateFacebookLogin(),
            ),
          ),
        ),
      ),
    );
  }
}