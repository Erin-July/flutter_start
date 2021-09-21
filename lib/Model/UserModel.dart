import 'package:json_annotation/json_annotation.dart';

// user.g.dart 将在我们运行生成命令后自动生成
part 'UserModel.g.dart';

///这个标注是告诉生成器，这个类是需要生成Model类的
@JsonSerializable()

class UserModel{
  String userId;
  String userName;
  int sta;
  // String userAvatar;

  UserModel({
    required this.userId,
    required this.userName,
    required this.sta
    // required this.userAvatar
  });

  //不同的类使用不同的mixin即可
  factory UserModel.fromJson(Map<String, dynamic> json) => _$UserModelFromJson(json);
  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}