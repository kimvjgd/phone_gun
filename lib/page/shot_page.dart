import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:phone_gun/controller/gun_controller.dart';

class ShotPage extends StatelessWidget {
  const ShotPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(GunController());
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'asd',
              style: TextStyle(fontSize: 50, color: Colors.black),
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
