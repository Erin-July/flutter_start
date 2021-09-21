// import 'dart:convert';
//
//
// import 'package:startup_namer/Tools/dioHelper.dart';
// import 'package:flutter/material.dart';
// import 'package:startup_namer/Model/UserModel.dart';
//
// class FriendsProvider with ChangeNotifier {
//   List<UserModel> friends = <UserModel>[];
//   FriendsProvider() {
//     initFriends();
//   }
//   initFriends() async {
//     var dio = DioHelper().dio;
//     var result = await dio.get('/contacts/getList');
//
//     if (result.data != null) {
//       var users = result.data;
//       var i = 0;
//       for (i = 0; i < users.length; i++) {
//         UserModel model = UserModel.fromJson(users[i]);
//         await SqliteHelper().addNewUser(model.userId);
//       }
//     }
//   }
//
//   getAllUsers() async {
//     friends = await SqliteHelper().getAllUsers();
//     notifyListeners();
//   }
// }
