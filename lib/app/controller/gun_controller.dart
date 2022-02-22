import 'dart:io';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:phone_gun/app/components/message_popup.dart';
import 'package:phone_gun/app/data/model/gun.dart';
import 'package:phone_gun/app/data/repository/gun_storage.dart';
import 'package:shake/shake.dart';
import 'package:vibration/vibration.dart';

class GunController extends GetxController {
  static GunController get to => Get.find();
  List<Gun> _gunStorageList = GunStorage().gunList;
  int _nowIndex = 0;
  String nowGunName = '';
  bool vibMode = false;
  int bullets = 5;
  int burst = 1;


  Future<void> chooseGun(String gunName) async {
    _nowIndex = await _gunStorageList.indexWhere((gun) => gun.name == gunName);
    bullets = _gunStorageList[_nowIndex].bullets;
    burst = _gunStorageList[_nowIndex].burst;
    update();
  }

  void setVib(bool vib) {
    vibMode = vib;
    update();
  }

  int nowGunBullet() {
    return _gunStorageList[_nowIndex].bullets;
  }

  String nowGun() {
    return _gunStorageList[_nowIndex].name;
  }
  int nowBullets() {
    // return _gunStorageList[_nowIndex].bullets;
    return bullets;
  }
  AudioPlayer audioPlayer = AudioPlayer();
  AudioCache player = AudioCache();

  void setPlayer() {
    player = AudioCache(fixedPlayer: audioPlayer);
  }

  void shotSound() {
    if(bullets > burst) {
      bullets -= burst;
    } else {
      bullets = 0;
    }
    audioPlayer.stop();
    player.play('shot/${_gunStorageList[_nowIndex].shot}.mp3',);
    if(vibMode){
      Vibration.vibrate(duration: 50, amplitude: 250);
    }
    update();
  }

  void reloadSound() {
    bullets = _gunStorageList[_nowIndex].bullets;
    audioPlayer.stop();
    player.play('reload/${_gunStorageList[_nowIndex].reload}.mp3');
    update();
  }

  void emptySound() {
    audioPlayer.stop();
    player.play('empty/${_gunStorageList[_nowIndex].empty}.mp3');
  }

  void stopSound() {
    player.clearAll();
  }

  Future<bool> willPopAction() async {
      showDialog(
          context: Get.context!,
          builder: (context) => MessagePopup(
            title: '시스템',
            message: '종료하시겠습니까?',
            okCallback: () {
              exit(0);
            },
            cancelCallback: Get.back,
          ));
      return true;
  }
}
