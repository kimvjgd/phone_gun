import 'package:audioplayers/audioplayers.dart';
import 'package:get/get.dart';
import 'package:phone_gun/app/data/model/gun.dart';
import 'package:phone_gun/app/data/repository/gun_storage.dart';
import 'package:shake/shake.dart';

class GunController extends GetxController {

  List<Gun> _gunStorageList = GunStorage().gunList;
  int _nowIndex = 0;
  String nowGunName = '';

  Future<void> chooseGun(String gunName) async {
    _nowIndex = _gunStorageList.indexWhere(
        (gun) => gun.name == gunName
    );
    update();
  }
  String nowGun() {
    return _gunStorageList[_nowIndex].name;
  }


  void shotSound() {
    final player = AudioCache();
    // player.play('shot/p38.mp3');
    player.play('shot/${_gunStorageList[_nowIndex].shot}.mp3');
  }
  void reloadSound() {
    final player = AudioCache();
    // player.play('reload/sniper.mp3');
    player.play('reload/${_gunStorageList[_nowIndex].reload}.mp3');
  }
  void emptySound() {
    final player = AudioCache();
    // player.play('empty/empty_shot.mp3');
    player.play('empty/${_gunStorageList[_nowIndex].empty}.mp3');
  }

}