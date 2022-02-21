import 'package:audioplayers/audioplayers.dart';
import 'package:get/get.dart';
import 'package:phone_gun/app/data/model/gun.dart';
import 'package:phone_gun/app/data/repository/gun_storage.dart';
import 'package:shake/shake.dart';

class GunController extends GetxController {
  List<Gun> _gunStorageList = GunStorage().gunList;
  int _nowIndex = 0;
  String nowGunName = '';
  int bullets = 5;
  int burst = 1;


  Future<void> chooseGun(String gunName) async {
    _nowIndex = await _gunStorageList.indexWhere((gun) => gun.name == gunName);
    bullets = _gunStorageList[_nowIndex].bullets;
    burst = _gunStorageList[_nowIndex].burst;
    update();
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
}
