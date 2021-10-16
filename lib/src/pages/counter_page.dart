import 'package:flutter/material.dart';

class CounterPage extends StatefulWidget {
  @override
  createState() => _CounterPageState();
}

class _CounterPageState extends State<CounterPage> {
  final _textStyle = TextStyle(fontSize: 24);
  int _counter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Stateful'),
        centerTitle: false,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('You clicked this times: ', style: _textStyle),
            Text('${_counter}', style: _textStyle)
          ],
        ),
      ),
      floatingActionButton: _createButtons(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  Widget _createButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        FloatingActionButton(
          child: Icon(Icons.remove),
          onPressed: remove,
        ),
        FloatingActionButton(
          child: Icon(Icons.exposure_zero),
          onPressed: reset,
        ),
        FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: add,
        ),
      ],
    );
  }

  void remove() {
    if (_counter > 0) {
      setState(() => _counter--);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('You are in 0!'),
      ));
    }
  }

  void reset() {
    setState(() => _counter = 0);
  }

  void add() {
    setState(() => _counter++);
  }
}
