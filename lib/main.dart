import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        textTheme: TextTheme(
          //Where the theme/UI is defined
          bodyText2: TextStyle(
            fontSize: 12.0,
            color: Colors.redAccent,
            fontWeight: FontWeight.bold,
          ),
          headline4: TextStyle(
            fontSize: 60.0,
            color: Colors.white,
            fontWeight: FontWeight.w900,
          ),
        ),
      ),
      home: HomeView(title: 'First Flutter'),
    );
  }
}

class HomeView extends StatefulWidget {
  final String title;
  HomeView({required this.title});

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int _counter = 0; //The underscore signifies a private var

  void _increaseCounter() {
    setState(() {
      _counter++;
    });
  }

  void _decreaseCounter() {
    if (_counter > 0) {
      setState(() {
        _counter--;
      });
    }
  }

  void _resetCounter() {
    setState(() {
      _counter = 0;
    });
  }

  List<Color> _color = [
    Colors.red,
    Colors.blue,
    Colors.green,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _color[_counter % _color.length],
      appBar: AppBar(
        title: Text(widget.title),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          FloatingActionButton(
            onPressed: _resetCounter,
            child: Icon(Icons.refresh),
          ),
          SizedBox(
            width: 10.0,
          ), //Adding padding between buttons
          FloatingActionButton(
            onPressed: _decreaseCounter,
            child: Icon(Icons.remove),
          ),
          SizedBox(
            width: 10.0,
          ),
          FloatingActionButton(
            onPressed: _increaseCounter,
            child: Icon(Icons.add),
          ),
        ],
      ),
      body: Center(
        child: Column(
            mainAxisAlignment:
                MainAxisAlignment.center, //centering vertically too
            children: <Widget>[
              Text(
                'Tapped this button this many times: ',
                style: Theme.of(context).textTheme.bodyText2,
              ),
              Text(
                '$_counter', //The $ sign signifies that a var is entered
                style: Theme.of(context).textTheme.headline4,
              )
            ]),
      ),
    );
  }
}
