// ignore_for_file: use_key_in_widget_constructors, todo

import 'dart:math';

import 'package:flutter/material.dart';

//https://medium.com/flutter-community/flutter-layout-cheat-sheet-5363348d037e

//This app makes use of the Row, Column,
//Expanded, Padding, Transform, Container,
//BoxDecoration, BoxShape, Colors,
//Border, Center, Align, Alignment,
//EdgeInsets, Text, and TextStyle Widgets
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //first level widget of Material Design
      home: Scaffold(
        //default route
        backgroundColor: Colors.blueGrey,
        appBar: AppBar(
          title: const Text("App1 - UI Layout"),
          backgroundColor: Colors.blue,
        ),
        body: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            //TODO: Put your code here to complete this app.
            Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Container(
                      height: 100,
                      width: 100,
                      decoration: BoxDecoration(
                        color: Colors.amber,
                        border: Border.all(
                          width: 3,
                          color: Colors.black,
                        ),
                      ),
                      child: const Center(
                        child: Text('Container 1'),
                      )),
                ),
                Transform.rotate(
                  angle: pi / 4,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Container(
                      height: 100,
                      width: 100,
                      alignment: Alignment.center,
                      color: Colors.white,
                      child: const Center(
                        child: Text('Container 2'),
                      ),
                    ),
                  ),
                )
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      children: <Widget>[
                        Expanded(
                          child: Container(
                            width: 100,
                            decoration: const BoxDecoration(
                              color: Colors.yellow,
                            ),
                            child: const Align(
                              alignment: Alignment.bottomCenter,
                              child: Text('Container 3'),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      children: <Widget>[
                        Expanded(
                          child: Container(
                            width: 100,
                            decoration: const BoxDecoration(
                              color: Colors.blue,
                            ),
                            child: const Align(
                              alignment: Alignment.centerRight,
                              child: Text('Container 4'),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Column(
              children: <Widget>[
                Expanded(
                  flex: 2,
                  child: Container(
                      height: 100,
                      width: 100,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.black,
                        border: Border.all(
                          width: 3,
                          color: Colors.white,
                        ),
                      ),
                      child: const Center(
                        child: Text(
                          'Container 5',
                          style: TextStyle(color: Colors.white),
                        ),
                      )),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                      color: Colors.red,
                      width: 100,
                      height: 100,
                      child: const Text(
                        "Con 6",
                        style: TextStyle(fontSize: 30),
                      )),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
