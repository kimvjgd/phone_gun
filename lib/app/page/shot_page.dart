import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:phone_gun/app/controller/gun_controller.dart';
import 'package:shake/shake.dart';

class ShotPage extends StatefulWidget {
  const ShotPage({Key? key}) : super(key: key);

  @override
  State<ShotPage> createState() => _ShotPageState();
}

class _ShotPageState extends State<ShotPage> {
  late Box _myGunBox;

  @override
  void initState() {
    String myGun = Hive.box('myGunBox').get('myGun', defaultValue: 'sniper');
    Get.find<GunController>().chooseGun(myGun);

    ShakeDetector detector = ShakeDetector.autoStart(onPhoneShake: () {
      setState(() {
        // shotSound();
        Get.find<GunController>().shotSound();
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double _value = 0.0;
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Slider(
                min: 0,
                max: 100,
                value: _value,
                onChanged: (value) {
                  setState(() {
                    _value = value;
                  });
                }),
            IconButton(
                onPressed: () {
                  Get.toNamed("/setting");
                },
                icon: Icon(Icons.settings)),
            GetBuilder<GunController>(
              builder: (controller) {
                return Text(
                  controller.nowGun(),
                  style: TextStyle(fontSize: 50, color: Colors.black),
                );
              },
            ),
            IconButton(
                onPressed: () {
                  Get.find<GunController>().shotSound();
                },
                icon: Icon(Icons.whatshot)),
            IconButton(
                onPressed: () {
                  // reloadSound();
                  Get.find<GunController>().reloadSound();
                },
                icon: Icon(Icons.whatshot)),
            IconButton(
                onPressed: () {
                  Get.find<GunController>().emptySound();
                },
                icon: Icon(Icons.whatshot)),
          ],
        ),
      ),
    );
  }
}
