import 'package:bride_night/model/user.dart';
import 'package:bride_night/shared/constants.dart';

register(User user) async{
  await usersCollection.add(user.toMap());
  return;
}