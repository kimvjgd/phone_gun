import 'package:phone_gun/app/data/model/gun.dart';

class GunStorage {

  List<Gun> gunList = [
    Gun(name: 'sniper', bullets: 5, shot: 'sniper', reload: 'sniper', empty: 'empty_shot'),
    Gun(name: 'ak47_1', bullets: 30, shot: 'ak47_1', reload: 'rifle', empty: 'empty_shot'),
    Gun(name: 'ak47_2', bullets: 30, shot: 'ak47_2', reload: 'rifle', empty: 'empty_shot'),
    Gun(name: 'machinegun_1', bullets: 100, shot: 'machinegun_1', reload: 'rifle', empty: 'empty_shot'),
    Gun(name: 'machinegun_2', bullets: 100, shot: 'machinegun_2', reload: 'rifle', empty: 'empty_shot'),
    Gun(name: 'machinegun_3', bullets: 100, shot: 'machinegun_3', reload: 'rifle', empty: 'empty_shot'),
    Gun(name: 'machinegun_4', bullets: 100, shot: 'machinegun_4', reload: 'rifle', empty: 'empty_shot'),
    Gun(name: 'uzi', bullets: 25, shot: 'uzi', reload: 'rifle', empty: 'empty_shot'),
    Gun(name: 'shotgun_1', bullets: 8, shot: 'shotgun_1', reload: 'shotgun', empty: 'empty_shot'),
    Gun(name: 'shotgun_2', bullets: 8, shot: 'shotgun_2', reload: 'shotgun', empty: 'empty_shot'),
    Gun(name: '9mm_pistol', bullets: 15, shot: '9mm_pistol', reload: 'revolver_2', empty: 'empty_shot'),
    Gun(name: 'desert_eagle_1', bullets: 7, shot: 'desert_eagle_1', reload: 'revolver_2', empty: 'empty_shot'),
    Gun(name: 'desert_eagle_2', bullets: 7, shot: 'desert_eagle_2', reload: 'revolver_2', empty: 'empty_shot'),
    Gun(name: 'glock19', bullets: 15, shot: 'glock19', reload: 'revolver_2', empty: 'empty_shot'),
    Gun(name: 'p38', bullets: 8, shot: 'p38', reload: 'revolver_2', empty: 'empty_shot'),
    Gun(name: 'pistol', bullets: 7, shot: 'pistol', reload: 'revolver_2', empty: 'empty_shot'),
  ];

}