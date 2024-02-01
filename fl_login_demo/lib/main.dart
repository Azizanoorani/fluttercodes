
import 'package:fl_login_demo/signup.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'Database_helper.dart';
import 'HomePage.dart';
import 'ListView.builder.dart';
import 'ListView.builder.dart';
import 'ListView.builder.dart';
import 'circularprogressbar.dart';
import 'firebase_options.dart';
import 'Forgotpassword.dart';
import 'ListView.builder.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'ListView.builder.dart';
import 'firebase_options.dart';
import 'package:flutter/foundation.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:rxdart/rxdart.dart';

void main() async  {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _LoginDemoState createState() => _LoginDemoState();
}
class MyApp extends StatelessWidget {
 @override
Widget build(BuildContext context) {
return MaterialApp(
debugShowCheckedModeBanner: false,
home: LoginDemo(),
);
}
}
//home: LoginDemo(),
class LoginDemo extends StatefulWidget {
@override
_LoginDemoState createState() {
return _LoginDemoState();
}
}

final _messageStreamController = BehaviorSubject<RemoteMessage>();
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
  if (kDebugMode) {
    print("Handling a background message: ${message.messageId}");
    print('Message data: ${message.data}');
    print('Message notification: ${message.notification?.title}');
    print('Message notification: ${message.notification?.body}');
  }
}
class _LoginDemoState extends State<LoginDemo> with SingleTickerProviderStateMixin{
  double left=0;
  double screenWidth = 0;
  double screenHeight=0;
  double maximumheight=0;
  double screenHeightTFP = 0;
  double _lefttoright = 0;
  double _righttoleft = 0;
  double _toptobutton = 0;
  double screenHeighttfp=0;
  double _buttontotop =   0;
  late AnimationController _controller;
  late Animation<double> _animation;


  List<Map<String, dynamic>> myData = [];

