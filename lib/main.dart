import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:shake/shake.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MainPage(),
    );
  }
}

class MainPage extends StatefulWidget {


  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {

  void shotSound() {
    final player = AudioCache();
    player.play('shot/sniper-rifle-5989.mp3');
    print('shot!');
  }
  void reloadSound() {
    final player = AudioCache();
    player.play('reload/1911-reload-6248.mp3');
    print('shot!');
  }
  void emptySound() {
    final player = AudioCache();
    player.play('empty/empty_shot.mp3');
    print('empty shot... Plz reload!');
  }


  int number = 0;

  void initState() {
    super.initState();
    ShakeDetector detector = ShakeDetector.autoStart(onPhoneShake: () {
      setState(() {
        shotSound();
        number++;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '$number',
              style: TextStyle(fontSize: 50, color: Colors.black),
            ),
            IconButton(onPressed: (){
              shotSound();
            }, icon: Icon(Icons.whatshot)),
            IconButton(onPressed: (){
              reloadSound();
            }, icon: Icon(Icons.whatshot)),
            IconButton(onPressed: (){
              emptySound();
            }, icon: Icon(Icons.whatshot))

          ],
        ),
      ),
    );
  }
}
