// Copyright 2018 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.
// https://www.youtube.com/watch?v=V1nU25DLc2E

import 'package:flutter/material.dart';
import 'package:german_words/german_words.dart';

import 'package:english_words/english_words.dart';

//import 'dart:math';
//
//int _random;
//int get random => _random;
//set random(int ran) => _random = ran;
//
//int _random2 = Random().nextInt(germanWords.length);


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'KinderKommtIhrBitte',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Kinder kommt Ihr bitte!'),
        ),
        body: Center(
          child: RandomWords(),
          // child: Text('Wähle Deine Waffe ' + wordPair.asPascalCase),
        ),
      ),
    );
  }
}

class RandomWordsState extends State<RandomWords> {
  final _suggestions = <WordPair>[];
  final _biggerFont = const TextStyle(fontSize: 18.0);
  @override
  Widget build(BuildContext context) {
    final wordPair = WordPair.random();
    return Text(wordPair.asPascalCase);
  }
}

class RandomWords extends StatefulWidget {
  @override
  RandomWordsState createState() => RandomWordsState();
}
