import 'package:audioplayers/audioplayers.dart';
import 'package:get/get.dart';

class GunController extends GetxController {
  String empty = 'empty_shot';
  String reload = 'rifle';
  String shot = 'al47_1';

  void getEmpty(String op_empty) {
    empty = op_empty;
    update();
  }

  void getReload(op_reload) {
    reload = op_reload;
    update();
  }

  void getShot(op_shot) {
    shot = op_shot;
    update();
  }


  void shotSound() {
    final player = AudioCache();
    player.play('shot/p38.mp3');
    print('shot!');
  }
  void reloadSound() {
    final player = AudioCache();
    player.play('reload/sniper.mp3');
    print('shot!');
  }
  void emptySound() {
    final player = AudioCache();
    player.play('empty/empty_shot.mp3');
    print('empty shot... Plz reload!');
  }

}