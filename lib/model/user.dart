import 'package:flutter/foundation.dart';

class User{
  late String id;
  late String name;
  late String userName;
  late String mobile;
  late bool normalUser;
  String? service;
  late String password;
  User({ required this.id,required this.name,required this.userName,required this.mobile,required this.normalUser,required this.password, this.service});
  Map<String, dynamic> toMap() {
    return {
      'Id': id,
      'Name': name,
      'userName': userName,
      'mobile': mobile,
      'normalUser': normalUser,
      'password': password,
      'service': service,
    };
  }
}

