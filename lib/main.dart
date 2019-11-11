import 'package:flutter/material.dart';
import 'package:audioplayers/audio_cache.dart';

void main() => runApp(XylophoneApp());

class XylophoneApp extends StatelessWidget {
  final player = AudioCache();
  final colors = [
    Colors.red,
    Colors.orange,
    Colors.yellow,
    Colors.green,
    Colors.greenAccent,
    Colors.blue,
    Colors.purple
  ];

  List<Widget> buildKeys() {
    List<Widget> keys = [];
    for (var i = 0; i < 7; i++) {
      keys.add(buildKey(i));
    }

    return keys;
  }

  Expanded buildKey(int number) {
    final key = number + 1;
    return Expanded(
      child: FlatButton(
        color: colors[number],
        onPressed: () {
          player.play('note$key.wav');
        },
        child: null,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: buildKeys(),
            ),
          ),
        ),
      ),
    );
  }
}
