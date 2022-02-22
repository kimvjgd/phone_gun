import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:phone_gun/app/controller/gun_controller.dart';
import 'package:shake/shake.dart';
import 'package:slide_to_confirm/slide_to_confirm.dart';

class ShotPage extends StatefulWidget {
  const ShotPage({Key? key}) : super(key: key);

  @override
  State<ShotPage> createState() => _ShotPageState();
}

class _ShotPageState extends State<ShotPage> {
  late Box _myGunBox;

  @override
  void initState() {
    Get.find<GunController>().setPlayer();
    String myGun = Hive.box('myGunBox').get('myGun', defaultValue: 'sniper');
    Get.find<GunController>().chooseGun(myGun);

    ShakeDetector detector = ShakeDetector.autoStart(onPhoneShake: () {
        if (Get.find<GunController>().bullets > 0) {
          Get.find<GunController>().shotSound();
        } else {
          Get.find<GunController>().emptySound();
        }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;
    double _value = 20.0;
    return WillPopScope(
      onWillPop: GunController.to.willPopAction,
      child: Scaffold(
        body: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GetBuilder<GunController>(
                  builder: (controller) {
                    return ConfirmationSlider(
                      text: '${controller.nowGun()}    Drag->                      R  e  l  o  a  d',
                      textStyle: TextStyle(color: Colors.white),
                      foregroundColor: Colors.blueGrey,
                      sliderButtonContent: Icon(Icons.autorenew, color: Colors.white,),
                      backgroundColor: Colors.black,
                      width: _size.width*0.9,
                      onConfirmation: () => Get.find<GunController>().reloadSound(),
                    );
                  }
                ),
                SizedBox(
                  height: _size.height*0.4,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      GestureDetector(
                          onTap: (){
                            Get.toNamed('camera');
                          },
                          child: ExtendedImage.asset('assets/image/rifle_scope.png')),
                      Padding(
                        padding: const EdgeInsets.only(right: 20),
                        child: GetBuilder<GunController>(
                          builder: (controller) {
                            return Text(
                              controller.nowBullets().toString(),
                              style: TextStyle(fontSize: 50, color: Colors.black),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    IconButton(
                        onPressed: () {
                          Get.toNamed("/setting");
                        },
                        icon: Icon(Icons.settings,size: 30,)),
                    Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: IconButton(
                          iconSize: 100,
                          onPressed: () {
                            if (Get.find<GunController>().bullets > 0) {
                              Get.find<GunController>().shotSound();
                            } else {
                              Get.find<GunController>().emptySound();
                            }
                          },
                          icon: Icon(Icons.whatshot)),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

}
