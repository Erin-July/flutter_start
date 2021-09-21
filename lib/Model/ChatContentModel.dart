import 'package:json_annotation/json_annotation.dart';
import 'package:startup_namer/Model/UserModel.dart';

part 'ChatContentModel.g.dart';

@JsonSerializable()

class ChatContentModel{
  List<UserModel> userIds;
  String lastContent;
  String lastUpdateTime;
  bool ifRead;

  ChatContentModel({
    required this.ifRead,
    required this.lastContent,
    required this.lastUpdateTime,
    required this.userIds
  });

  //不同的类使用不同的mixin即可
  factory ChatContentModel.fromJson(Map<String, dynamic> json) => _$ChatContentModelFromJson(json);
  Map<String, dynamic> toJson() => _$ChatContentModelToJson(this);
}