  bool _isLoading = true;
// This function is used to fetch all data from the database
  void _refreshData() async {
    final data = await DatabaseHelper.getAnimalTypes();
    setState(() {
      myData = data;
      _isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    _refreshData();
    print("Screen Width In Init State" + screenWidth.toString());
    //WidgetsBinding.instance.addPostFrameCallback((_) {
    _controller = AnimationController(
      duration: Duration(seconds: 5),
      vsync: this,
    )
      ..repeat(reverse: false);

    Future.delayed(const Duration(seconds: 10), () {
        print('One second has passed.');
        //_controller.forward(from: 0.2);
        left = 120;
        _controller.dispose(); // Prints after 1 second.
      });
    }
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;
    screenHeight= MediaQuery.of(context).size.height;
    screenHeightTFP = screenHeight * 0.25;
    screenHeighttfp= screenHeight* 0.35;
    maximumheight= screenHeight*0.65;
    print("Screen Width In Build Method : " + screenWidth.toString());
    print("Screen Height In Build Method : " + screenHeight.toString());


    //_animation = Tween<Offset>(begin:  Offset(0,screenWidth * -100), end:  Offset(0, 90)).animate(_controller);
    _animation = Tween<double>(begin: 0.0, end: 1).animate(_controller)..addListener(() {
      setState(() {
        if(_lefttoright< _animation.value)
          {
            _lefttoright=_animation.value;
          }
        print("_leftAnimation : " + _animation.value.toString());

        if(_righttoleft < _animation.value)
        {
          _righttoleft=_animation.value;
        }
        print("_Animation : " + _animation.value.toString());
        if(_toptobutton < _animation.value)
        {
          _toptobutton=_animation.value;
        }
        print("Top Animation : " +((screenHeightTFP-(screenHeightTFP * _toptobutton)) * -1) .toString());
        print("_Animation : " + _animation.value.toString());
        if(_buttontotop < _animation.value)
        {
          _buttontotop=_animation.value;
        }
        print("button :" +((screenHeighttfp-(screenHeight * _buttontotop))) .toString());
      });
    });
    //_rightanimation = Tween<Offset>(begin:  Offset((screenWidth*180), 0), end:  Offset(0, 000)).animate(_controller);
    //_buttonanimation = Tween<Offset>(begin:  Offset(0,(screenWidth* 100)), end: Offset(0, 000)).animate(_controller);

    return Form(key: _formKey,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: const Text("Login Page"),
        ),
        body: SingleChildScrollView(
          child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top: 40),
                 child: SizedBox(
                    width: screenWidth,
                     height: 100,
                    child:
                        Container(
                          child: AnimatedBuilder(
                            animation: _animation,
                            builder: (context, child) {
                         return Transform.translate(
                          offset: Offset(0, ((screenHeightTFP-(screenHeightTFP * _toptobutton)) * -1)),
                          child:  Image.asset('asset/images/Foxy.png'),
                        );
                      },
                      ),
                        )
                    ),
                ),
                      Padding(
                  padding:  const EdgeInsets.symmetric(horizontal: 15),
                  //padding: EdgeInsets.symmetric(horizontal: 0),
          child: SizedBox(
          width: (screenWidth),
             height: 70,
             child:
            Container(
              //color: Colors.red,
            child: AnimatedBuilder(
            animation: _animation,
            builder: (context, child) {
         return Transform.translate(
           offset:Offset(((screenWidth - (screenWidth * _lefttoright)) * -1), 0),
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
                   );
                   }
                 )
                )
                )
                ),
                Padding(
                  padding:const EdgeInsets.symmetric(horizontal: 15),
    child: SizedBox(
    width: (screenWidth),
    height: 70,
    child:
    Container(
      //color: Colors.blue,
    child: AnimatedBuilder(
    animation: _animation,
    builder: (context, child) {
    return Transform.translate(
      offset:Offset(((screenWidth - (screenWidth * _lefttoright)) * -1), 0),
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
                 );
               }
              )
            )
          )
                ),
              SizedBox(
              width: screenWidth,
              height: 70,
              child:
           Container(
          child: AnimatedBuilder(
          animation: _animation,
           builder: (context, child) {
    return Transform.translate(
        offset:Offset(((screenWidth -(screenWidth * _righttoleft))), 0),
                child:TextButton(
                  onPressed: () async {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ForgotPassword()),
                    );
                    final messaging = FirebaseMessaging.instance;
                    final settings = await messaging.requestPermission(
                      alert: true,
                      announcement: false,
                      badge: true,
                      carPlay: false,
                      criticalAlert: false,
                      provisional: false,
                      sound: true,
                    );
                    String? token = await messaging.getToken();
                    if (kDebugMode) {
                      print('Registration Token=$token');
                    }
                    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
                      if (kDebugMode) {
                        print('Handling a foreground message: ${message
                            .messageId}');
                        print('Message data: ${message.data}');
                        print('Message notification: ${message.notification
                            ?.title}');
                        print('Message notification: ${message.notification
                            ?.body}');
                      }
                      _messageStreamController.sink.add(message);
                    });
                    //TODO FORGOT PASSWORD SCREEN GOES HERE
                  },
                  child: const Text(style: TextStyle(color: Colors.black),
                      'Forgot Password'),
                  // style: TextStyle(color: Colors.blue, fontSize: 15),
                ),
    );
    }
    )
    )
              ),
    SizedBox(
    width: screenWidth,
    height: 60,
    child:
    Container(
    child: AnimatedBuilder(
    animation: _animation,
    builder: (context, child) {
    return Transform.translate(
        offset:Offset(((screenWidth -(screenWidth * _righttoleft))), 0),
                child:Padding(
                  padding:EdgeInsets.symmetric(horizontal: 25),
      child: Container(
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
    ),
    );
    }
    )
    ),
    ),
    SizedBox(
    width: screenWidth,
    height: 70,
    child:
    Container(
    child: AnimatedBuilder(
    animation: _animation,
    builder: (context, child) {
    return Transform.translate(
        offset:Offset(((screenWidth -(screenWidth * _righttoleft))), 0),
               child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Dont Have Account?"),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => signup()),
                        );
                        //TODO FORGOT PASSWORD SCREEN GOES HERE
                      },
                      child: const Text(style: TextStyle(color: Colors.blue),
                          'Create Account'),
                      // style: TextStyle(color: Colors.blue, fontSize: 15),
                    ),
                  ],
      )
    );
    }
    )
    ),
                ),
    SizedBox(
    width: 300,
    height: 70,
    child:
    Container(
    child: AnimatedBuilder(
    animation: _animation,
    builder: (context, child) {
    return Transform.translate(
        offset:Offset(0, ((screenHeighttfp -(screenHeight * _buttontotop-maximumheight)))),
    child: Padding(
    padding: EdgeInsets.only(left: 20, right: 20),
    child: MaterialButton(
    color: Colors.blue[100],
    elevation: 5,
    onPressed: () {  },
    child: Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
    Container(
    height: 30.0,
    width: 10.0,
    decoration: BoxDecoration(
    image: DecorationImage(
    image:
    AssetImage('asset/images/google1.png'),
    fit: BoxFit.cover),
    shape: BoxShape.circle,
    ),
    ),
    SizedBox(
    width: 10,
    height: 10,
    ),
    Text("Sign In with Google")
    ],
    ),
    //onPressed: () {
    //signupgoogle(context);
    //},
    ),
    ),
    );
    }
    )
      ),
    ),
      ]
    ),
    ),
      )
      );
  }
  final FirebaseAuth auth = FirebaseAuth.instance;

  Future<void> signupgoogle(BuildContext context) async {
    final GoogleSignIn googleSignIn = GoogleSignIn();
    final GoogleSignInAccount? googleSignInAccount = await googleSignIn
        .signIn();
    if (googleSignInAccount != null) {
      final GoogleSignInAuthentication googleSignInAuthentication =
      await googleSignInAccount.authentication;
      final AuthCredential authCredential = GoogleAuthProvider.credential(
          idToken: googleSignInAuthentication.idToken,
          accessToken: googleSignInAuthentication.accessToken);

      // Getting users credential
      UserCredential result = await auth.signInWithCredential(authCredential);
      User? user = result.user;

      if (result != null) {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => HomePage()));
      } // if result not null we simply call the MaterialpageRoute,
      // for go to the HomePage screen
    }
  }
}





