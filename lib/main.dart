import 'package:chat_app_messenger/page/home_page.dart';
import 'package:chat_app_messenger/state/dark_mode_state.dart';
import 'package:chat_app_messenger/state/login_state.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:localstorage/localstorage.dart';
import 'package:provider/provider.dart';
import 'package:flutter/cupertino.dart';


import 'bloc/dark_mode_bloc.dart';
import 'bloc/login_bloc.dart';
import 'notify.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  // runApp(MyApp());
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider<DarkModeBloc>(
          create: (context) => DarkModeBloc(DarkModeState(false)),
        ),
        BlocProvider<LogInLogOutBloc>(
          create: (context) => LogInLogOutBloc(LoginState(false)),
        ),
      ],
      child: MyApp(),
    ),

    // BlocProvider<DarkModeBloc>(
    //   create: (context) => DarkModeBloc(DarkModeState(false)),
    //   child: MyApp(),
    // ),
  );

}

class MyApp extends StatelessWidget {
  static final String title = 'Google SignIn';
  static final LocalStorage storage = new LocalStorage('localstorage_app');

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DarkModeBloc, DarkModeState>(builder: (context, state) {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: title,
        theme: ThemeData(
          brightness: state.darkMode ? Brightness.dark : Brightness.light,
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: HomePage(),
      );
    });
  }
}

