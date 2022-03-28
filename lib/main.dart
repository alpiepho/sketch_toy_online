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
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

const _moveDelta = 20.0;
const _moveMin = 0.0;
const _moveMax = 200.0;

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  double _padUp = _moveMax / 2;
  double _padLeft = _moveMax / 2;
  double _padRight = _moveMax / 2;
  double _padDown = _moveMax / 2;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _moveUp() {
    setState(() {
      _padDown += _moveDelta;
      if (_padDown > _moveMax) {
        _padDown = _moveMax;
      }
      _padUp -= _moveDelta;
      if (_padUp < _moveMin) {
        _padUp = _moveMin;
      }
    });
  }

  void _moveDown() {
    setState(() {
      _padUp += _moveDelta;
      if (_padUp > _moveMax) {
        _padUp = _moveMax;
      }
      _padDown -= _moveDelta;
      if (_padDown < _moveMin) {
        _padDown = _moveMin;
      }
    });
  }

  void _moveLeft() {
    setState(() {
      _padRight += _moveDelta;
      if (_padRight > _moveMax) {
        _padRight = _moveMax;
      }
      _padLeft -= _moveDelta;
      if (_padLeft < _moveMin) {
        _padLeft = _moveMin;
      }
    });
  }

  void _moveRight() {
    setState(() {
      _padLeft += _moveDelta;
      if (_padLeft > _moveMax) {
        _padLeft = _moveMax;
      }
      _padRight -= _moveDelta;
      if (_padRight < _moveMin) {
        _padRight = _moveMin;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Column(
              children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(
                    _padLeft,
                    _padUp,
                    _padRight,
                    _padDown,
                  ),
                  child: Text(
                    '$_counter',
                    style: Theme.of(context).textTheme.headline4,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    onPressed: _moveUp,
                    child: const Icon(Icons.arrow_upward_sharp),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ElevatedButton(
                        onPressed: _moveLeft,
                        child: const Icon(Icons.arrow_back_sharp),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ElevatedButton(
                        onPressed: _moveRight,
                        child: const Icon(Icons.arrow_forward_sharp),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    onPressed: _moveDown,
                    child: const Icon(Icons.arrow_downward_sharp),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
