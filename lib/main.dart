import 'package:chat_app_messenger/page/home_page.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:localstorage/localstorage.dart';
import 'package:provider/provider.dart';
import 'package:flutter/cupertino.dart';


import 'notify.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  // runApp(MyApp());
  runApp(ChangeNotifierProvider(create: (context) => DarkMode(), child: MyApp()));

}

class MyApp extends StatelessWidget {
  static final String title = 'Google SignIn';
  static final LocalStorage storage = new LocalStorage('localstorage_app');

  @override
  Widget build(BuildContext context) {
    final thmode = Provider.of<DarkMode>(context); ///accessing the variable of provider class
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: title,
      theme:  ThemeData(
        ///here the value of darmode var is updationg by switching
        brightness: thmode.darkMode ? Brightness.dark : Brightness.light,
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomePage(),
    );
  }
}

