// Copyright 2018 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.
// https://www.youtube.com/watch?v=V1nU25DLc2E

import 'dart:math';
import 'package:flutter/material.dart';
import 'package:german_words/german_words.dart';
import 'package:english_words/english_words.dart';
import 'package:audioplayers/audio_cache.dart';

const audioPath = "file_example_WAV_1MG.wav";
const alarmAudioPath = "sound_alarm.mp3";

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'KinderKommtIhrBitte',
      home: TextAndIconButton(),
    );
  }
}

class RandomWordsState extends State<RandomWords> {
  final _suggestions = <WordPair>[];
  final _biggerFont = const TextStyle(
    fontSize: 33.0,
    fontWeight: FontWeight.w900,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Kinder'),
      ),
      body: _buildSuggestions(),
    );
  }

  Widget _buildRow(WordPair pair) {
    int _random = Random().nextInt(germanWords.length);
    random(int ran) => _random = ran;
    return ListTile(
      title: Text(
        // germanWords.length.toString(),
        pair.asPascalCase,
        style: _biggerFont,
      ),
    );
  }

  Widget _buildSuggestions() {
    return ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemBuilder: (context, i) {
          if (i.isOdd) return Divider();
          final index = i ~/ 2;
          if (index >= _suggestions.length) {
            _suggestions.addAll(generateWordPairs().take(10));
          }
          return _buildRow(_suggestions[index]);
        });
  }
}

class TextAndIconButton extends StatelessWidget {
  static AudioCache player = new AudioCache();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Text test'),
      ),
      body: Center(
        child: FlatButton.icon(
          color: Colors.blue,
          icon: Icon(Icons.android), //`Icon` to display
          label: Text('play'), //`Text` to display
          onPressed: () {
            player.play(audioPath);
          },
        ),
      ),
    );
  }
}

class RandomWords extends StatefulWidget {
  @override
  RandomWordsState createState() => RandomWordsState();
// TextAndIconButton()
}
