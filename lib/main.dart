import 'package:bride_night/firebase_options.dart';
import 'package:bride_night/layouts/home_page.dart';
import 'package:bride_night/layouts/login.dart';
import 'package:bride_night/model/user.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //notificationApi.initNotification();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await Hive.initFlutter();
  await Hive.openBox('login');
  User _user = await getUserLogin();
  if (_user.id == ''||_user.id == ' ') {
    runApp(const MaterialApp(debugShowCheckedModeBanner: false, home: LoginScreen()));
  } else {
    runApp(MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomePage(
          user: _user,
        )));
  }
}

Future<User> getUserLogin() async {
  await Hive.initFlutter();

  CurrentUser = await Hive.openBox('login').then((value) {
    return User(
        id: value.get('userID', defaultValue: ' '),
        normalUser: value.get('normalUser', defaultValue: true) as bool,
        userName: value.get('userName', defaultValue: ' ') as String,
        name: value.get('name', defaultValue: ' ') as String,
        password: value.get('password', defaultValue: ' ') as String,
        mobile: value.get('mobile', defaultValue: ' ') as String);
  });
  return CurrentUser!;
}