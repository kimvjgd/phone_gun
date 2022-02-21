import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:hive/hive.dart';
import 'package:phone_gun/app/controller/gun_controller.dart';
import 'package:phone_gun/app/data/model/gun.dart';
import 'package:phone_gun/app/data/repository/gun_storage.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({Key? key}) : super(key: key);

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  List<Gun> _gunStorage = GunStorage().gunList;
  List<String> _gunList = [];

  @override
  void initState() {
    _gunStorage.forEach((gun) {
      _gunList.add(gun.name);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Choose Your Gun'),
        backgroundColor: Colors.black,),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('If you want to shot? \n\nThen shake your phone!\n\n',style: TextStyle(fontSize: 30),),
            GetBuilder<GunController>(builder: (controller){
              return DropdownButton(
                value: controller.nowGun(),
                items: _gunList.map((value){
                  return DropdownMenuItem(value: value,child: Text(value),);
                }).toList(),
                onChanged: (value){
                  setState(() async {
                    await Get.find<GunController>().chooseGun(value.toString());
                    Hive.box('myGunBox').put('myGun', value);
                  });
                },
              );
            }),
          ],
        ),
      ),
    );
  }
}
