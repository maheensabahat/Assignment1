import 'dart:html';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.green,
      ),
      home: const MyHomePage(title: 'Login Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String userID = "";
  String pw = "";
  TextEditingController controller1 = TextEditingController();
  TextEditingController controller2 = TextEditingController();
  var login = true;

  void clearText() {
    controller1.clear();
    controller2.clear();
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.

    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
        backgroundColor: const Color(0xcc5d75d4),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              //Login Title
              const Padding(
                padding: EdgeInsets.fromLTRB(0, 150, 0, 0),
                child: Visibility(
                  child: Text(
                    'Login',
                    style: TextStyle(
                        color: Color(0xff5d75d4),
                        fontSize: 48.0,
                        fontWeight: FontWeight.bold),
                  ),
                  visible: true,
                ),
              ),

              //subtitle
              const Padding(
                padding: EdgeInsets.fromLTRB(0, 8, 0, 16),
                child: Visibility(
                  child: Text(
                    'Hello World!',
                    style: TextStyle(
                        color: Colors.grey,
                        fontSize: 14.0,
                        fontWeight: FontWeight.w400),
                  ),
                  visible: true,
                ),
              ),

              if (login) ...[
                //User ID TextField
                Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 24.0, horizontal: 8.0),
                  child: TextField(
                    controller: controller1,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                          borderSide: BorderSide.none,
                        ),
                        hintText: 'User ID',
                        filled: true,
                        fillColor: Color(0xffe7edeb),
                        prefixIcon: Icon(
                          Icons.person,
                          color: Colors.grey[400],
                        )),
                  ),
                ),

                //password TextField
                Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 0.0, horizontal: 8.0),
                  child: TextField(
                    controller: controller2,
                    obscureText: true,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                          borderSide: BorderSide.none,
                        ),
                        hintText: 'Password',
                        filled: true,
                        fillColor: Color(0xffe7edeb),
                        prefixIcon: Icon(
                          Icons.lock,
                          color: Colors.grey[400],
                        )),
                  ),
                ),

                //Login Button
                Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 48.0, horizontal: 8.0),
                  child: SizedBox(
                    width: 200,
                    height: 40,
                    child: ElevatedButton(
                      onPressed: () {
                        userID = controller1.text;
                        pw = controller2.text;
                        print(userID);
                        print(pw);
                        login = false;
                        setState(() {});
                      },
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Color(0xcc5d75d4)),
                      ),
                      child: const Text(
                        'Login',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14.0,
                        ),
                      ),
                    ),
                  ),
                )
              ] else ...[
                //User ID Reset Text
                Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 24.0, horizontal: 8.0),
                  child: Text(
                    'User ID:  $userID',
                    style: const TextStyle(
                        fontSize: 16.0, fontWeight: FontWeight.w900),
                  ),
                ),

                //Password Reset Text
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Password:  $pw',
                    style: const TextStyle(
                        fontSize: 16.0, fontWeight: FontWeight.w900),
                  ),
                ),
                //Reset Button
                Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 48.0, horizontal: 8.0),
                  //Sized box forces its child to have this width and height
                  child: SizedBox(
                    width: 200,
                    height: 40,
                    child: ElevatedButton(
                      onPressed: () {
                        login = true;
                        clearText();
                        setState(() {});
                      },
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Color(0xcc5d75d4)),
                      ),
                      child: const Text(
                        'Reset',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14.0,
                        ),
                      ),
                    ),
                  ),
                )
              ]
            ],
          ),
        ),
      ),
    );
  }
}
