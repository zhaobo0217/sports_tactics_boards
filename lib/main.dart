import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:sports_tactics_boards/widgets/MySliver.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: "/",
      routes: {
        "/buy_page": (context) => new MySliver(),
        //"/": (context) => MyHomePage(title: "My flutter page"),
      },
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
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: "My flutter page"),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  bool _lights = false;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
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
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: RefreshIndicator(
          onRefresh: () async {},
          child: ListView(
            //physics: const AlwaysScrollableScrollPhysics(),
            // Column is also a layout widget. It takes a list of children and
            // arranges them vertically. By default, it sizes itself to fit its
            // children horizontally, and tries to be as tall as its parent.
            //
            // Invoke "debug painting" (press "p" in the console, choose the
            // "Toggle Debug Paint" action from the Flutter Inspector in Android
            // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
            // to see the wireframe for each widget.
            //
            // Column has various properties to control how it sizes itself and
            // how it positions its children. Here we use mainAxisAlignment to
            // center the children vertically; the main axis here is the vertical
            // axis because Columns are vertical (the cross axis would be
            // horizontal).
            children: <Widget>[
              Text(
                'You have pushed the button this many times:',
              ),
              Text(
                '$_counter',
                style: Theme.of(context).textTheme.headline4,
              ),
              TextButton(
                onPressed: () => Navigator.pushNamed(context, "/buy_page"),
                child: Text("进入商品首页",
                    style: TextStyle(color: Colors.amber, fontSize: 16)),
                style: ButtonStyle(
                    backgroundColor: MaterialStateColor.resolveWith(
                        (states) => Colors.blueGrey),
                    overlayColor: MaterialStateProperty.all(Colors.amber.withOpacity(.4)),
                    elevation: MaterialStateProperty.all(5),
                    side: MaterialStateProperty.all(
                        BorderSide(color: Colors.deepOrangeAccent, width: 1)),
                  shape: MaterialStateProperty.all(StadiumBorder())
                ),
              ),
              StepperApp(),
              MergeSemantics(
                child: ListTile(
                  title: const Text('Lights'),
                  trailing: CupertinoSwitch(
                    value: _lights,
                    onChanged: (bool value) {
                      setState(() {
                        _lights = value;
                      });
                    },
                  ),
                  onTap: () {
                    setState(() {
                      _lights = !_lights;
                    });
                  },
                ),
              ),
              Wrap(
                spacing: 8.0, // gap between adjacent chips
                runSpacing: 4.0, // gap between lines
                children: <Widget>[
                  Chip(
                    avatar: CircleAvatar(
                        backgroundColor: Colors.blue.shade900,
                        child: const Text('AH')),
                    label: const Text('Hamilton'),
                  ),
                  Chip(
                    avatar: CircleAvatar(
                        backgroundColor: Colors.blue.shade900,
                        child: const Text('ML')),
                    label: const Text('Lafayettehhhhhhhhhhhh'),
                  ),
                  Chip(
                    avatar: CircleAvatar(
                        backgroundColor: Colors.blue.shade900,
                        child: const Text('HM')),
                    label: const Text('Muj'),
                  ),
                  Chip(
                    avatar: CircleAvatar(
                        backgroundColor: Colors.blue.shade900,
                        child: const Text('JL')),
                    label: const Text('Laurens'),
                  ),
                  Container(
                    color: Colors.black,
                    child: Transform(
                      alignment: Alignment.topRight,
                      transform: Matrix4.skewY(0.3)..rotateZ(-30),
                      child: Container(
                        padding: const EdgeInsets.all(8.0),
                        color: const Color(0xFFE8581C),
                        child: const Text('Apartment for rent!'),
                      ),
                    ),
                  ),
                  Flex(
                    direction: Axis.vertical,
                    children: <Widget>[
                      ListBody(
                        mainAxis: Axis.vertical,
                        reverse: false,
                        children: <Widget>[
                          Container(
                            color: Colors.red,
                            width: 0.0,
                            height: 100.0,
                          ),
                          Container(
                            color: Colors.yellow,
                            width: 50.0,
                            height: 50.0,
                          ),
                          Container(
                            color: Colors.green,
                            width: 50.0,
                            height: 500.0,
                          ),
                          Container(
                            color: Colors.blue,
                            width: 50.0,
                            height: 50.0,
                          ),
                          Container(
                            color: Colors.black,
                            width: 50.0,
                            height: 50.0,
                          ),
                        ],
                      )
                    ],
                  )
                ],
              )
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class StepperApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _StepperState();
  }
}

class _StepperState extends State<StepperApp> {
  int _index = 0;

  @override
  Widget build(BuildContext context) {
    return Stepper(
      currentStep: _index,
      onStepCancel: null,
      onStepContinue: null,
      onStepTapped: (int index) {
        setState(() {
          _index = index;
        });
      },
      steps: [
        Step(
            title: const Text("Step 1"),
            content: Container(
              color: Colors.deepOrangeAccent,
              child: const Text("Step1 content"),
            )),
        Step(
            title: const Text("Step 2"),
            content: Container(
              padding: EdgeInsets.all(10),
              color: Colors.greenAccent,
              child: const Text("Step 2 Content"),
            )),
        Step(
            title: const Text("Step 3"),
            content: Container(
              padding: EdgeInsets.all(10),
              alignment: Alignment.center,
              //color: Colors.blueAccent,
              decoration: BoxDecoration(
                  color: Colors.amberAccent,
                  borderRadius: BorderRadius.circular(3),
                  border: Border.all(color: Colors.deepOrange)),
              child: const Text("Step 3 Content"),
            )),
      ],
    );
  }
}
