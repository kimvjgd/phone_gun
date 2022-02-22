import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:phone_gun/app/controller/gun_controller.dart';
import 'package:phone_gun/app/page/camera_page.dart';
import 'package:flutter/services.dart';
import 'package:phone_gun/app/page/setting_page.dart';
import 'package:phone_gun/app/page/shot_page.dart';

List<CameraDescription>? cameras;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  cameras = await availableCameras();
  screenSetting();
  await _initHive();
  initService();
  runApp(const MyApp());
}

void initService() {
  Get.put(GunController(), permanent: true);
}

Future<void> screenSetting() async {
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.landscapeLeft,
    DeviceOrientation.landscapeRight,
  ]);
}

Future<void> _initHive() async {
  await Hive.initFlutter();
  await Hive.openBox('myGunBox');
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {

    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: "/",
      getPages: [
        GetPage(name: "/", page: ()=>ShotPage(), transition: Transition.rightToLeftWithFade),
        GetPage(name: "/setting", page: ()=>SettingPage(), transition: Transition.leftToRightWithFade),
        GetPage(name: "/camera", page: ()=>CameraPage(), transition: Transition.fadeIn),
      ],
      debugShowCheckedModeBanner: false,
    );
  }
}



// class MainPage extends StatefulWidget {
//
//
//   @override
//   _MainPageState createState() => _MainPageState();
// }
//
// class _MainPageState extends State<MainPage> {
//
//   int number = 0;
//
//   void initState() {
//     super.initState();
//     ShakeDetector detector = ShakeDetector.autoStart(onPhoneShake: () {
//       setState(() {
//         // shotSound();
//         number++;
//       });
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Text(
//               '$number',
//               style: TextStyle(fontSize: 50, color: Colors.black),
//             ),
//
//           ],
//         ),
//       ),
//     );
//   }
// }
