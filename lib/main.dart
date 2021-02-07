import 'package:fbitcolor/constants/app_theme.dart';
import 'package:fbitcolor/ui/home/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
    DeviceOrientation.landscapeRight,
    DeviceOrientation.landscapeLeft,
  ]).then((_) async {
    // appComponent = await AppComponent.create(
    //   NetworkModule(),
    //   LocalModule(),
    //   PreferenceModule(),
    // );
    runApp(MyApp());
  });
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fbit Color',
      debugShowCheckedModeBanner: false,
      theme: themeDataDark,
      home: Home(),
    );
  }
}
