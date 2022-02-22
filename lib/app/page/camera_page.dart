import 'package:camera/camera.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:phone_gun/app/controller/gun_controller.dart';
import 'package:phone_gun/main.dart';

class CameraPage extends StatefulWidget {
  const CameraPage({Key? key}) : super(key: key);

  @override
  _CameraPageState createState() => _CameraPageState();
}

class _CameraPageState extends State<CameraPage> {
  bool _cameraAvailable = false;
  late CameraController controller;

  @override
  void initState() {
    if (cameras != null) {
      controller = CameraController(cameras![0], ResolutionPreset.max);
      _cameraAvailable = true;
    }
    controller.initialize().then((_) {
      if (!mounted) {
        return;
      }
      setState(() {});
    });
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;
    double _height = _size.height;
    return Scaffold(
      body: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
            width: Get.size.width*0.8,
            child: CameraPreview(
              controller,
              child: Center(
                child: ExtendedImage.asset(
                  'assets/image/scope.png',
                  width: _height * 0.8,
                  height: _height * 0.8,
                ),
              ),
            ),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GetBuilder<GunController>(
                    builder: (builder) {
                      return Text('${GunController.to.bullets}/${GunController.to.nowGunBullet()}',);
                    },),
                IconButton(onPressed: (){
                  if (GunController.to.bullets > 0) {
                    GunController.to.shotSound();
                  } else {
                    GunController.to.emptySound();
                  }

                }, icon: Icon(Icons.whatshot)),
                IconButton(onPressed: (){
                  GunController.to.reloadSound();
                }, icon: Icon(Icons.autorenew)),
                IconButton(onPressed: (){
                  Get.back();
                }, icon: Icon(Icons.logout)),
              ],
            ),
          )
        ],
      ),
    );
  }
}
